package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzb
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzb> CREATOR = new zzc();
  final int zzFG;
  public final zzah zzaFN;
  public final IntentFilter[] zzaFO;

  zzb(int paramInt, IBinder paramIBinder, IntentFilter[] paramArrayOfIntentFilter)
  {
    this.zzFG = paramInt;
    if (paramIBinder != null);
    for (this.zzaFN = zzah.zza.zzcQ(paramIBinder); ; this.zzaFN = null)
    {
      this.zzaFO = paramArrayOfIntentFilter;
      return;
    }
  }

  public zzb(zzbe paramzzbe)
  {
    this.zzFG = 1;
    this.zzaFN = paramzzbe;
    this.zzaFO = paramzzbe.zzvm();
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  IBinder zzva()
  {
    if (this.zzaFN == null)
      return null;
    return this.zzaFN.asBinder();
  }
}