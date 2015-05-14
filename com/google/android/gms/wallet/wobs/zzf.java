package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzf
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzf> CREATOR = new zzi();
  String label;
  String type;
  private final int zzFG;
  zzl zzaDG;
  zzg zzaFf;

  zzf()
  {
    this.zzFG = 1;
  }

  zzf(int paramInt, String paramString1, zzg paramzzg, String paramString2, zzl paramzzl)
  {
    this.zzFG = paramInt;
    this.label = paramString1;
    this.zzaFf = paramzzg;
    this.type = paramString2;
    this.zzaDG = paramzzl;
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
    zzi.zza(this, paramParcel, paramInt);
  }
}