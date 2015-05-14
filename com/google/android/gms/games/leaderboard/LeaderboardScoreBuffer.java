package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class LeaderboardScoreBuffer extends AbstractDataBuffer<LeaderboardScore>
{
  private final LeaderboardScoreBufferHeader zzaiV;

  public LeaderboardScoreBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
    this.zzaiV = new LeaderboardScoreBufferHeader(paramDataHolder.zziu());
  }

  public LeaderboardScore get(int paramInt)
  {
    return new LeaderboardScoreRef(this.zzMd, paramInt);
  }

  public LeaderboardScoreBufferHeader zzoQ()
  {
    return this.zzaiV;
  }
}