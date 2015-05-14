package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class DrivePreferences
  implements SafeParcelable
{
  public static final Parcelable.Creator<DrivePreferences> CREATOR = new zze();
  final int zzFG;
  final boolean zzSk;

  DrivePreferences(int paramInt, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzSk = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
}