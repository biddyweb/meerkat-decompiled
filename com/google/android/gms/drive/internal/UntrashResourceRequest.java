package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class UntrashResourceRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<UntrashResourceRequest> CREATOR = new zzbo();
  final int zzFG;
  final DriveId zzTh;

  UntrashResourceRequest(int paramInt, DriveId paramDriveId)
  {
    this.zzFG = paramInt;
    this.zzTh = paramDriveId;
  }

  public UntrashResourceRequest(DriveId paramDriveId)
  {
    this(1, paramDriveId);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbo.zza(this, paramParcel, paramInt);
  }
}