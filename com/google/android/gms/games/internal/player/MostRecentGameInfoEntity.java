package com.google.android.gms.games.internal.player;

import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class MostRecentGameInfoEntity
  implements SafeParcelable, MostRecentGameInfo
{
  public static final MostRecentGameInfoEntityCreator CREATOR = new MostRecentGameInfoEntityCreator();
  private final int zzFG;
  private final String zzaii;
  private final String zzaij;
  private final long zzaik;
  private final Uri zzail;
  private final Uri zzaim;
  private final Uri zzain;

  MostRecentGameInfoEntity(int paramInt, String paramString1, String paramString2, long paramLong, Uri paramUri1, Uri paramUri2, Uri paramUri3)
  {
    this.zzFG = paramInt;
    this.zzaii = paramString1;
    this.zzaij = paramString2;
    this.zzaik = paramLong;
    this.zzail = paramUri1;
    this.zzaim = paramUri2;
    this.zzain = paramUri3;
  }

  public MostRecentGameInfoEntity(MostRecentGameInfo paramMostRecentGameInfo)
  {
    this.zzFG = 2;
    this.zzaii = paramMostRecentGameInfo.zzoF();
    this.zzaij = paramMostRecentGameInfo.zzoG();
    this.zzaik = paramMostRecentGameInfo.zzoH();
    this.zzail = paramMostRecentGameInfo.zzoI();
    this.zzaim = paramMostRecentGameInfo.zzoJ();
    this.zzain = paramMostRecentGameInfo.zzoK();
  }

  static int zza(MostRecentGameInfo paramMostRecentGameInfo)
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = paramMostRecentGameInfo.zzoF();
    arrayOfObject[1] = paramMostRecentGameInfo.zzoG();
    arrayOfObject[2] = Long.valueOf(paramMostRecentGameInfo.zzoH());
    arrayOfObject[3] = paramMostRecentGameInfo.zzoI();
    arrayOfObject[4] = paramMostRecentGameInfo.zzoJ();
    arrayOfObject[5] = paramMostRecentGameInfo.zzoK();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(MostRecentGameInfo paramMostRecentGameInfo, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof MostRecentGameInfo))
      bool = false;
    MostRecentGameInfo localMostRecentGameInfo;
    do
    {
      do
        return bool;
      while (paramMostRecentGameInfo == paramObject);
      localMostRecentGameInfo = (MostRecentGameInfo)paramObject;
    }
    while ((zzw.equal(localMostRecentGameInfo.zzoF(), paramMostRecentGameInfo.zzoF())) && (zzw.equal(localMostRecentGameInfo.zzoG(), paramMostRecentGameInfo.zzoG())) && (zzw.equal(Long.valueOf(localMostRecentGameInfo.zzoH()), Long.valueOf(paramMostRecentGameInfo.zzoH()))) && (zzw.equal(localMostRecentGameInfo.zzoI(), paramMostRecentGameInfo.zzoI())) && (zzw.equal(localMostRecentGameInfo.zzoJ(), paramMostRecentGameInfo.zzoJ())) && (zzw.equal(localMostRecentGameInfo.zzoK(), paramMostRecentGameInfo.zzoK())));
    return false;
  }

  static String zzb(MostRecentGameInfo paramMostRecentGameInfo)
  {
    return zzw.zzk(paramMostRecentGameInfo).zza("GameId", paramMostRecentGameInfo.zzoF()).zza("GameName", paramMostRecentGameInfo.zzoG()).zza("ActivityTimestampMillis", Long.valueOf(paramMostRecentGameInfo.zzoH())).zza("GameIconUri", paramMostRecentGameInfo.zzoI()).zza("GameHiResUri", paramMostRecentGameInfo.zzoJ()).zza("GameFeaturedUri", paramMostRecentGameInfo.zzoK()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public int getVersionCode()
  {
    return this.zzFG;
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

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    MostRecentGameInfoEntityCreator.zza(this, paramParcel, paramInt);
  }

  public String zzoF()
  {
    return this.zzaii;
  }

  public String zzoG()
  {
    return this.zzaij;
  }

  public long zzoH()
  {
    return this.zzaik;
  }

  public Uri zzoI()
  {
    return this.zzail;
  }

  public Uri zzoJ()
  {
    return this.zzaim;
  }

  public Uri zzoK()
  {
    return this.zzain;
  }

  public MostRecentGameInfo zzoL()
  {
    return this;
  }
}