package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.StorageStats;

public class OnStorageStatsResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnStorageStatsResponse> CREATOR = new zzbb();
  final int zzFG;
  StorageStats zzVa;

  OnStorageStatsResponse(int paramInt, StorageStats paramStorageStats)
  {
    this.zzFG = paramInt;
    this.zzVa = paramStorageStats;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbb.zza(this, paramParcel, paramInt);
  }
}