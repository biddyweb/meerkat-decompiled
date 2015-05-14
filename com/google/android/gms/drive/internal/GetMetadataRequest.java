package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class GetMetadataRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<GetMetadataRequest> CREATOR = new zzaf();
  final int zzFG;
  final DriveId zzTh;
  final boolean zzUB;

  GetMetadataRequest(int paramInt, DriveId paramDriveId, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzTh = paramDriveId;
    this.zzUB = paramBoolean;
  }

  public GetMetadataRequest(DriveId paramDriveId, boolean paramBoolean)
  {
    this(1, paramDriveId, paramBoolean);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaf.zza(this, paramParcel, paramInt);
  }
}