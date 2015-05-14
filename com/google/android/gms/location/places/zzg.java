package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<zzf>
{
  static void zza(zzf paramzzf, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramzzf.zzFG);
    zzb.zza(paramParcel, 2, paramzzf.zzpH(), paramInt, false);
    zzb.zza(paramParcel, 3, paramzzf.getInterval());
    zzb.zzc(paramParcel, 4, paramzzf.getPriority());
    zzb.zza(paramParcel, 5, paramzzf.getExpirationTime());
    zzb.zzH(paramParcel, i);
  }

  public zzf zzdC(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    PlaceFilter localPlaceFilter = null;
    long l1 = zzf.zzanO;
    int k = 102;
    long l2 = 9223372036854775807L;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1000:
        j = zza.zzg(paramParcel, m);
        break;
      case 2:
        localPlaceFilter = (PlaceFilter)zza.zza(paramParcel, m, PlaceFilter.CREATOR);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, m);
        break;
      case 4:
        k = zza.zzg(paramParcel, m);
        break;
      case 5:
        l2 = zza.zzi(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzf(j, localPlaceFilter, l1, k, l2);
  }

  public zzf[] zzfE(int paramInt)
  {
    return new zzf[paramInt];
  }
}