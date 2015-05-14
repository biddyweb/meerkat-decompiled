package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.zzd;
import com.google.android.gms.location.zzd.zza;
import com.google.android.gms.location.zze;
import com.google.android.gms.location.zze.zza;

public class zzpi
  implements SafeParcelable
{
  public static final zzpj CREATOR = new zzpj();
  PendingIntent mPendingIntent;
  private final int zzFG;
  int zzanl;
  zzpg zzanm;
  zzd zzann;
  zze zzano;

  zzpi(int paramInt1, int paramInt2, zzpg paramzzpg, IBinder paramIBinder1, PendingIntent paramPendingIntent, IBinder paramIBinder2)
  {
    this.zzFG = paramInt1;
    this.zzanl = paramInt2;
    this.zzanm = paramzzpg;
    zzd localzzd;
    zze localzze;
    if (paramIBinder1 == null)
    {
      localzzd = null;
      this.zzann = localzzd;
      this.mPendingIntent = paramPendingIntent;
      localzze = null;
      if (paramIBinder2 != null)
        break label64;
    }
    while (true)
    {
      this.zzano = localzze;
      return;
      localzzd = zzd.zza.zzbg(paramIBinder1);
      break;
      label64: localzze = zze.zza.zzbh(paramIBinder2);
    }
  }

  public static zzpi zza(zze paramzze)
  {
    return new zzpi(1, 2, null, null, null, paramzze.asBinder());
  }

  public static zzpi zzb(zzpg paramzzpg, PendingIntent paramPendingIntent)
  {
    return new zzpi(1, 1, paramzzpg, null, paramPendingIntent, null);
  }

  public static zzpi zzb(zzpg paramzzpg, zzd paramzzd)
  {
    return new zzpi(1, 1, paramzzpg, paramzzd.asBinder(), null, null);
  }

  public static zzpi zzb(zzd paramzzd)
  {
    return new zzpi(1, 2, null, paramzzd.asBinder(), null, null);
  }

  public static zzpi zze(PendingIntent paramPendingIntent)
  {
    return new zzpi(1, 2, null, null, paramPendingIntent, null);
  }

  public int describeContents()
  {
    return 0;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzpj.zza(this, paramParcel, paramInt);
  }

  IBinder zzpA()
  {
    if (this.zzano == null)
      return null;
    return this.zzano.asBinder();
  }

  IBinder zzpz()
  {
    if (this.zzann == null)
      return null;
    return this.zzann.asBinder();
  }
}