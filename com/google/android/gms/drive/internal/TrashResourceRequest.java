package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class TrashResourceRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<TrashResourceRequest> CREATOR = new zzbm();
  final int zzFG;
  final DriveId zzTh;

  TrashResourceRequest(int paramInt, DriveId paramDriveId)
  {
    this.zzFG = paramInt;
    this.zzTh = paramDriveId;
  }

  public TrashResourceRequest(DriveId paramDriveId)
  {
    this(1, paramDriveId);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbm.zza(this, paramParcel, paramInt);
  }
}