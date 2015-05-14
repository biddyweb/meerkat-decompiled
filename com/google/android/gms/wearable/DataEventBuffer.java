package com.google.android.gms.wearable;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;
import com.google.android.gms.wearable.internal.zzk;

public class DataEventBuffer extends zzg<DataEvent>
  implements Result
{
  private final Status zzHb;

  public DataEventBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
    this.zzHb = new Status(paramDataHolder.getStatusCode());
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  protected String zziB()
  {
    return "path";
  }

  protected DataEvent zzv(int paramInt1, int paramInt2)
  {
    return new zzk(this.zzMd, paramInt1, paramInt2);
  }
}