package com.google.android.gms.games.request;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class GameRequestBuffer extends zzg<GameRequest>
{
  public GameRequestBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_request_id";
  }

  protected GameRequest zzt(int paramInt1, int paramInt2)
  {
    return new GameRequestRef(this.zzMd, paramInt1, paramInt2);
  }
}