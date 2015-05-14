package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzl
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzl> CREATOR = new zzm();
  private final int zzFG;
  long zzaFm;
  long zzaFn;

  zzl()
  {
    this.zzFG = 1;
  }

  zzl(int paramInt, long paramLong1, long paramLong2)
  {
    this.zzFG = paramInt;
    this.zzaFm = paramLong1;
    this.zzaFn = paramLong2;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
}