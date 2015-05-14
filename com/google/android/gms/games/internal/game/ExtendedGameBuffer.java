package com.google.android.gms.games.internal.game;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class ExtendedGameBuffer extends zzg<ExtendedGame>
{
  public ExtendedGameBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_game_id";
  }

  protected ExtendedGame zzn(int paramInt1, int paramInt2)
  {
    return new ExtendedGameRef(this.zzMd, paramInt1, paramInt2);
  }
}