package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnDownloadProgressResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnDownloadProgressResponse> CREATOR = new zzar();
  final int zzFG;
  final long zzUR;
  final long zzUS;

  OnDownloadProgressResponse(int paramInt, long paramLong1, long paramLong2)
  {
    this.zzFG = paramInt;
    this.zzUR = paramLong1;
    this.zzUS = paramLong2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzar.zza(this, paramParcel, paramInt);
  }

  public long zzkO()
  {
    return this.zzUR;
  }

  public long zzkP()
  {
    return this.zzUS;
  }
}