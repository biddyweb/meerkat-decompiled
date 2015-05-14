package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class zzqu extends zzqt
  implements SafeParcelable
{
  public static final zzqv CREATOR = new zzqv();
  final int zzFG;
  private final String zzapn;

  zzqu(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzapn = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof zzqu))
      return false;
    zzqu localzzqu = (zzqu)paramObject;
    return this.zzapn.equals(localzzqu.zzapn);
  }

  public int hashCode()
  {
    return this.zzapn.hashCode();
  }

  public String toString()
  {
    return zzw.zzk(this).zza("testName", this.zzapn).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqv.zza(this, paramParcel, paramInt);
  }

  public String zzqd()
  {
    return this.zzapn;
  }
}