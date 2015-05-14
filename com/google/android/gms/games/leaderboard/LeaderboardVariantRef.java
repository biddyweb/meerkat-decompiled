package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;

public final class LeaderboardVariantRef extends zzd
  implements LeaderboardVariant
{
  LeaderboardVariantRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  public boolean equals(Object paramObject)
  {
    return LeaderboardVariantEntity.zza(this, paramObject);
  }

  public int getCollection()
  {
    return getInteger("collection");
  }

  public String getDisplayPlayerRank()
  {
    return getString("player_display_rank");
  }

  public String getDisplayPlayerScore()
  {
    return getString("player_display_score");
  }

  public long getNumScores()
  {
    if (zzbc("total_scores"))
      return -1L;
    return getLong("total_scores");
  }

  public long getPlayerRank()
  {
    if (zzbc("player_rank"))
      return -1L;
    return getLong("player_rank");
  }

  public String getPlayerScoreTag()
  {
    return getString("player_score_tag");
  }

  public long getRawPlayerScore()
  {
    if (zzbc("player_raw_score"))
      return -1L;
    return getLong("player_raw_score");
  }

  public int getTimeSpan()
  {
    return getInteger("timespan");
  }

  public boolean hasPlayerInfo()
  {
    return !zzbc("player_raw_score");
  }

  public int hashCode()
  {
    return LeaderboardVariantEntity.zza(this);
  }

  public String toString()
  {
    return LeaderboardVariantEntity.zzb(this);
  }

  public String zzoT()
  {
    return getString("top_page_token_next");
  }

  public String zzoU()
  {
    return getString("window_page_token_prev");
  }

  public String zzoV()
  {
    return getString("window_page_token_next");
  }

  public LeaderboardVariant zzoW()
  {
    return new LeaderboardVariantEntity(this);
  }
}