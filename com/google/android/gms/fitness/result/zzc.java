package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.DataSource;

public class zzc
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzc> CREATOR = new zzd();
  final int zzFG;
  public final long zzHf;
  public final DataSource zzYp;
  public final boolean zzabP;
  public final long zzabQ;
  public final long zzabR;

  zzc(int paramInt, DataSource paramDataSource, long paramLong1, boolean paramBoolean, long paramLong2, long paramLong3)
  {
    this.zzFG = paramInt;
    this.zzYp = paramDataSource;
    this.zzHf = paramLong1;
    this.zzabP = paramBoolean;
    this.zzabQ = paramLong2;
    this.zzabR = paramLong3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }
}