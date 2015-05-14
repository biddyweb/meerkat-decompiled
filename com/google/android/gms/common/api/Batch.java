package com.google.android.gms.common.api;

import android.os.Looper;
import java.util.ArrayList;
import java.util.List;

public final class Batch extends AbstractPendingResult<BatchResult>
{
  private int zzLW;
  private boolean zzLX;
  private boolean zzLY;
  private final PendingResult<?>[] zzLZ;
  private final Object zznh = new Object();

  private Batch(List<PendingResult<?>> paramList, Looper paramLooper)
  {
    super(new AbstractPendingResult.CallbackHandler(paramLooper));
    this.zzLW = paramList.size();
    this.zzLZ = new PendingResult[this.zzLW];
    for (int i = 0; i < paramList.size(); i++)
    {
      PendingResult localPendingResult = (PendingResult)paramList.get(i);
      this.zzLZ[i] = localPendingResult;
      localPendingResult.addBatchCallback(new PendingResult.BatchCallback()
      {
        public void zzl(Status paramAnonymousStatus)
        {
          while (true)
          {
            synchronized (Batch.zza(Batch.this))
            {
              if (Batch.this.isCanceled())
                return;
              if (paramAnonymousStatus.isCanceled())
              {
                Batch.zza(Batch.this, true);
                Batch.zzb(Batch.this);
                if (Batch.zzc(Batch.this) == 0)
                {
                  if (!Batch.zzd(Batch.this))
                    break;
                  Batch.zze(Batch.this);
                }
                return;
              }
            }
            if (!paramAnonymousStatus.isSuccess())
              Batch.zzb(Batch.this, true);
          }
          if (Batch.zzf(Batch.this));
          for (Status localStatus = new Status(13); ; localStatus = Status.zzNo)
          {
            Batch.this.setResult(new BatchResult(localStatus, Batch.zzg(Batch.this)));
            break;
          }
        }
      });
    }
  }

  public void cancel()
  {
    super.cancel();
    PendingResult[] arrayOfPendingResult = this.zzLZ;
    int i = arrayOfPendingResult.length;
    for (int j = 0; j < i; j++)
      arrayOfPendingResult[j].cancel();
  }

  public BatchResult createFailedResult(Status paramStatus)
  {
    return new BatchResult(paramStatus, this.zzLZ);
  }

  public static final class Builder
  {
    private List<PendingResult<?>> zzMb = new ArrayList();
    private Looper zzMc;

    public Builder(GoogleApiClient paramGoogleApiClient)
    {
      this.zzMc = paramGoogleApiClient.getLooper();
    }

    public <R extends Result> BatchResultToken<R> add(PendingResult<R> paramPendingResult)
    {
      BatchResultToken localBatchResultToken = new BatchResultToken(this.zzMb.size());
      this.zzMb.add(paramPendingResult);
      return localBatchResultToken;
    }

    public Batch build()
    {
      return new Batch(this.zzMb, this.zzMc, null);
    }
  }
}