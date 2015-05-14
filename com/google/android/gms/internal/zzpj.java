package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzpj
  implements Parcelable.Creator<zzpi>
{
  static void zza(zzpi paramzzpi, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzpi.zzanl);
    zzb.zzc(paramParcel, 1000, paramzzpi.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzpi.zzanm, paramInt, false);
    zzb.zza(paramParcel, 3, paramzzpi.zzpz(), false);
    zzb.zza(paramParcel, 4, paramzzpi.mPendingIntent, paramInt, false);
    zzb.zza(paramParcel, 5, paramzzpi.zzpA(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzpi zzdw(Parcel paramParcel)
  {
    IBinder localIBinder1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 1;
    PendingIntent localPendingIntent = null;
    IBinder localIBinder2 = null;
    zzpg localzzpg = null;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 1000:
        j = zza.zzg(paramParcel, m);
        break;
      case 2:
        localzzpg = (zzpg)zza.zza(paramParcel, m, zzpg.CREATOR);
        break;
      case 3:
        localIBinder2 = zza.zzp(paramParcel, m);
        break;
      case 4:
        localPendingIntent = (PendingIntent)zza.zza(paramParcel, m, PendingIntent.CREATOR);
        break;
      case 5:
        localIBinder1 = zza.zzp(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzpi(j, k, localzzpg, localIBinder2, localPendingIntent, localIBinder1);
  }

  public zzpi[] zzfv(int paramInt)
  {
    return new zzpi[paramInt];
  }
}