package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class AddEventListenerRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<AddEventListenerRequest> CREATOR = new zza();
  final int zzFG;
  final DriveId zzRX;
  final int zzTe;

  AddEventListenerRequest(int paramInt1, DriveId paramDriveId, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzRX = paramDriveId;
    this.zzTe = paramInt2;
  }

  public AddEventListenerRequest(DriveId paramDriveId, int paramInt)
  {
    this(1, paramDriveId, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}