package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzss
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzss> CREATOR = new zzst();
  final int versionCode;
  public long zzatv;
  public zzsm zzatw;

  zzss()
  {
    this.versionCode = 1;
  }

  zzss(int paramInt, long paramLong, IBinder paramIBinder)
  {
    this.versionCode = paramInt;
    this.zzatv = paramLong;
    this.zzatw = zzsm.zza.zzco(paramIBinder);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzst.zza(this, paramParcel, paramInt);
  }

  IBinder zzrq()
  {
    return this.zzatw.asBinder();
  }
}