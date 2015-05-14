package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import java.util.List;

public class LoadRealtimeRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<LoadRealtimeRequest> CREATOR = new zzal();
  final int zzFG;
  final DriveId zzRX;
  final boolean zzUD;
  final List<String> zzUE;

  LoadRealtimeRequest(int paramInt, DriveId paramDriveId, boolean paramBoolean, List<String> paramList)
  {
    this.zzFG = paramInt;
    this.zzRX = paramDriveId;
    this.zzUD = paramBoolean;
    this.zzUE = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzal.zza(this, paramParcel, paramInt);
  }
}