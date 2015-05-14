package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class StorageStats
  implements SafeParcelable
{
  public static final Parcelable.Creator<StorageStats> CREATOR = new zzi();
  final int zzFG;
  final long zzSD;
  final long zzSE;
  final long zzSF;
  final long zzSG;
  final int zzSH;

  StorageStats(int paramInt1, long paramLong1, long paramLong2, long paramLong3, long paramLong4, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzSD = paramLong1;
    this.zzSE = paramLong2;
    this.zzSF = paramLong3;
    this.zzSG = paramLong4;
    this.zzSH = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
}