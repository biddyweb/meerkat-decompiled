package com.google.android.exoplayer.upstream;

import android.annotation.SuppressLint;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.util.concurrent.ExecutorService;

public final class Loader
{
  private static final int MSG_END_OF_SOURCE = 0;
  private static final int MSG_ERROR = 1;
  private LoadTask currentTask;
  private final ExecutorService downloadExecutorService;
  private boolean loading;

  public Loader(String paramString)
  {
    this.downloadExecutorService = Util.newSingleThreadExecutor(paramString);
  }

  public void cancelLoading()
  {
    Assertions.checkState(this.loading);
    this.currentTask.quit();
  }

  public boolean isLoading()
  {
    return this.loading;
  }

  public void release()
  {
    if (this.loading)
      cancelLoading();
    this.downloadExecutorService.shutdown();
  }

  public void startLoading(Looper paramLooper, Loadable paramLoadable, Callback paramCallback)
  {
    if (!this.loading);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.loading = true;
      this.currentTask = new LoadTask(paramLooper, paramLoadable, paramCallback);
      this.downloadExecutorService.submit(this.currentTask);
      return;
    }
  }

  public void startLoading(Loadable paramLoadable, Callback paramCallback)
  {
    Looper localLooper = Looper.myLooper();
    if (localLooper != null);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      startLoading(localLooper, paramLoadable, paramCallback);
      return;
    }
  }

  public static abstract interface Callback
  {
    public abstract void onLoadCanceled(Loader.Loadable paramLoadable);

    public abstract void onLoadCompleted(Loader.Loadable paramLoadable);

    public abstract void onLoadError(Loader.Loadable paramLoadable, IOException paramIOException);
  }

  @SuppressLint({"HandlerLeak"})
  private final class LoadTask extends Handler
    implements Runnable
  {
    private static final String TAG = "LoadTask";
    private final Loader.Callback callback;
    private volatile Thread executorThread;
    private final Loader.Loadable loadable;

    public LoadTask(Looper paramLoadable, Loader.Loadable paramCallback, Loader.Callback arg4)
    {
      super();
      this.loadable = paramCallback;
      Object localObject;
      this.callback = localObject;
    }

    private void onFinished()
    {
      Loader.access$002(Loader.this, false);
      Loader.access$102(Loader.this, null);
    }

    public void handleMessage(Message paramMessage)
    {
      onFinished();
      if (this.loadable.isLoadCanceled())
      {
        this.callback.onLoadCanceled(this.loadable);
        return;
      }
      switch (paramMessage.what)
      {
      default:
        return;
      case 0:
        this.callback.onLoadCompleted(this.loadable);
        return;
      case 1:
      }
      this.callback.onLoadError(this.loadable, (IOException)paramMessage.obj);
    }

    public void quit()
    {
      this.loadable.cancelLoad();
      if (this.executorThread != null)
        this.executorThread.interrupt();
    }

    public void run()
    {
      try
      {
        this.executorThread = Thread.currentThread();
        if (!this.loadable.isLoadCanceled())
          this.loadable.load();
        sendEmptyMessage(0);
        return;
      }
      catch (IOException localIOException)
      {
        obtainMessage(1, localIOException).sendToTarget();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        Assertions.checkState(this.loadable.isLoadCanceled());
        sendEmptyMessage(0);
        return;
      }
      catch (Exception localException)
      {
        Log.e("LoadTask", "Unexpected error loading stream", localException);
        obtainMessage(1, new Loader.UnexpectedLoaderException(localException)).sendToTarget();
      }
    }
  }

  public static abstract interface Loadable
  {
    public abstract void cancelLoad();

    public abstract boolean isLoadCanceled();

    public abstract void load()
      throws IOException, InterruptedException;
  }

  public static final class UnexpectedLoaderException extends IOException
  {
    public UnexpectedLoaderException(Exception paramException)
    {
      super(paramException);
    }
  }
}