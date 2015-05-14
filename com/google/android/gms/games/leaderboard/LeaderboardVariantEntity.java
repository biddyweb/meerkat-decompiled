package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.internal.constants.LeaderboardCollection;
import com.google.android.gms.games.internal.constants.TimeSpan;

public final class LeaderboardVariantEntity
  implements LeaderboardVariant
{
  private final int zzajj;
  private final int zzajk;
  private final boolean zzajl;
  private final long zzajm;
  private final String zzajn;
  private final long zzajo;
  private final String zzajp;
  private final String zzajq;
  private final long zzajr;
  private final String zzajs;
  private final String zzajt;
  private final String zzaju;

  public LeaderboardVariantEntity(LeaderboardVariant paramLeaderboardVariant)
  {
    this.zzajj = paramLeaderboardVariant.getTimeSpan();
    this.zzajk = paramLeaderboardVariant.getCollection();
    this.zzajl = paramLeaderboardVariant.hasPlayerInfo();
    this.zzajm = paramLeaderboardVariant.getRawPlayerScore();
    this.zzajn = paramLeaderboardVariant.getDisplayPlayerScore();
    this.zzajo = paramLeaderboardVariant.getPlayerRank();
    this.zzajp = paramLeaderboardVariant.getDisplayPlayerRank();
    this.zzajq = paramLeaderboardVariant.getPlayerScoreTag();
    this.zzajr = paramLeaderboardVariant.getNumScores();
    this.zzajs = paramLeaderboardVariant.zzoT();
    this.zzajt = paramLeaderboardVariant.zzoU();
    this.zzaju = paramLeaderboardVariant.zzoV();
  }

  static int zza(LeaderboardVariant paramLeaderboardVariant)
  {
    Object[] arrayOfObject = new Object[11];
    arrayOfObject[0] = Integer.valueOf(paramLeaderboardVariant.getTimeSpan());
    arrayOfObject[1] = Integer.valueOf(paramLeaderboardVariant.getCollection());
    arrayOfObject[2] = Boolean.valueOf(paramLeaderboardVariant.hasPlayerInfo());
    arrayOfObject[3] = Long.valueOf(paramLeaderboardVariant.getRawPlayerScore());
    arrayOfObject[4] = paramLeaderboardVariant.getDisplayPlayerScore();
    arrayOfObject[5] = Long.valueOf(paramLeaderboardVariant.getPlayerRank());
    arrayOfObject[6] = paramLeaderboardVariant.getDisplayPlayerRank();
    arrayOfObject[7] = Long.valueOf(paramLeaderboardVariant.getNumScores());
    arrayOfObject[8] = paramLeaderboardVariant.zzoT();
    arrayOfObject[9] = paramLeaderboardVariant.zzoV();
    arrayOfObject[10] = paramLeaderboardVariant.zzoU();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(LeaderboardVariant paramLeaderboardVariant, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof LeaderboardVariant))
      bool = false;
    LeaderboardVariant localLeaderboardVariant;
    do
    {
      do
        return bool;
      while (paramLeaderboardVariant == paramObject);
      localLeaderboardVariant = (LeaderboardVariant)paramObject;
    }
    while ((zzw.equal(Integer.valueOf(localLeaderboardVariant.getTimeSpan()), Integer.valueOf(paramLeaderboardVariant.getTimeSpan()))) && (zzw.equal(Integer.valueOf(localLeaderboardVariant.getCollection()), Integer.valueOf(paramLeaderboardVariant.getCollection()))) && (zzw.equal(Boolean.valueOf(localLeaderboardVariant.hasPlayerInfo()), Boolean.valueOf(paramLeaderboardVariant.hasPlayerInfo()))) && (zzw.equal(Long.valueOf(localLeaderboardVariant.getRawPlayerScore()), Long.valueOf(paramLeaderboardVariant.getRawPlayerScore()))) && (zzw.equal(localLeaderboardVariant.getDisplayPlayerScore(), paramLeaderboardVariant.getDisplayPlayerScore())) && (zzw.equal(Long.valueOf(localLeaderboardVariant.getPlayerRank()), Long.valueOf(paramLeaderboardVariant.getPlayerRank()))) && (zzw.equal(localLeaderboardVariant.getDisplayPlayerRank(), paramLeaderboardVariant.getDisplayPlayerRank())) && (zzw.equal(Long.valueOf(localLeaderboardVariant.getNumScores()), Long.valueOf(paramLeaderboardVariant.getNumScores()))) && (zzw.equal(localLeaderboardVariant.zzoT(), paramLeaderboardVariant.zzoT())) && (zzw.equal(localLeaderboardVariant.zzoV(), paramLeaderboardVariant.zzoV())) && (zzw.equal(localLeaderboardVariant.zzoU(), paramLeaderboardVariant.zzoU())));
    return false;
  }

  static String zzb(LeaderboardVariant paramLeaderboardVariant)
  {
    zzw.zza localzza1 = zzw.zzk(paramLeaderboardVariant).zza("TimeSpan", TimeSpan.zzeJ(paramLeaderboardVariant.getTimeSpan())).zza("Collection", LeaderboardCollection.zzeJ(paramLeaderboardVariant.getCollection()));
    Object localObject1;
    String str1;
    label77: Object localObject2;
    label107: zzw.zza localzza4;
    if (paramLeaderboardVariant.hasPlayerInfo())
    {
      localObject1 = Long.valueOf(paramLeaderboardVariant.getRawPlayerScore());
      zzw.zza localzza2 = localzza1.zza("RawPlayerScore", localObject1);
      if (!paramLeaderboardVariant.hasPlayerInfo())
        break label201;
      str1 = paramLeaderboardVariant.getDisplayPlayerScore();
      zzw.zza localzza3 = localzza2.zza("DisplayPlayerScore", str1);
      if (!paramLeaderboardVariant.hasPlayerInfo())
        break label208;
      localObject2 = Long.valueOf(paramLeaderboardVariant.getPlayerRank());
      localzza4 = localzza3.zza("PlayerRank", localObject2);
      if (!paramLeaderboardVariant.hasPlayerInfo())
        break label215;
    }
    label201: label208: label215: for (String str2 = paramLeaderboardVariant.getDisplayPlayerRank(); ; str2 = "none")
    {
      return localzza4.zza("DisplayPlayerRank", str2).zza("NumScores", Long.valueOf(paramLeaderboardVariant.getNumScores())).zza("TopPageNextToken", paramLeaderboardVariant.zzoT()).zza("WindowPageNextToken", paramLeaderboardVariant.zzoV()).zza("WindowPagePrevToken", paramLeaderboardVariant.zzoU()).toString();
      localObject1 = "none";
      break;
      str1 = "none";
      break label77;
      localObject2 = "none";
      break label107;
    }
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public int getCollection()
  {
    return this.zzajk;
  }

  public String getDisplayPlayerRank()
  {
    return this.zzajp;
  }

  public String getDisplayPlayerScore()
  {
    return this.zzajn;
  }

  public long getNumScores()
  {
    return this.zzajr;
  }

  public long getPlayerRank()
  {
    return this.zzajo;
  }

  public String getPlayerScoreTag()
  {
    return this.zzajq;
  }

  public long getRawPlayerScore()
  {
    return this.zzajm;
  }

  public int getTimeSpan()
  {
    return this.zzajj;
  }

  public boolean hasPlayerInfo()
  {
    return this.zzajl;
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

  public String zzoT()
  {
    return this.zzajs;
  }

  public String zzoU()
  {
    return this.zzajt;
  }

  public String zzoV()
  {
    return this.zzaju;
  }

  public LeaderboardVariant zzoW()
  {
    return this;
  }
}