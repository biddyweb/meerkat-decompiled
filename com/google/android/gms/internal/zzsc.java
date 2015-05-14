package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzsc
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzsc> CREATOR = new zzsd();
  final int versionCode;
  public zzrr zzatl;
  public zzru zzatm;
  public zzrt zzatn;

  zzsc()
  {
    this.versionCode = 1;
  }

  zzsc(int paramInt, IBinder paramIBinder1, zzrr paramzzrr, IBinder paramIBinder2)
  {
    this.versionCode = paramInt;
    this.zzatn = zzrt.zza.zzcj(paramIBinder1);
    this.zzatl = paramzzrr;
    this.zzatm = zzru.zza.zzck(paramIBinder2);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsd.zza(this, paramParcel, paramInt);
  }

  IBinder zzrq()
  {
    return this.zzatm.asBinder();
  }

  IBinder zzrr()
  {
    return this.zzatn.asBinder();
  }
}