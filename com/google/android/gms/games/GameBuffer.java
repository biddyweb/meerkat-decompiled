package com.google.android.gms.games;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class GameBuffer extends AbstractDataBuffer<Game>
{
  public GameBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public Game get(int paramInt)
  {
    return new GameRef(this.zzMd, paramInt);
  }
}