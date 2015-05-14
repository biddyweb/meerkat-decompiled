package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzse
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzse> CREATOR = new zzsf();
  final int versionCode;
  public zzrw zzatk;
  public zzru zzatm;

  zzse()
  {
    this.versionCode = 1;
  }

  zzse(int paramInt, zzrw paramzzrw, IBinder paramIBinder)
  {
    this.versionCode = paramInt;
    this.zzatk = paramzzrw;
    this.zzatm = zzru.zza.zzck(paramIBinder);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsf.zza(this, paramParcel, paramInt);
  }

  IBinder zzrq()
  {
    return this.zzatm.asBinder();
  }
}