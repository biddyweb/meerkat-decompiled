package com.squareup.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import java.io.File;
import java.lang.ref.ReferenceQueue;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;

public class Picasso
{
  static final Handler HANDLER = new Picasso.1(Looper.getMainLooper());
  static final String TAG = "Picasso";
  static Picasso singleton = null;
  final Cache cache;
  private final Picasso.CleanupThread cleanupThread;
  final Context context;
  final Dispatcher dispatcher;
  boolean indicatorsEnabled;
  private final Picasso.Listener listener;
  volatile boolean loggingEnabled;
  final ReferenceQueue<Object> referenceQueue;
  private final Picasso.RequestTransformer requestTransformer;
  boolean shutdown;
  final Stats stats;
  final Map<Object, Action> targetToAction;
  final Map<ImageView, DeferredRequestCreator> targetToDeferredRequestCreator;

  Picasso(Context paramContext, Dispatcher paramDispatcher, Cache paramCache, Picasso.Listener paramListener, Picasso.RequestTransformer paramRequestTransformer, Stats paramStats, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.context = paramContext;
    this.dispatcher = paramDispatcher;
    this.cache = paramCache;
    this.listener = paramListener;
    this.requestTransformer = paramRequestTransformer;
    this.stats = paramStats;
    this.targetToAction = new WeakHashMap();
    this.targetToDeferredRequestCreator = new WeakHashMap();
    this.indicatorsEnabled = paramBoolean1;
    this.loggingEnabled = paramBoolean2;
    this.referenceQueue = new ReferenceQueue();
    this.cleanupThread = new Picasso.CleanupThread(this.referenceQueue, HANDLER);
    this.cleanupThread.start();
  }

  private void cancelExistingRequest(Object paramObject)
  {
    Utils.checkMain();
    Action localAction = (Action)this.targetToAction.remove(paramObject);
    if (localAction != null)
    {
      localAction.cancel();
      this.dispatcher.dispatchCancel(localAction);
    }
    if ((paramObject instanceof ImageView))
    {
      ImageView localImageView = (ImageView)paramObject;
      DeferredRequestCreator localDeferredRequestCreator = (DeferredRequestCreator)this.targetToDeferredRequestCreator.remove(localImageView);
      if (localDeferredRequestCreator != null)
        localDeferredRequestCreator.cancel();
    }
  }

  private void deliverAction(Bitmap paramBitmap, Picasso.LoadedFrom paramLoadedFrom, Action paramAction)
  {
    if (paramAction.isCancelled());
    do
    {
      do
      {
        return;
        if (!paramAction.willReplay())
          this.targetToAction.remove(paramAction.getTarget());
        if (paramBitmap == null)
          break;
        if (paramLoadedFrom == null)
          throw new AssertionError("LoadedFrom cannot be null.");
        paramAction.complete(paramBitmap, paramLoadedFrom);
      }
      while (!this.loggingEnabled);
      Utils.log("Main", "completed", paramAction.request.logId(), "from " + paramLoadedFrom);
      return;
      paramAction.error();
    }
    while (!this.loggingEnabled);
    Utils.log("Main", "errored", paramAction.request.logId());
  }

  public static Picasso with(Context paramContext)
  {
    if (singleton == null);
    try
    {
      if (singleton == null)
        singleton = new Builder(paramContext).build();
      return singleton;
    }
    finally
    {
    }
  }

  public boolean areIndicatorsEnabled()
  {
    return this.indicatorsEnabled;
  }

  public void cancelRequest(ImageView paramImageView)
  {
    cancelExistingRequest(paramImageView);
  }

  public void cancelRequest(Target paramTarget)
  {
    cancelExistingRequest(paramTarget);
  }

  void complete(BitmapHunter paramBitmapHunter)
  {
    Action localAction = paramBitmapHunter.getAction();
    List localList = paramBitmapHunter.getActions();
    int i;
    if ((localList != null) && (!localList.isEmpty()))
    {
      i = 1;
      int j;
      if (localAction == null)
      {
        j = 0;
        if (i == 0);
      }
      else
      {
        j = 1;
      }
      if (j != 0)
        break label53;
    }
    label53: Uri localUri;
    Exception localException;
    do
    {
      return;
      i = 0;
      break;
      localUri = paramBitmapHunter.getData().uri;
      localException = paramBitmapHunter.getException();
      Bitmap localBitmap = paramBitmapHunter.getResult();
      Picasso.LoadedFrom localLoadedFrom = paramBitmapHunter.getLoadedFrom();
      if (localAction != null)
        deliverAction(localBitmap, localLoadedFrom, localAction);
      if (i != 0)
      {
        int k = 0;
        int m = localList.size();
        while (k < m)
        {
          deliverAction(localBitmap, localLoadedFrom, (Action)localList.get(k));
          k++;
        }
      }
    }
    while ((this.listener == null) || (localException == null));
    this.listener.onImageLoadFailed(this, localUri, localException);
  }

  void defer(ImageView paramImageView, DeferredRequestCreator paramDeferredRequestCreator)
  {
    this.targetToDeferredRequestCreator.put(paramImageView, paramDeferredRequestCreator);
  }

  void enqueueAndSubmit(Action paramAction)
  {
    Object localObject = paramAction.getTarget();
    if (localObject != null)
    {
      cancelExistingRequest(localObject);
      this.targetToAction.put(localObject, paramAction);
    }
    submit(paramAction);
  }

  public StatsSnapshot getSnapshot()
  {
    return this.stats.createSnapshot();
  }

  @Deprecated
  public boolean isDebugging()
  {
    return (areIndicatorsEnabled()) && (isLoggingEnabled());
  }

  public boolean isLoggingEnabled()
  {
    return this.loggingEnabled;
  }

  public RequestCreator load(int paramInt)
  {
    if (paramInt == 0)
      throw new IllegalArgumentException("Resource ID must not be zero.");
    return new RequestCreator(this, null, paramInt);
  }

  public RequestCreator load(Uri paramUri)
  {
    return new RequestCreator(this, paramUri, 0);
  }

  public RequestCreator load(File paramFile)
  {
    if (paramFile == null)
      return new RequestCreator(this, null, 0);
    return load(Uri.fromFile(paramFile));
  }

  public RequestCreator load(String paramString)
  {
    if (paramString == null)
      return new RequestCreator(this, null, 0);
    if (paramString.trim().length() == 0)
      throw new IllegalArgumentException("Path must not be empty.");
    return load(Uri.parse(paramString));
  }

  Bitmap quickMemoryCacheCheck(String paramString)
  {
    Bitmap localBitmap = this.cache.get(paramString);
    if (localBitmap != null)
    {
      this.stats.dispatchCacheHit();
      return localBitmap;
    }
    this.stats.dispatchCacheMiss();
    return localBitmap;
  }

  @Deprecated
  public void setDebugging(boolean paramBoolean)
  {
    setIndicatorsEnabled(paramBoolean);
  }

  public void setIndicatorsEnabled(boolean paramBoolean)
  {
    this.indicatorsEnabled = paramBoolean;
  }

  public void setLoggingEnabled(boolean paramBoolean)
  {
    this.loggingEnabled = paramBoolean;
  }

  public void shutdown()
  {
    if (this == singleton)
      throw new UnsupportedOperationException("Default singleton instance cannot be shutdown.");
    if (this.shutdown)
      return;
    this.cache.clear();
    this.cleanupThread.shutdown();
    this.stats.shutdown();
    this.dispatcher.shutdown();
    Iterator localIterator = this.targetToDeferredRequestCreator.values().iterator();
    while (localIterator.hasNext())
      ((DeferredRequestCreator)localIterator.next()).cancel();
    this.targetToDeferredRequestCreator.clear();
    this.shutdown = true;
  }

  void submit(Action paramAction)
  {
    this.dispatcher.dispatchSubmit(paramAction);
  }

  Request transformRequest(Request paramRequest)
  {
    Request localRequest = this.requestTransformer.transformRequest(paramRequest);
    if (localRequest == null)
      throw new IllegalStateException("Request transformer " + this.requestTransformer.getClass().getCanonicalName() + " returned null for " + paramRequest);
    return localRequest;
  }

  public static class Builder
  {
    private Cache cache;
    private final Context context;
    private Downloader downloader;
    private boolean indicatorsEnabled;
    private Picasso.Listener listener;
    private boolean loggingEnabled;
    private ExecutorService service;
    private Picasso.RequestTransformer transformer;

    public Builder(Context paramContext)
    {
      if (paramContext == null)
        throw new IllegalArgumentException("Context must not be null.");
      this.context = paramContext.getApplicationContext();
    }

    public Picasso build()
    {
      Context localContext = this.context;
      if (this.downloader == null)
        this.downloader = Utils.createDefaultDownloader(localContext);
      if (this.cache == null)
        this.cache = new LruCache(localContext);
      if (this.service == null)
        this.service = new PicassoExecutorService();
      if (this.transformer == null)
        this.transformer = Picasso.RequestTransformer.IDENTITY;
      Stats localStats = new Stats(this.cache);
      return new Picasso(localContext, new Dispatcher(localContext, this.service, Picasso.HANDLER, this.downloader, this.cache, localStats), this.cache, this.listener, this.transformer, localStats, this.indicatorsEnabled, this.loggingEnabled);
    }

    @Deprecated
    public Builder debugging(boolean paramBoolean)
    {
      return indicatorsEnabled(paramBoolean);
    }

    public Builder downloader(Downloader paramDownloader)
    {
      if (paramDownloader == null)
        throw new IllegalArgumentException("Downloader must not be null.");
      if (this.downloader != null)
        throw new IllegalStateException("Downloader already set.");
      this.downloader = paramDownloader;
      return this;
    }

    public Builder executor(ExecutorService paramExecutorService)
    {
      if (paramExecutorService == null)
        throw new IllegalArgumentException("Executor service must not be null.");
      if (this.service != null)
        throw new IllegalStateException("Executor service already set.");
      this.service = paramExecutorService;
      return this;
    }

    public Builder indicatorsEnabled(boolean paramBoolean)
    {
      this.indicatorsEnabled = paramBoolean;
      return this;
    }

    public Builder listener(Picasso.Listener paramListener)
    {
      if (paramListener == null)
        throw new IllegalArgumentException("Listener must not be null.");
      if (this.listener != null)
        throw new IllegalStateException("Listener already set.");
      this.listener = paramListener;
      return this;
    }

    public Builder loggingEnabled(boolean paramBoolean)
    {
      this.loggingEnabled = paramBoolean;
      return this;
    }

    public Builder memoryCache(Cache paramCache)
    {
      if (paramCache == null)
        throw new IllegalArgumentException("Memory cache must not be null.");
      if (this.cache != null)
        throw new IllegalStateException("Memory cache already set.");
      this.cache = paramCache;
      return this;
    }

    public Builder requestTransformer(Picasso.RequestTransformer paramRequestTransformer)
    {
      if (paramRequestTransformer == null)
        throw new IllegalArgumentException("Transformer must not be null.");
      if (this.transformer != null)
        throw new IllegalStateException("Transformer already set.");
      this.transformer = paramRequestTransformer;
      return this;
    }
  }
}