package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class LeaderboardBuffer extends zzg<Leaderboard>
{
  public LeaderboardBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_leaderboard_id";
  }

  protected Leaderboard zzo(int paramInt1, int paramInt2)
  {
    return new LeaderboardRef(this.zzMd, paramInt1, paramInt2);
  }
}