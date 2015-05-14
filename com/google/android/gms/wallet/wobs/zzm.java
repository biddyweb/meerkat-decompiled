package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzm
  implements Parcelable.Creator<zzl>
{
  static void zza(zzl paramzzl, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzl.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzl.zzaFm);
    zzb.zza(paramParcel, 3, paramzzl.zzaFn);
    zzb.zzH(paramParcel, i);
  }

  public zzl zzfo(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l2 = l1;
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
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzl(j, l2, l1);
  }

  public zzl[] zzhO(int paramInt)
  {
    return new zzl[paramInt];
  }
}