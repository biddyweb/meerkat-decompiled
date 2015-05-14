package com.google.android.gms.maps.internal;

import android.graphics.Point;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzy
  implements SafeParcelable
{
  public static final zzz CREATOR = new zzz();
  private final int versionCode;
  private final Point zzaqO;

  public zzy(int paramInt, Point paramPoint)
  {
    this.versionCode = paramInt;
    this.zzaqO = paramPoint;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof zzy))
      return false;
    zzy localzzy = (zzy)paramObject;
    return this.zzaqO.equals(localzzy.zzaqO);
  }

  int getVersionCode()
  {
    return this.versionCode;
  }

  public int hashCode()
  {
    return this.zzaqO.hashCode();
  }

  public String toString()
  {
    return this.zzaqO.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzz.zza(this, paramParcel, paramInt);
  }

  public Point zzqE()
  {
    return this.zzaqO;
  }
}