package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public final class zzsp
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzsp> CREATOR = new zzsq();
  final int versionCode;
  public IBinder zzats;
  public zzsl zzatt;
  public List<zzsi> zzatu;
  public long zzatv;
  public zzsm zzatw;

  zzsp()
  {
    this.versionCode = 1;
  }

  zzsp(int paramInt, IBinder paramIBinder1, IBinder paramIBinder2, List<zzsi> paramList, long paramLong, IBinder paramIBinder3)
  {
    this.versionCode = paramInt;
    this.zzats = paramIBinder1;
    this.zzatt = zzsl.zza.zzcn(paramIBinder2);
    this.zzatu = paramList;
    this.zzatv = paramLong;
    this.zzatw = zzsm.zza.zzco(paramIBinder3);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsq.zza(this, paramParcel, paramInt);
  }

  IBinder zzrq()
  {
    return this.zzatw.asBinder();
  }

  IBinder zzru()
  {
    if (this.zzatt == null)
      return null;
    return this.zzatt.asBinder();
  }
}