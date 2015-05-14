package com.google.android.gms.wearable.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzau
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzau> CREATOR = new zzav();
  final int zzFG;
  public final zzah zzaFN;

  zzau(int paramInt, IBinder paramIBinder)
  {
    this.zzFG = paramInt;
    if (paramIBinder != null)
    {
      this.zzaFN = zzah.zza.zzcQ(paramIBinder);
      return;
    }
    this.zzaFN = null;
  }

  public zzau(zzah paramzzah)
  {
    this.zzFG = 1;
    this.zzaFN = paramzzah;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzav.zza(this, paramParcel, paramInt);
  }

  IBinder zzva()
  {
    if (this.zzaFN == null)
      return null;
    return this.zzaFN.asBinder();
  }
}