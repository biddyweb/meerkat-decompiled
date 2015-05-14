package com.google.android.gms.drive.execution.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ContentTransferInfoResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<ContentTransferInfoResponse> CREATOR = new zza();
  final int zzFG;
  final int zzJp;
  final long zzTc;
  final long zzTd;
  final int zzrX;

  ContentTransferInfoResponse(int paramInt1, int paramInt2, int paramInt3, long paramLong1, long paramLong2)
  {
    this.zzFG = paramInt1;
    this.zzJp = paramInt2;
    this.zzrX = paramInt3;
    this.zzTc = paramLong1;
    this.zzTd = paramLong2;
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