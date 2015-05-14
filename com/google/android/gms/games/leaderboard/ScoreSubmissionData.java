package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.games.internal.constants.TimeSpan;
import java.util.HashMap;

public final class ScoreSubmissionData
{
  private static final String[] zzaiP = { "leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest", "scoreTag" };
  private int zzLs;
  private String zzacH;
  private String zzaiR;
  private HashMap<Integer, Result> zzajv;

  public ScoreSubmissionData(DataHolder paramDataHolder)
  {
    this.zzLs = paramDataHolder.getStatusCode();
    this.zzajv = new HashMap();
    int i = paramDataHolder.getCount();
    if (i == 3);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzO(bool);
      for (int j = 0; j < i; j++)
      {
        int k = paramDataHolder.zzax(j);
        if (j == 0)
        {
          this.zzaiR = paramDataHolder.zzc("leaderboardId", j, k);
          this.zzacH = paramDataHolder.zzc("playerId", j, k);
        }
        if (paramDataHolder.zzd("hasResult", j, k))
          zza(new Result(paramDataHolder.zza("rawScore", j, k), paramDataHolder.zzc("formattedScore", j, k), paramDataHolder.zzc("scoreTag", j, k), paramDataHolder.zzd("newBest", j, k)), paramDataHolder.zzb("timeSpan", j, k));
      }
    }
  }

  private void zza(Result paramResult, int paramInt)
  {
    this.zzajv.put(Integer.valueOf(paramInt), paramResult);
  }

  public String getLeaderboardId()
  {
    return this.zzaiR;
  }

  public String getPlayerId()
  {
    return this.zzacH;
  }

  public Result getScoreResult(int paramInt)
  {
    return (Result)this.zzajv.get(Integer.valueOf(paramInt));
  }

  public String toString()
  {
    zzw.zza localzza = zzw.zzk(this).zza("PlayerId", this.zzacH).zza("StatusCode", Integer.valueOf(this.zzLs));
    int i = 0;
    if (i < 3)
    {
      Result localResult = (Result)this.zzajv.get(Integer.valueOf(i));
      localzza.zza("TimesSpan", TimeSpan.zzeJ(i));
      if (localResult == null);
      for (String str = "null"; ; str = localResult.toString())
      {
        localzza.zza("Result", str);
        i++;
        break;
      }
    }
    return localzza.toString();
  }

  public static final class Result
  {
    public final String formattedScore;
    public final boolean newBest;
    public final long rawScore;
    public final String scoreTag;

    public Result(long paramLong, String paramString1, String paramString2, boolean paramBoolean)
    {
      this.rawScore = paramLong;
      this.formattedScore = paramString1;
      this.scoreTag = paramString2;
      this.newBest = paramBoolean;
    }

    public String toString()
    {
      return zzw.zzk(this).zza("RawScore", Long.valueOf(this.rawScore)).zza("FormattedScore", this.formattedScore).zza("ScoreTag", this.scoreTag).zza("NewBest", Boolean.valueOf(this.newBest)).toString();
    }
  }
}