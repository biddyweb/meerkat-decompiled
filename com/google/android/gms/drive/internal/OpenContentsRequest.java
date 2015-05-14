package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class OpenContentsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<OpenContentsRequest> CREATOR = new zzbd();
  final int zzFG;
  final int zzRW;
  final DriveId zzTh;
  final int zzVb;

  OpenContentsRequest(int paramInt1, DriveId paramDriveId, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzTh = paramDriveId;
    this.zzRW = paramInt2;
    this.zzVb = paramInt3;
  }

  public OpenContentsRequest(DriveId paramDriveId, int paramInt1, int paramInt2)
  {
    this(1, paramDriveId, paramInt1, paramInt2);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbd.zza(this, paramParcel, paramInt);
  }
}