package com.google.android.gms.common.api;

import com.google.android.gms.common.data.DataHolder;

public abstract class zzc
  implements Releasable, Result
{
  protected final Status zzHb;
  protected final DataHolder zzMd;

  protected zzc(DataHolder paramDataHolder)
  {
    this(paramDataHolder, new Status(paramDataHolder.getStatusCode()));
  }

  protected zzc(DataHolder paramDataHolder, Status paramStatus)
  {
    this.zzHb = paramStatus;
    this.zzMd = paramDataHolder;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  public void release()
  {
    if (this.zzMd != null)
      this.zzMd.close();
  }
}