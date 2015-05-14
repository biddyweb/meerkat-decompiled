package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.zzlw;

public final class LeaderboardScoreEntity
  implements LeaderboardScore
{
  private final long zzaiW;
  private final String zzaiX;
  private final String zzaiY;
  private final long zzaiZ;
  private final long zzaja;
  private final String zzajb;
  private final Uri zzajc;
  private final Uri zzajd;
  private final PlayerEntity zzaje;
  private final String zzajf;
  private final String zzajg;
  private final String zzajh;

  public LeaderboardScoreEntity(LeaderboardScore paramLeaderboardScore)
  {
    this.zzaiW = paramLeaderboardScore.getRank();
    this.zzaiX = ((String)zzx.zzl(paramLeaderboardScore.getDisplayRank()));
    this.zzaiY = ((String)zzx.zzl(paramLeaderboardScore.getDisplayScore()));
    this.zzaiZ = paramLeaderboardScore.getRawScore();
    this.zzaja = paramLeaderboardScore.getTimestampMillis();
    this.zzajb = paramLeaderboardScore.getScoreHolderDisplayName();
    this.zzajc = paramLeaderboardScore.getScoreHolderIconImageUri();
    this.zzajd = paramLeaderboardScore.getScoreHolderHiResImageUri();
    Player localPlayer = paramLeaderboardScore.getScoreHolder();
    if (localPlayer == null);
    for (PlayerEntity localPlayerEntity = null; ; localPlayerEntity = (PlayerEntity)localPlayer.freeze())
    {
      this.zzaje = localPlayerEntity;
      this.zzajf = paramLeaderboardScore.getScoreTag();
      this.zzajg = paramLeaderboardScore.getScoreHolderIconImageUrl();
      this.zzajh = paramLeaderboardScore.getScoreHolderHiResImageUrl();
      return;
    }
  }

  static int zza(LeaderboardScore paramLeaderboardScore)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = Long.valueOf(paramLeaderboardScore.getRank());
    arrayOfObject[1] = paramLeaderboardScore.getDisplayRank();
    arrayOfObject[2] = Long.valueOf(paramLeaderboardScore.getRawScore());
    arrayOfObject[3] = paramLeaderboardScore.getDisplayScore();
    arrayOfObject[4] = Long.valueOf(paramLeaderboardScore.getTimestampMillis());
    arrayOfObject[5] = paramLeaderboardScore.getScoreHolderDisplayName();
    arrayOfObject[6] = paramLeaderboardScore.getScoreHolderIconImageUri();
    arrayOfObject[7] = paramLeaderboardScore.getScoreHolderHiResImageUri();
    arrayOfObject[8] = paramLeaderboardScore.getScoreHolder();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(LeaderboardScore paramLeaderboardScore, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof LeaderboardScore))
      bool = false;
    LeaderboardScore localLeaderboardScore;
    do
    {
      do
        return bool;
      while (paramLeaderboardScore == paramObject);
      localLeaderboardScore = (LeaderboardScore)paramObject;
    }
    while ((zzw.equal(Long.valueOf(localLeaderboardScore.getRank()), Long.valueOf(paramLeaderboardScore.getRank()))) && (zzw.equal(localLeaderboardScore.getDisplayRank(), paramLeaderboardScore.getDisplayRank())) && (zzw.equal(Long.valueOf(localLeaderboardScore.getRawScore()), Long.valueOf(paramLeaderboardScore.getRawScore()))) && (zzw.equal(localLeaderboardScore.getDisplayScore(), paramLeaderboardScore.getDisplayScore())) && (zzw.equal(Long.valueOf(localLeaderboardScore.getTimestampMillis()), Long.valueOf(paramLeaderboardScore.getTimestampMillis()))) && (zzw.equal(localLeaderboardScore.getScoreHolderDisplayName(), paramLeaderboardScore.getScoreHolderDisplayName())) && (zzw.equal(localLeaderboardScore.getScoreHolderIconImageUri(), paramLeaderboardScore.getScoreHolderIconImageUri())) && (zzw.equal(localLeaderboardScore.getScoreHolderHiResImageUri(), paramLeaderboardScore.getScoreHolderHiResImageUri())) && (zzw.equal(localLeaderboardScore.getScoreHolder(), paramLeaderboardScore.getScoreHolder())) && (zzw.equal(localLeaderboardScore.getScoreTag(), paramLeaderboardScore.getScoreTag())));
    return false;
  }

  static String zzb(LeaderboardScore paramLeaderboardScore)
  {
    zzw.zza localzza = zzw.zzk(paramLeaderboardScore).zza("Rank", Long.valueOf(paramLeaderboardScore.getRank())).zza("DisplayRank", paramLeaderboardScore.getDisplayRank()).zza("Score", Long.valueOf(paramLeaderboardScore.getRawScore())).zza("DisplayScore", paramLeaderboardScore.getDisplayScore()).zza("Timestamp", Long.valueOf(paramLeaderboardScore.getTimestampMillis())).zza("DisplayName", paramLeaderboardScore.getScoreHolderDisplayName()).zza("IconImageUri", paramLeaderboardScore.getScoreHolderIconImageUri()).zza("IconImageUrl", paramLeaderboardScore.getScoreHolderIconImageUrl()).zza("HiResImageUri", paramLeaderboardScore.getScoreHolderHiResImageUri()).zza("HiResImageUrl", paramLeaderboardScore.getScoreHolderHiResImageUrl());
    if (paramLeaderboardScore.getScoreHolder() == null);
    for (Object localObject = null; ; localObject = paramLeaderboardScore.getScoreHolder())
      return localzza.zza("Player", localObject).zza("ScoreTag", paramLeaderboardScore.getScoreTag()).toString();
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public String getDisplayRank()
  {
    return this.zzaiX;
  }

  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzaiX, paramCharArrayBuffer);
  }

  public String getDisplayScore()
  {
    return this.zzaiY;
  }

  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzaiY, paramCharArrayBuffer);
  }

  public long getRank()
  {
    return this.zzaiW;
  }

  public long getRawScore()
  {
    return this.zzaiZ;
  }

  public Player getScoreHolder()
  {
    return this.zzaje;
  }

  public String getScoreHolderDisplayName()
  {
    if (this.zzaje == null)
      return this.zzajb;
    return this.zzaje.getDisplayName();
  }

  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.zzaje == null)
    {
      zzlw.zzb(this.zzajb, paramCharArrayBuffer);
      return;
    }
    this.zzaje.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getScoreHolderHiResImageUri()
  {
    if (this.zzaje == null)
      return this.zzajd;
    return this.zzaje.getHiResImageUri();
  }

  public String getScoreHolderHiResImageUrl()
  {
    if (this.zzaje == null)
      return this.zzajh;
    return this.zzaje.getHiResImageUrl();
  }

  public Uri getScoreHolderIconImageUri()
  {
    if (this.zzaje == null)
      return this.zzajc;
    return this.zzaje.getIconImageUri();
  }

  public String getScoreHolderIconImageUrl()
  {
    if (this.zzaje == null)
      return this.zzajg;
    return this.zzaje.getIconImageUrl();
  }

  public String getScoreTag()
  {
    return this.zzajf;
  }

  public long getTimestampMillis()
  {
    return this.zzaja;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public LeaderboardScore zzoS()
  {
    return this;
  }
}