package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class AuthorizeAccessRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<AuthorizeAccessRequest> CREATOR = new zzb();
  final int zzFG;
  final DriveId zzRX;
  final long zzTf;

  AuthorizeAccessRequest(int paramInt, long paramLong, DriveId paramDriveId)
  {
    this.zzFG = paramInt;
    this.zzTf = paramLong;
    this.zzRX = paramDriveId;
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