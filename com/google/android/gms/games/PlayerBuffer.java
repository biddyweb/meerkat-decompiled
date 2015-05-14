package com.google.android.gms.games;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class PlayerBuffer extends AbstractDataBuffer<Player>
{
  public PlayerBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public Player get(int paramInt)
  {
    return new PlayerRef(this.zzMd, paramInt);
  }
}