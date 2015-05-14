package com.google.android.gms.common.api;

import android.os.Looper;
import com.google.android.gms.common.internal.zzx;

public final class PendingResults
{
  public static PendingResult<Status> canceledPendingResult()
  {
    zzg localzzg = new zzg(Looper.getMainLooper());
    localzzg.cancel();
    return localzzg;
  }

  public static <R extends Result> PendingResult<R> canceledPendingResult(R paramR)
  {
    zzx.zzb(paramR, "Result must not be null");
    if (paramR.getStatus().getStatusCode() == 16);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Status code must be CommonStatusCodes.CANCELED");
      zza localzza = new zza(paramR);
      localzza.cancel();
      return localzza;
    }
  }

  public static <R extends Result> PendingResult<R> immediatePendingResult(R paramR)
  {
    zzx.zzb(paramR, "Result must not be null");
    zzb localzzb = new zzb();
    localzzb.setResult(paramR);
    return localzzb;
  }

  public static PendingResult<Status> immediatePendingResult(Status paramStatus)
  {
    zzx.zzb(paramStatus, "Result must not be null");
    zzg localzzg = new zzg(Looper.getMainLooper());
    localzzg.setResult(paramStatus);
    return localzzg;
  }

  private static final class zza<R extends Result> extends AbstractPendingResult<R>
  {
    private final R zzNm;

    public zza(R paramR)
    {
      super();
      this.zzNm = paramR;
    }

    protected R createFailedResult(Status paramStatus)
    {
      if (paramStatus.getStatusCode() != this.zzNm.getStatus().getStatusCode())
        throw new UnsupportedOperationException("Creating failed results is not supported");
      return this.zzNm;
    }
  }

  private static final class zzb<R extends Result> extends AbstractPendingResult<R>
  {
    public zzb()
    {
      super();
    }

    protected R createFailedResult(Status paramStatus)
    {
      throw new UnsupportedOperationException("Creating failed results is not supported");
    }
  }
}