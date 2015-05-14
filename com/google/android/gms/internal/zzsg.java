package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzsg
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzsg> CREATOR = new zzsh();
  final int versionCode;
  public zzru zzatm;
  public zzrt zzatn;

  zzsg()
  {
    this.versionCode = 1;
  }

  zzsg(int paramInt, IBinder paramIBinder1, IBinder paramIBinder2)
  {
    this.versionCode = paramInt;
    this.zzatn = zzrt.zza.zzcj(paramIBinder1);
    this.zzatm = zzru.zza.zzck(paramIBinder2);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsh.zza(this, paramParcel, paramInt);
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