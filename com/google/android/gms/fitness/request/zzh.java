package com.google.android.gms.fitness.request;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.DataSource;

public class zzh
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzh> CREATOR = new zzi();
  final int zzFG;
  public final long zzHf;
  public final long zzYH;
  public final DataSource zzYp;
  public final int zzaaX;
  public final long zzabb;
  public final int zzabc;

  zzh(int paramInt1, DataSource paramDataSource, long paramLong1, long paramLong2, long paramLong3, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzYp = paramDataSource;
    this.zzHf = paramLong1;
    this.zzYH = paramLong2;
    this.zzabb = paramLong3;
    this.zzaaX = paramInt2;
    this.zzabc = paramInt3;
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