package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzg
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzg> CREATOR = new zzh();
  private final int zzFG;
  String zzaDo;
  int zzaFg;
  String zzaFh;
  double zzaFi;
  long zzaFj;
  int zzaFk;

  zzg()
  {
    this.zzFG = 1;
    this.zzaFk = -1;
    this.zzaFg = -1;
    this.zzaFi = -1.0D;
  }

  zzg(int paramInt1, int paramInt2, String paramString1, double paramDouble, String paramString2, long paramLong, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzaFg = paramInt2;
    this.zzaFh = paramString1;
    this.zzaFi = paramDouble;
    this.zzaDo = paramString2;
    this.zzaFj = paramLong;
    this.zzaFk = paramInt3;
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
    zzh.zza(this, paramParcel, paramInt);
  }
}