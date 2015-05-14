package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzac
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzac> CREATOR = new zzad();
  public final int statusCode;
  public final int versionCode;
  public final ParcelFileDescriptor zzaGm;

  zzac(int paramInt1, int paramInt2, ParcelFileDescriptor paramParcelFileDescriptor)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGm = paramParcelFileDescriptor;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzad.zza(this, paramParcel, paramInt | 0x1);
  }
}