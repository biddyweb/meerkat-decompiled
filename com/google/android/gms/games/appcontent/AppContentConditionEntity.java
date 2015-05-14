package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class AppContentConditionEntity
  implements SafeParcelable, AppContentCondition
{
  public static final AppContentConditionEntityCreator CREATOR = new AppContentConditionEntityCreator();
  private final int zzFG;
  private final String zzadA;
  private final Bundle zzadB;
  private final String zzady;
  private final String zzadz;

  AppContentConditionEntity(int paramInt, String paramString1, String paramString2, String paramString3, Bundle paramBundle)
  {
    this.zzFG = paramInt;
    this.zzady = paramString1;
    this.zzadz = paramString2;
    this.zzadA = paramString3;
    this.zzadB = paramBundle;
  }

  public AppContentConditionEntity(AppContentCondition paramAppContentCondition)
  {
    this.zzFG = 1;
    this.zzady = paramAppContentCondition.zzmY();
    this.zzadz = paramAppContentCondition.zzmZ();
    this.zzadA = paramAppContentCondition.zzna();
    this.zzadB = paramAppContentCondition.zznb();
  }

  static int zza(AppContentCondition paramAppContentCondition)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = paramAppContentCondition.zzmY();
    arrayOfObject[1] = paramAppContentCondition.zzmZ();
    arrayOfObject[2] = paramAppContentCondition.zzna();
    arrayOfObject[3] = paramAppContentCondition.zznb();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentCondition paramAppContentCondition, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentCondition))
      bool = false;
    AppContentCondition localAppContentCondition;
    do
    {
      do
        return bool;
      while (paramAppContentCondition == paramObject);
      localAppContentCondition = (AppContentCondition)paramObject;
    }
    while ((zzw.equal(localAppContentCondition.zzmY(), paramAppContentCondition.zzmY())) && (zzw.equal(localAppContentCondition.zzmZ(), paramAppContentCondition.zzmZ())) && (zzw.equal(localAppContentCondition.zzna(), paramAppContentCondition.zzna())) && (zzw.equal(localAppContentCondition.zznb(), paramAppContentCondition.zznb())));
    return false;
  }

  static String zzb(AppContentCondition paramAppContentCondition)
  {
    return zzw.zzk(paramAppContentCondition).zza("DefaultValue", paramAppContentCondition.zzmY()).zza("ExpectedValue", paramAppContentCondition.zzmZ()).zza("Predicate", paramAppContentCondition.zzna()).zza("PredicateParameters", paramAppContentCondition.zznb()).toString();
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
    AppContentConditionEntityCreator.zza(this, paramParcel, paramInt);
  }

  public String zzmY()
  {
    return this.zzady;
  }

  public String zzmZ()
  {
    return this.zzadz;
  }

  public String zzna()
  {
    return this.zzadA;
  }

  public Bundle zznb()
  {
    return this.zzadB;
  }

  public AppContentCondition zznc()
  {
    return this;
  }
}