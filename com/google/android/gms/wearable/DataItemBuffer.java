package com.google.android.gms.wearable;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;
import com.google.android.gms.wearable.internal.zzr;

public class DataItemBuffer extends zzg<DataItem>
  implements Result
{
  private final Status zzHb;

  public DataItemBuffer(DataHolder paramDataHolder)
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

  protected DataItem zzw(int paramInt1, int paramInt2)
  {
    return new zzr(this.zzMd, paramInt1, paramInt2);
  }
}