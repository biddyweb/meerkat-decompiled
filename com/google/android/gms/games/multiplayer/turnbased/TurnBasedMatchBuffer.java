package com.google.android.gms.games.multiplayer.turnbased;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class TurnBasedMatchBuffer extends zzg<TurnBasedMatch>
{
  public TurnBasedMatchBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_match_id";
  }

  protected TurnBasedMatch zzr(int paramInt1, int paramInt2)
  {
    return new TurnBasedMatchRef(this.zzMd, paramInt1, paramInt2);
  }
}