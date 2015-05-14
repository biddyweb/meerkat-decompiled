package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.zze;

public class zzw
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzw> CREATOR = new zzx();
  public final int statusCode;
  public final int versionCode;
  public final zze[] zzaGj;

  zzw(int paramInt1, int paramInt2, zze[] paramArrayOfzze)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGj = paramArrayOfzze;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzx.zza(this, paramParcel, paramInt);
  }
}