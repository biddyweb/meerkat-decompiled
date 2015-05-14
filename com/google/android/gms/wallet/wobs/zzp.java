package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzp
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzp> CREATOR = new zzq();
  private final int zzFG;
  String zzaFl;
  zzl zzaFo;
  zzn zzaFp;
  zzn zzaFq;
  String zzwG;

  zzp()
  {
    this.zzFG = 1;
  }

  zzp(int paramInt, String paramString1, String paramString2, zzl paramzzl, zzn paramzzn1, zzn paramzzn2)
  {
    this.zzFG = paramInt;
    this.zzaFl = paramString1;
    this.zzwG = paramString2;
    this.zzaFo = paramzzl;
    this.zzaFp = paramzzn1;
    this.zzaFq = paramzzn2;
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
    zzq.zza(this, paramParcel, paramInt);
  }
}