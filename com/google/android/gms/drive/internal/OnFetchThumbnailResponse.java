package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnFetchThumbnailResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnFetchThumbnailResponse> CREATOR = new zzav();
  final int zzFG;
  final ParcelFileDescriptor zzUX;

  OnFetchThumbnailResponse(int paramInt, ParcelFileDescriptor paramParcelFileDescriptor)
  {
    this.zzFG = paramInt;
    this.zzUX = paramParcelFileDescriptor;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzav.zza(this, paramParcel, paramInt | 0x1);
  }
}