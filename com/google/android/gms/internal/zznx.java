package com.google.android.gms.internal;

import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.PendingResult.BatchCallback;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import java.util.concurrent.TimeUnit;

class zznx<T extends Result>
  implements PendingResult<T>
{
  private final T zzZX;

  zznx(T paramT)
  {
    this.zzZX = paramT;
  }

  public void addBatchCallback(PendingResult.BatchCallback paramBatchCallback)
  {
    paramBatchCallback.zzl(this.zzZX.getStatus());
  }

  public T await()
  {
    return this.zzZX;
  }

  public T await(long paramLong, TimeUnit paramTimeUnit)
  {
    return this.zzZX;
  }

  public void cancel()
  {
  }

  public boolean isCanceled()
  {
    return false;
  }

  public void setResultCallback(ResultCallback<T> paramResultCallback)
  {
    paramResultCallback.onResult(this.zzZX);
  }

  public void setResultCallback(ResultCallback<T> paramResultCallback, long paramLong, TimeUnit paramTimeUnit)
  {
    paramResultCallback.onResult(this.zzZX);
  }
}