package com.google.android.gms.games;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public final class PlayerLevelInfo
  implements SafeParcelable
{
  public static final PlayerLevelInfoCreator CREATOR = new PlayerLevelInfoCreator();
  private final int zzFG;
  private final long zzacS;
  private final long zzacT;
  private final PlayerLevel zzacU;
  private final PlayerLevel zzacV;

  PlayerLevelInfo(int paramInt, long paramLong1, long paramLong2, PlayerLevel paramPlayerLevel1, PlayerLevel paramPlayerLevel2)
  {
    if (paramLong1 != -1L);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzN(bool);
      zzx.zzl(paramPlayerLevel1);
      zzx.zzl(paramPlayerLevel2);
      this.zzFG = paramInt;
      this.zzacS = paramLong1;
      this.zzacT = paramLong2;
      this.zzacU = paramPlayerLevel1;
      this.zzacV = paramPlayerLevel2;
      return;
    }
  }

  public PlayerLevelInfo(long paramLong1, long paramLong2, PlayerLevel paramPlayerLevel1, PlayerLevel paramPlayerLevel2)
  {
    this(1, paramLong1, paramLong2, paramPlayerLevel1, paramPlayerLevel2);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof PlayerLevelInfo))
      bool = false;
    PlayerLevelInfo localPlayerLevelInfo;
    do
    {
      do
        return bool;
      while (paramObject == this);
      localPlayerLevelInfo = (PlayerLevelInfo)paramObject;
    }
    while ((zzw.equal(Long.valueOf(this.zzacS), Long.valueOf(localPlayerLevelInfo.zzacS))) && (zzw.equal(Long.valueOf(this.zzacT), Long.valueOf(localPlayerLevelInfo.zzacT))) && (zzw.equal(this.zzacU, localPlayerLevelInfo.zzacU)) && (zzw.equal(this.zzacV, localPlayerLevelInfo.zzacV)));
    return false;
  }

  public PlayerLevel getCurrentLevel()
  {
    return this.zzacU;
  }

  public long getCurrentXpTotal()
  {
    return this.zzacS;
  }

  public long getLastLevelUpTimestamp()
  {
    return this.zzacT;
  }

  public PlayerLevel getNextLevel()
  {
    return this.zzacV;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Long.valueOf(this.zzacS);
    arrayOfObject[1] = Long.valueOf(this.zzacT);
    arrayOfObject[2] = this.zzacU;
    arrayOfObject[3] = this.zzacV;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isMaxLevel()
  {
    return this.zzacU.equals(this.zzacV);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    PlayerLevelInfoCreator.zza(this, paramParcel, paramInt);
  }
}