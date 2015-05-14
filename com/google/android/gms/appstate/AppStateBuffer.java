package com.google.android.gms.appstate;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class AppStateBuffer extends AbstractDataBuffer<AppState>
{
  public AppStateBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public AppState get(int paramInt)
  {
    return new zzb(this.zzMd, paramInt);
  }
}