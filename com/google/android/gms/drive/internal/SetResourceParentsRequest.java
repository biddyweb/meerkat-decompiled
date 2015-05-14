package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import java.util.List;

public class SetResourceParentsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<SetResourceParentsRequest> CREATOR = new zzbk();
  final int zzFG;
  final DriveId zzVe;
  final List<DriveId> zzVf;

  SetResourceParentsRequest(int paramInt, DriveId paramDriveId, List<DriveId> paramList)
  {
    this.zzFG = paramInt;
    this.zzVe = paramDriveId;
    this.zzVf = paramList;
  }

  public SetResourceParentsRequest(DriveId paramDriveId, List<DriveId> paramList)
  {
    this(1, paramDriveId, paramList);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbk.zza(this, paramParcel, paramInt);
  }
}