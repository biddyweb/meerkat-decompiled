package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.internal.ICancelToken;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public abstract class AbstractPendingResult<R extends Result>
  implements PendingResult<R>
{
  protected final CallbackHandler<R> mHandler;
  private final Object zzLK = new Object();
  private final ArrayList<PendingResult.BatchCallback> zzLL = new ArrayList();
  private ResultCallback<R> zzLM;
  private volatile R zzLN;
  private volatile boolean zzLO;
  private boolean zzLP;
  private boolean zzLQ;
  private ICancelToken zzLR;
  private final CountDownLatch zzmx = new CountDownLatch(1);

  protected AbstractPendingResult(Looper paramLooper)
  {
    this.mHandler = new CallbackHandler(paramLooper);
  }

  protected AbstractPendingResult(CallbackHandler<R> paramCallbackHandler)
  {
    this.mHandler = paramCallbackHandler;
  }

  private void zza(R paramR)
  {
    this.zzLN = paramR;
    this.zzLR = null;
    this.zzmx.countDown();
    Status localStatus = this.zzLN.getStatus();
    if (this.zzLM != null)
    {
      this.mHandler.removeTimeoutMessages();
      if (!this.zzLP)
        this.mHandler.sendResultCallback(this.zzLM, zzhQ());
    }
    Iterator localIterator = this.zzLL.iterator();
    while (localIterator.hasNext())
      ((PendingResult.BatchCallback)localIterator.next()).zzl(localStatus);
    this.zzLL.clear();
  }

  static void zzb(Result paramResult)
  {
    if ((paramResult instanceof Releasable));
    try
    {
      ((Releasable)paramResult).release();
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.w("AbstractPendingResult", "Unable to release " + paramResult, localRuntimeException);
    }
  }

  private R zzhQ()
  {
    boolean bool = true;
    synchronized (this.zzLK)
    {
      if (!this.zzLO)
      {
        zzx.zza(bool, "Result has already been consumed.");
        zzx.zza(isReady(), "Result is not ready.");
        Result localResult = this.zzLN;
        this.zzLN = null;
        this.zzLM = null;
        this.zzLO = true;
        onResultConsumed();
        return localResult;
      }
      bool = false;
    }
  }

  private void zzhR()
  {
    synchronized (this.zzLK)
    {
      if (!isReady())
      {
        setResult(createFailedResult(Status.zzNp));
        this.zzLQ = true;
      }
      return;
    }
  }

  public final void addBatchCallback(PendingResult.BatchCallback paramBatchCallback)
  {
    if (!this.zzLO);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Result has already been consumed.");
      synchronized (this.zzLK)
      {
        if (isReady())
        {
          paramBatchCallback.zzl(this.zzLN.getStatus());
          return;
        }
        this.zzLL.add(paramBatchCallback);
      }
    }
  }

  public final R await()
  {
    boolean bool1 = true;
    boolean bool2;
    if (Looper.myLooper() != Looper.getMainLooper())
      bool2 = bool1;
    while (true)
    {
      zzx.zza(bool2, "await must not be called on the UI thread");
      if (!this.zzLO)
        zzx.zza(bool1, "Result has already been consumed");
      try
      {
        this.zzmx.await();
        zzx.zza(isReady(), "Result is not ready.");
        return zzhQ();
        bool2 = false;
        continue;
        bool1 = false;
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
          zzhR();
      }
    }
  }

  public final R await(long paramLong, TimeUnit paramTimeUnit)
  {
    boolean bool1 = true;
    boolean bool2;
    if ((paramLong <= 0L) || (Looper.myLooper() != Looper.getMainLooper()))
      bool2 = bool1;
    while (true)
    {
      zzx.zza(bool2, "await must not be called on the UI thread when time is greater than zero.");
      if (!this.zzLO)
        zzx.zza(bool1, "Result has already been consumed.");
      try
      {
        if (!this.zzmx.await(paramLong, paramTimeUnit))
          zzhS();
        zzx.zza(isReady(), "Result is not ready.");
        return zzhQ();
        bool2 = false;
        continue;
        bool1 = false;
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
          zzhR();
      }
    }
  }

  public void cancel()
  {
    synchronized (this.zzLK)
    {
      if ((this.zzLP) || (this.zzLO))
        return;
      ICancelToken localICancelToken = this.zzLR;
      if (localICancelToken == null);
    }
    try
    {
      this.zzLR.cancel();
      label42: zzb(this.zzLN);
      this.zzLM = null;
      this.zzLP = true;
      zza(createFailedResult(Status.zzNs));
      return;
      localObject2 = finally;
      throw localObject2;
    }
    catch (RemoteException localRemoteException)
    {
      break label42;
    }
  }

  protected abstract R createFailedResult(Status paramStatus);

  public boolean isCanceled()
  {
    synchronized (this.zzLK)
    {
      boolean bool = this.zzLP;
      return bool;
    }
  }

  public final boolean isReady()
  {
    return this.zzmx.getCount() == 0L;
  }

  protected void onResultConsumed()
  {
  }

  protected final void setCancelToken(ICancelToken paramICancelToken)
  {
    synchronized (this.zzLK)
    {
      this.zzLR = paramICancelToken;
      return;
    }
  }

  public final void setResult(R paramR)
  {
    boolean bool1 = true;
    while (true)
    {
      synchronized (this.zzLK)
      {
        if ((this.zzLQ) || (this.zzLP))
        {
          zzb(paramR);
          return;
        }
        if (!isReady())
        {
          bool2 = bool1;
          zzx.zza(bool2, "Results have already been set");
          if (this.zzLO)
            break label81;
          zzx.zza(bool1, "Result has already been consumed");
          zza(paramR);
          return;
        }
      }
      boolean bool2 = false;
      continue;
      label81: bool1 = false;
    }
  }

  public final void setResultCallback(ResultCallback<R> paramResultCallback)
  {
    if (!this.zzLO);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Result has already been consumed.");
      while (true)
      {
        synchronized (this.zzLK)
        {
          if (isCanceled())
            return;
          if (isReady())
          {
            this.mHandler.sendResultCallback(paramResultCallback, zzhQ());
            return;
          }
        }
        this.zzLM = paramResultCallback;
      }
    }
  }

  public final void setResultCallback(ResultCallback<R> paramResultCallback, long paramLong, TimeUnit paramTimeUnit)
  {
    boolean bool1 = true;
    boolean bool2;
    if (!this.zzLO)
    {
      bool2 = bool1;
      zzx.zza(bool2, "Result has already been consumed.");
      if (this.mHandler == null)
        break label114;
    }
    while (true)
    {
      zzx.zza(bool1, "CallbackHandler has not been set before calling setResultCallback.");
      while (true)
      {
        synchronized (this.zzLK)
        {
          if (isCanceled())
            return;
          if (isReady())
          {
            this.mHandler.sendResultCallback(paramResultCallback, zzhQ());
            return;
          }
        }
        this.zzLM = paramResultCallback;
        this.mHandler.sendTimeoutResultCallback(this, paramTimeUnit.toMillis(paramLong));
      }
      bool2 = false;
      break;
      label114: bool1 = false;
    }
  }

  void zzhS()
  {
    synchronized (this.zzLK)
    {
      if (!isReady())
      {
        setResult(createFailedResult(Status.zzNr));
        this.zzLQ = true;
      }
      return;
    }
  }

  public static class CallbackHandler<R extends Result> extends Handler
  {
    public static final int CALLBACK_ON_COMPLETE = 1;
    public static final int CALLBACK_ON_TIMEOUT = 2;

    public CallbackHandler()
    {
      this(Looper.getMainLooper());
    }

    public CallbackHandler(Looper paramLooper)
    {
      super();
    }

    protected void deliverResultCallback(ResultCallback<R> paramResultCallback, R paramR)
    {
      try
      {
        paramResultCallback.onResult(paramR);
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        AbstractPendingResult.zzb(paramR);
        throw localRuntimeException;
      }
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        Log.wtf("AbstractPendingResult", "Don't know how to handle this message.");
        return;
      case 1:
        Pair localPair = (Pair)paramMessage.obj;
        deliverResultCallback((ResultCallback)localPair.first, (Result)localPair.second);
        return;
      case 2:
      }
      ((AbstractPendingResult)paramMessage.obj).zzhS();
    }

    public void removeTimeoutMessages()
    {
      removeMessages(2);
    }

    public void sendResultCallback(ResultCallback<R> paramResultCallback, R paramR)
    {
      sendMessage(obtainMessage(1, new Pair(paramResultCallback, paramR)));
    }

    public void sendTimeoutResultCallback(AbstractPendingResult<R> paramAbstractPendingResult, long paramLong)
    {
      sendMessageDelayed(obtainMessage(2, paramAbstractPendingResult), paramLong);
    }
  }
}