package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzaa
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaa> CREATOR = new zzab();
  public final int statusCode;
  public final int versionCode;
  public final zzp zzaGl;

  zzaa(int paramInt1, int paramInt2, zzp paramzzp)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGl = paramzzp;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzab.zza(this, paramParcel, paramInt);
  }
}