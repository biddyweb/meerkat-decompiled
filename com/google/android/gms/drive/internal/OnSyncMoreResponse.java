package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnSyncMoreResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnSyncMoreResponse> CREATOR = new zzbc();
  final int zzFG;
  final boolean zzTB;

  OnSyncMoreResponse(int paramInt, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzTB = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbc.zza(this, paramParcel, paramInt);
  }
}