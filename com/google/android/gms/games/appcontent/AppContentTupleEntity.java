package com.google.android.gms.games.appcontent;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class AppContentTupleEntity
  implements SafeParcelable, AppContentTuple
{
  public static final AppContentTupleEntityCreator CREATOR = new AppContentTupleEntityCreator();
  private final String mName;
  private final String mValue;
  private final int zzFG;

  AppContentTupleEntity(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.mName = paramString1;
    this.mValue = paramString2;
  }

  public AppContentTupleEntity(AppContentTuple paramAppContentTuple)
  {
    this.zzFG = 1;
    this.mName = paramAppContentTuple.getName();
    this.mValue = paramAppContentTuple.getValue();
  }

  static int zza(AppContentTuple paramAppContentTuple)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramAppContentTuple.getName();
    arrayOfObject[1] = paramAppContentTuple.getValue();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppContentTuple paramAppContentTuple, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppContentTuple))
      bool = false;
    AppContentTuple localAppContentTuple;
    do
    {
      do
        return bool;
      while (paramAppContentTuple == paramObject);
      localAppContentTuple = (AppContentTuple)paramObject;
    }
    while ((zzw.equal(localAppContentTuple.getName(), paramAppContentTuple.getName())) && (zzw.equal(localAppContentTuple.getValue(), paramAppContentTuple.getValue())));
    return false;
  }

  static String zzb(AppContentTuple paramAppContentTuple)
  {
    return zzw.zzk(paramAppContentTuple).zza("Name", paramAppContentTuple.getName()).zza("Value", paramAppContentTuple.getValue()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public String getName()
  {
    return this.mName;
  }

  public String getValue()
  {
    return this.mValue;
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
    AppContentTupleEntityCreator.zza(this, paramParcel, paramInt);
  }

  public AppContentTuple zznj()
  {
    return this;
  }
}