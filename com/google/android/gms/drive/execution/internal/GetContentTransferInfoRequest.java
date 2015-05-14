package com.google.android.gms.drive.execution.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class GetContentTransferInfoRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<GetContentTransferInfoRequest> CREATOR = new zzb();
  final int zzFG;
  final int zzJp;
  final DriveId zzRX;

  GetContentTransferInfoRequest(int paramInt1, DriveId paramDriveId, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzRX = paramDriveId;
    this.zzJp = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}