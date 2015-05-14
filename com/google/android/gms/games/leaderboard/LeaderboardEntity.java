package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.zzlw;
import java.util.ArrayList;

public final class LeaderboardEntity
  implements Leaderboard
{
  private final String zzSJ;
  private final Uri zzacc;
  private final String zzacn;
  private final String zzaiR;
  private final int zzaiS;
  private final ArrayList<LeaderboardVariantEntity> zzaiT;
  private final Game zzaiU;

  public LeaderboardEntity(Leaderboard paramLeaderboard)
  {
    this.zzaiR = paramLeaderboard.getLeaderboardId();
    this.zzSJ = paramLeaderboard.getDisplayName();
    this.zzacc = paramLeaderboard.getIconImageUri();
    this.zzacn = paramLeaderboard.getIconImageUrl();
    this.zzaiS = paramLeaderboard.getScoreOrder();
    Game localGame = paramLeaderboard.getGame();
    if (localGame == null);
    for (GameEntity localGameEntity = null; ; localGameEntity = new GameEntity(localGame))
    {
      this.zzaiU = localGameEntity;
      ArrayList localArrayList = paramLeaderboard.getVariants();
      int i = localArrayList.size();
      this.zzaiT = new ArrayList(i);
      for (int j = 0; j < i; j++)
        this.zzaiT.add((LeaderboardVariantEntity)((LeaderboardVariant)localArrayList.get(j)).freeze());
    }
  }

  static int zza(Leaderboard paramLeaderboard)
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = paramLeaderboard.getLeaderboardId();
    arrayOfObject[1] = paramLeaderboard.getDisplayName();
    arrayOfObject[2] = paramLeaderboard.getIconImageUri();
    arrayOfObject[3] = Integer.valueOf(paramLeaderboard.getScoreOrder());
    arrayOfObject[4] = paramLeaderboard.getVariants();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Leaderboard paramLeaderboard, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Leaderboard))
      bool = false;
    Leaderboard localLeaderboard;
    do
    {
      do
        return bool;
      while (paramLeaderboard == paramObject);
      localLeaderboard = (Leaderboard)paramObject;
    }
    while ((zzw.equal(localLeaderboard.getLeaderboardId(), paramLeaderboard.getLeaderboardId())) && (zzw.equal(localLeaderboard.getDisplayName(), paramLeaderboard.getDisplayName())) && (zzw.equal(localLeaderboard.getIconImageUri(), paramLeaderboard.getIconImageUri())) && (zzw.equal(Integer.valueOf(localLeaderboard.getScoreOrder()), Integer.valueOf(paramLeaderboard.getScoreOrder()))) && (zzw.equal(localLeaderboard.getVariants(), paramLeaderboard.getVariants())));
    return false;
  }

  static String zzb(Leaderboard paramLeaderboard)
  {
    return zzw.zzk(paramLeaderboard).zza("LeaderboardId", paramLeaderboard.getLeaderboardId()).zza("DisplayName", paramLeaderboard.getDisplayName()).zza("IconImageUri", paramLeaderboard.getIconImageUri()).zza("IconImageUrl", paramLeaderboard.getIconImageUrl()).zza("ScoreOrder", Integer.valueOf(paramLeaderboard.getScoreOrder())).zza("Variants", paramLeaderboard.getVariants()).toString();
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public String getDisplayName()
  {
    return this.zzSJ;
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzSJ, paramCharArrayBuffer);
  }

  public Game getGame()
  {
    return this.zzaiU;
  }

  public Uri getIconImageUri()
  {
    return this.zzacc;
  }

  public String getIconImageUrl()
  {
    return this.zzacn;
  }

  public String getLeaderboardId()
  {
    return this.zzaiR;
  }

  public int getScoreOrder()
  {
    return this.zzaiS;
  }

  public ArrayList<LeaderboardVariant> getVariants()
  {
    return new ArrayList(this.zzaiT);
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

  public Leaderboard zzoP()
  {
    return this;
  }
}