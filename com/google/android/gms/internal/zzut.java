package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzut
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzut> CREATOR = new zzuu();
  final int zzFG;

  public zzut()
  {
    this(1);
  }

  zzut(int paramInt)
  {
    this.zzFG = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzuu.zza(this, paramParcel, paramInt);
  }
}