package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzs
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzs> CREATOR = new zzt();
  public final int statusCode;
  public final int versionCode;
  public final int zzaGh;

  zzs(int paramInt1, int paramInt2, int paramInt3)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGh = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzt.zza(this, paramParcel, paramInt);
  }
}