package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class zzrw
  implements SafeParcelable
{
  public static final zzrx CREATOR = new zzrx();
  final int versionCode;
  public final zzro zzati;

  zzrw(int paramInt, zzro paramzzro)
  {
    this.versionCode = paramInt;
    this.zzati = ((zzro)zzx.zzl(paramzzro));
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzrx.zza(this, paramParcel, paramInt);
  }
}