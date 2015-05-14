package com.google.android.gms.wearable.internal;

import com.google.android.gms.wearable.DataEvent;
import com.google.android.gms.wearable.DataItem;

public class zzj
  implements DataEvent
{
  private int zzJp;
  private DataItem zzaGc;

  public zzj(DataEvent paramDataEvent)
  {
    this.zzJp = paramDataEvent.getType();
    this.zzaGc = ((DataItem)paramDataEvent.getDataItem().freeze());
  }

  public DataItem getDataItem()
  {
    return this.zzaGc;
  }

  public int getType()
  {
    return this.zzJp;
  }

  public boolean isDataValid()
  {
    return true;
  }

  public DataEvent zzvh()
  {
    return this;
  }
}