package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzb
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzb> CREATOR = new zzc();
  String label;
  String value;
  private final int zzFG;

  zzb()
  {
    this.zzFG = 1;
  }

  zzb(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.label = paramString1;
    this.value = paramString2;
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
    zzc.zza(this, paramParcel, paramInt);
  }
}