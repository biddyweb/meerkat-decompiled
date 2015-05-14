package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzaw
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaw> CREATOR = new zzax();
  public final int statusCode;
  public final int versionCode;
  public final int zzaGD;

  zzaw(int paramInt1, int paramInt2, int paramInt3)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGD = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzax.zza(this, paramParcel, paramInt);
  }
}