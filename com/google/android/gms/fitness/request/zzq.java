package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzq
  implements Parcelable.Creator<zzp>
{
  static void zza(zzp paramzzp, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzp.zzlQ(), false);
    zzb.zzc(paramParcel, 1000, paramzzp.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzp.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzp zzck(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzp(j, localIBinder, str);
  }

  public zzp[] zzdI(int paramInt)
  {
    return new zzp[paramInt];
  }
}