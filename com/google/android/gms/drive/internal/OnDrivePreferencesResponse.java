package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DrivePreferences;

public class OnDrivePreferencesResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnDrivePreferencesResponse> CREATOR = new zzat();
  final int zzFG;
  DrivePreferences zzUT;

  OnDrivePreferencesResponse(int paramInt, DrivePreferences paramDrivePreferences)
  {
    this.zzFG = paramInt;
    this.zzUT = paramDrivePreferences;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzat.zza(this, paramParcel, paramInt);
  }
}