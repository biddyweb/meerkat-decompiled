package com.google.android.gms.games;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;

public final class PlayerLevel
  implements SafeParcelable
{
  public static final PlayerLevelCreator CREATOR = new PlayerLevelCreator();
  private final int zzFG;
  private final int zzacP;
  private final long zzacQ;
  private final long zzacR;

  PlayerLevel(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    boolean bool2;
    if (paramLong1 >= 0L)
    {
      bool2 = bool1;
      zzx.zza(bool2, "Min XP must be positive!");
      if (paramLong2 <= paramLong1)
        break label66;
    }
    while (true)
    {
      zzx.zza(bool1, "Max XP must be more than min XP!");
      this.zzFG = paramInt1;
      this.zzacP = paramInt2;
      this.zzacQ = paramLong1;
      this.zzacR = paramLong2;
      return;
      bool2 = false;
      break;
      label66: bool1 = false;
    }
  }

  public PlayerLevel(int paramInt, long paramLong1, long paramLong2)
  {
    this(1, paramInt, paramLong1, paramLong2);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof PlayerLevel))
      bool = false;
    PlayerLevel localPlayerLevel;
    do
    {
      do
        return bool;
      while (this == paramObject);
      localPlayerLevel = (PlayerLevel)paramObject;
    }
    while ((zzw.equal(Integer.valueOf(localPlayerLevel.getLevelNumber()), Integer.valueOf(getLevelNumber()))) && (zzw.equal(Long.valueOf(localPlayerLevel.getMinXp()), Long.valueOf(getMinXp()))) && (zzw.equal(Long.valueOf(localPlayerLevel.getMaxXp()), Long.valueOf(getMaxXp()))));
    return false;
  }

  public int getLevelNumber()
  {
    return this.zzacP;
  }

  public long getMaxXp()
  {
    return this.zzacR;
  }

  public long getMinXp()
  {
    return this.zzacQ;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzacP);
    arrayOfObject[1] = Long.valueOf(this.zzacQ);
    arrayOfObject[2] = Long.valueOf(this.zzacR);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("LevelNumber", Integer.valueOf(getLevelNumber())).zza("MinXp", Long.valueOf(getMinXp())).zza("MaxXp", Long.valueOf(getMaxXp())).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    PlayerLevelCreator.zza(this, paramParcel, paramInt);
  }
}