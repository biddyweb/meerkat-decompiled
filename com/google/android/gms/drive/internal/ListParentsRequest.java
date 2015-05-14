package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class ListParentsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<ListParentsRequest> CREATOR = new zzak();
  final int zzFG;
  final DriveId zzUC;

  ListParentsRequest(int paramInt, DriveId paramDriveId)
  {
    this.zzFG = paramInt;
    this.zzUC = paramDriveId;
  }

  public ListParentsRequest(DriveId paramDriveId)
  {
    this(1, paramDriveId);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzak.zza(this, paramParcel, paramInt);
  }
}