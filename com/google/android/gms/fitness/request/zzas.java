package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzas
  implements Parcelable.Creator<zzar>
{
  static void zza(zzar paramzzar, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzar.zzmk(), false);
    zzb.zzc(paramParcel, 1000, paramzzar.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzar.zzlQ(), false);
    zzb.zza(paramParcel, 3, paramzzar.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzar zzcz(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder1 = null;
    IBinder localIBinder2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localIBinder2 = zza.zzp(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localIBinder1 = zza.zzp(paramParcel, k);
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzar(j, localIBinder2, localIBinder1, str);
  }

  public zzar[] zzdY(int paramInt)
  {
    return new zzar[paramInt];
  }
}