package com.google.android.exoplayer.util;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.upstream.Loader.Callback;
import com.google.android.exoplayer.upstream.Loader.Loadable;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.CancellationException;

public class ManifestFetcher<T>
  implements Loader.Callback
{
  final String contentId;
  private ManifestFetcher<T>.ManifestLoadable currentLoadable;
  private int enabledCount;
  private final Handler eventHandler;
  private final EventListener eventListener;
  private IOException loadException;
  private int loadExceptionCount;
  private long loadExceptionTimestamp;
  private Loader loader;
  private volatile T manifest;
  private volatile long manifestLoadTimestamp;
  volatile String manifestUrl;
  final ManifestParser<T> parser;
  final String userAgent;

  public ManifestFetcher(ManifestParser<T> paramManifestParser, String paramString1, String paramString2, String paramString3)
  {
    this(paramManifestParser, paramString1, paramString2, paramString3, null, null);
  }

  public ManifestFetcher(ManifestParser<T> paramManifestParser, String paramString1, String paramString2, String paramString3, Handler paramHandler, EventListener paramEventListener)
  {
    this.parser = paramManifestParser;
    this.contentId = paramString1;
    this.manifestUrl = paramString2;
    this.userAgent = paramString3;
    this.eventHandler = paramHandler;
    this.eventListener = paramEventListener;
  }

  private long getRetryDelayMillis(long paramLong)
  {
    return Math.min(1000L * (paramLong - 1L), 5000L);
  }

  private void notifyManifestError(final IOException paramIOException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ManifestFetcher.this.eventListener.onManifestError(paramIOException);
        }
      });
  }

  private void notifyManifestRefreshStarted()
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ManifestFetcher.this.eventListener.onManifestRefreshStarted();
        }
      });
  }

  private void notifyManifestRefreshed()
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ManifestFetcher.this.eventListener.onManifestRefreshed();
        }
      });
  }

  public void disable()
  {
    int i = -1 + this.enabledCount;
    this.enabledCount = i;
    if ((i == 0) && (this.loader != null))
    {
      this.loader.release();
      this.loader = null;
    }
  }

  public void enable()
  {
    int i = this.enabledCount;
    this.enabledCount = (i + 1);
    if (i == 0)
    {
      this.loadExceptionCount = 0;
      this.loadException = null;
    }
  }

  public IOException getError()
  {
    if (this.loadExceptionCount <= 1)
      return null;
    return this.loadException;
  }

  public T getManifest()
  {
    return this.manifest;
  }

  public long getManifestLoadTimestamp()
  {
    return this.manifestLoadTimestamp;
  }

  public void onLoadCanceled(Loader.Loadable paramLoadable)
  {
  }

  public void onLoadCompleted(Loader.Loadable paramLoadable)
  {
    if (this.currentLoadable != paramLoadable)
      return;
    this.manifest = this.currentLoadable.result;
    this.manifestLoadTimestamp = SystemClock.elapsedRealtime();
    this.loadExceptionCount = 0;
    this.loadException = null;
    notifyManifestRefreshed();
  }

  public void onLoadError(Loader.Loadable paramLoadable, IOException paramIOException)
  {
    if (this.currentLoadable != paramLoadable)
      return;
    this.loadExceptionCount = (1 + this.loadExceptionCount);
    this.loadExceptionTimestamp = SystemClock.elapsedRealtime();
    this.loadException = new IOException(paramIOException);
    notifyManifestError(this.loadException);
  }

  public void requestRefresh()
  {
    if ((this.loadException != null) && (SystemClock.elapsedRealtime() < this.loadExceptionTimestamp + getRetryDelayMillis(this.loadExceptionCount)));
    do
    {
      return;
      if (this.loader == null)
        this.loader = new Loader("manifestLoader");
    }
    while (this.loader.isLoading());
    this.currentLoadable = new ManifestLoadable(null);
    this.loader.startLoading(this.currentLoadable, this);
    notifyManifestRefreshStarted();
  }

  public void singleLoad(Looper paramLooper, ManifestCallback<T> paramManifestCallback)
  {
    new SingleFetchHelper(paramLooper, paramManifestCallback).startLoading();
  }

  public void updateManifestUrl(String paramString)
  {
    this.manifestUrl = paramString;
  }

  public static abstract interface EventListener
  {
    public abstract void onManifestError(IOException paramIOException);

    public abstract void onManifestRefreshStarted();

    public abstract void onManifestRefreshed();
  }

  public static abstract interface ManifestCallback<T>
  {
    public abstract void onManifest(String paramString, T paramT);

    public abstract void onManifestError(String paramString, IOException paramIOException);
  }

  private class ManifestLoadable
    implements Loader.Loadable
  {
    private static final int TIMEOUT_MILLIS = 10000;
    private volatile boolean isCanceled;
    volatile T result;

    private ManifestLoadable()
    {
    }

    private URLConnection configureConnection(URL paramURL)
      throws IOException
    {
      URLConnection localURLConnection = paramURL.openConnection();
      localURLConnection.setConnectTimeout(10000);
      localURLConnection.setReadTimeout(10000);
      localURLConnection.setDoOutput(false);
      localURLConnection.setRequestProperty("User-Agent", ManifestFetcher.this.userAgent);
      localURLConnection.connect();
      return localURLConnection;
    }

    public void cancelLoad()
    {
      this.isCanceled = true;
    }

    public boolean isLoadCanceled()
    {
      return this.isCanceled;
    }

    public void load()
      throws IOException, InterruptedException
    {
      InputStream localInputStream = null;
      try
      {
        URLConnection localURLConnection = configureConnection(new URL(ManifestFetcher.this.manifestUrl));
        localInputStream = localURLConnection.getInputStream();
        String str = localURLConnection.getContentEncoding();
        this.result = ManifestFetcher.this.parser.parse(localInputStream, str, ManifestFetcher.this.contentId, Util.parseBaseUri(localURLConnection.getURL().toString()));
        return;
      }
      finally
      {
        if (localInputStream != null)
          localInputStream.close();
      }
    }
  }

  private class SingleFetchHelper
    implements Loader.Callback
  {
    private final Looper callbackLooper;
    private final ManifestFetcher<T>.ManifestLoadable singleUseLoadable;
    private final Loader singleUseLoader;
    private final ManifestFetcher.ManifestCallback<T> wrappedCallback;

    public SingleFetchHelper(ManifestFetcher.ManifestCallback<T> arg2)
    {
      Object localObject1;
      this.callbackLooper = localObject1;
      Object localObject2;
      this.wrappedCallback = localObject2;
      this.singleUseLoader = new Loader("manifestLoader:single");
      this.singleUseLoadable = new ManifestFetcher.ManifestLoadable(ManifestFetcher.this, null);
    }

    private void releaseLoader()
    {
      this.singleUseLoader.release();
    }

    public void onLoadCanceled(Loader.Loadable paramLoadable)
    {
      try
      {
        IOException localIOException = new IOException("Load cancelled", new CancellationException());
        this.wrappedCallback.onManifestError(ManifestFetcher.this.contentId, localIOException);
        return;
      }
      finally
      {
        releaseLoader();
      }
    }

    public void onLoadCompleted(Loader.Loadable paramLoadable)
    {
      try
      {
        ManifestFetcher.access$202(ManifestFetcher.this, this.singleUseLoadable.result);
        ManifestFetcher.access$302(ManifestFetcher.this, SystemClock.elapsedRealtime());
        this.wrappedCallback.onManifest(ManifestFetcher.this.contentId, this.singleUseLoadable.result);
        return;
      }
      finally
      {
        releaseLoader();
      }
    }

    public void onLoadError(Loader.Loadable paramLoadable, IOException paramIOException)
    {
      try
      {
        this.wrappedCallback.onManifestError(ManifestFetcher.this.contentId, paramIOException);
        return;
      }
      finally
      {
        releaseLoader();
      }
    }

    public void startLoading()
    {
      this.singleUseLoader.startLoading(this.callbackLooper, this.singleUseLoadable, this);
    }
  }
}