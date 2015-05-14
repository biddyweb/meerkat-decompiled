package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class OnMetadataResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnMetadataResponse> CREATOR = new zzay();
  final int zzFG;
  final MetadataBundle zzTp;

  OnMetadataResponse(int paramInt, MetadataBundle paramMetadataBundle)
  {
    this.zzFG = paramInt;
    this.zzTp = paramMetadataBundle;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzay.zza(this, paramParcel, paramInt);
  }

  public MetadataBundle zzkU()
  {
    return this.zzTp;
  }
}