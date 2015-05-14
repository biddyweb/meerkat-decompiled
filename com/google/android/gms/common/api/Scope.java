package com.google.android.gms.common.api;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class Scope
  implements SafeParcelable
{
  public static final Parcelable.Creator<Scope> CREATOR = new zzf();
  final int zzFG;
  private final String zzNn;

  Scope(int paramInt, String paramString)
  {
    zzx.zzb(paramString, "scopeUri must not be null or empty");
    this.zzFG = paramInt;
    this.zzNn = paramString;
  }

  public Scope(String paramString)
  {
    this(1, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof Scope))
      return false;
    return this.zzNn.equals(((Scope)paramObject).zzNn);
  }

  public int hashCode()
  {
    return this.zzNn.hashCode();
  }

  public String toString()
  {
    return this.zzNn;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public String zzio()
  {
    return this.zzNn;
  }
}