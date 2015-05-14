package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.zze;

@Deprecated
public class zzu
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzu> CREATOR = new zzv();
  public final int statusCode;
  public final int versionCode;
  public final zze zzaGi;

  zzu(int paramInt1, int paramInt2, zze paramzze)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGi = paramzze;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzv.zza(this, paramParcel, paramInt);
  }
}