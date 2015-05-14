package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerRef;

public final class LeaderboardScoreRef extends zzd
  implements LeaderboardScore
{
  private final PlayerRef zzaji;

  LeaderboardScoreRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
    this.zzaji = new PlayerRef(paramDataHolder, paramInt);
  }

  public boolean equals(Object paramObject)
  {
    return LeaderboardScoreEntity.zza(this, paramObject);
  }

  public String getDisplayRank()
  {
    return getString("display_rank");
  }

  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("display_rank", paramCharArrayBuffer);
  }

  public String getDisplayScore()
  {
    return getString("display_score");
  }

  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("display_score", paramCharArrayBuffer);
  }

  public long getRank()
  {
    return getLong("rank");
  }

  public long getRawScore()
  {
    return getLong("raw_score");
  }

  public Player getScoreHolder()
  {
    if (zzbc("external_player_id"))
      return null;
    return this.zzaji;
  }

  public String getScoreHolderDisplayName()
  {
    if (zzbc("external_player_id"))
      return getString("default_display_name");
    return this.zzaji.getDisplayName();
  }

  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (zzbc("external_player_id"))
    {
      zza("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.zzaji.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getScoreHolderHiResImageUri()
  {
    if (zzbc("external_player_id"))
      return null;
    return this.zzaji.getHiResImageUri();
  }

  public String getScoreHolderHiResImageUrl()
  {
    if (zzbc("external_player_id"))
      return null;
    return this.zzaji.getHiResImageUrl();
  }

  public Uri getScoreHolderIconImageUri()
  {
    if (zzbc("external_player_id"))
      return zzbb("default_display_image_uri");
    return this.zzaji.getIconImageUri();
  }

  public String getScoreHolderIconImageUrl()
  {
    if (zzbc("external_player_id"))
      return getString("default_display_image_url");
    return this.zzaji.getIconImageUrl();
  }

  public String getScoreTag()
  {
    return getString("score_tag");
  }

  public long getTimestampMillis()
  {
    return getLong("achieved_timestamp");
  }

  public int hashCode()
  {
    return LeaderboardScoreEntity.zza(this);
  }

  public String toString()
  {
    return LeaderboardScoreEntity.zzb(this);
  }

  public LeaderboardScore zzoS()
  {
    return new LeaderboardScoreEntity(this);
  }
}