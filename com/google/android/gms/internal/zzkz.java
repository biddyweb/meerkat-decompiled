package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzkz
  implements Parcelable.Creator<zzky>
{
  static void zza(zzky paramzzky, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzky.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzky.zzju(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzky zzM(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    zzla localzzla = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localzzla = (zzla)zza.zza(paramParcel, k, zzla.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzky(j, localzzla);
  }

  public zzky[] zzaS(int paramInt)
  {
    return new zzky[paramInt];
  }
}