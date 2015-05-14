package com.google.android.gms.drive.metadata.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class PartialDriveId
  implements SafeParcelable
{
  public static final Parcelable.Creator<PartialDriveId> CREATOR = new zzl();
  final int zzFG;
  final String zzSh;
  final long zzSi;
  final int zzSj;

  PartialDriveId(int paramInt1, String paramString, long paramLong, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzSh = paramString;
    this.zzSi = paramLong;
    this.zzSj = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }

  public DriveId zzt(long paramLong)
  {
    return new DriveId(this.zzSh, this.zzSi, paramLong, this.zzSj);
  }
}