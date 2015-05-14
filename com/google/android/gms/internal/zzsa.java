package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzsa
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzsa> CREATOR = new zzsb();
  final int versionCode;
  public zzrw zzatk;
  public zzrr zzatl;
  public zzru zzatm;

  zzsa()
  {
    this.versionCode = 1;
  }

  zzsa(int paramInt, zzrw paramzzrw, zzrr paramzzrr, IBinder paramIBinder)
  {
    this.versionCode = paramInt;
    this.zzatk = paramzzrw;
    this.zzatl = paramzzrr;
    this.zzatm = zzru.zza.zzck(paramIBinder);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsb.zza(this, paramParcel, paramInt);
  }

  IBinder zzrq()
  {
    return this.zzatm.asBinder();
  }
}