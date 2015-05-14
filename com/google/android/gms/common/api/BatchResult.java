package com.google.android.gms.common.api;

import com.google.android.gms.common.internal.zzx;
import java.util.concurrent.TimeUnit;

public final class BatchResult
  implements Result
{
  private final Status zzHb;
  private final PendingResult<?>[] zzLZ;

  BatchResult(Status paramStatus, PendingResult<?>[] paramArrayOfPendingResult)
  {
    this.zzHb = paramStatus;
    this.zzLZ = paramArrayOfPendingResult;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  public <R extends Result> R take(BatchResultToken<R> paramBatchResultToken)
  {
    if (paramBatchResultToken.mId < this.zzLZ.length);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "The result token does not belong to this batch");
      return this.zzLZ[paramBatchResultToken.mId].await(0L, TimeUnit.MILLISECONDS);
    }
  }
}