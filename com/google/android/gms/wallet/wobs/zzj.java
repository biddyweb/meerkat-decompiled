package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzj
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzj> CREATOR = new zzk();
  private final int zzFG;
  String zzaFl;
  String zzwG;

  zzj()
  {
    this.zzFG = 1;
  }

  zzj(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzaFl = paramString1;
    this.zzwG = paramString2;
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
    zzk.zza(this, paramParcel, paramInt);
  }
}