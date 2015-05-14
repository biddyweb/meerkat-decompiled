package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.zztv;

public final class MomentBuffer extends AbstractDataBuffer<Moment>
{
  public MomentBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public Moment get(int paramInt)
  {
    return new zztv(this.zzMd, paramInt);
  }
}