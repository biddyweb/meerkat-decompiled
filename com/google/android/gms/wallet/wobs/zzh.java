package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzh
  implements Parcelable.Creator<zzg>
{
  static void zza(zzg paramzzg, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzg.getVersionCode());
    zzb.zzc(paramParcel, 2, paramzzg.zzaFg);
    zzb.zza(paramParcel, 3, paramzzg.zzaFh, false);
    zzb.zza(paramParcel, 4, paramzzg.zzaFi);
    zzb.zza(paramParcel, 5, paramzzg.zzaDo, false);
    zzb.zza(paramParcel, 6, paramzzg.zzaFj);
    zzb.zzc(paramParcel, 7, paramzzg.zzaFk);
    zzb.zzH(paramParcel, i);
  }

  public zzg zzfl(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    double d = 0.0D;
    long l = 0L;
    int k = -1;
    String str2 = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        i = zza.zzg(paramParcel, n);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 4:
        d = zza.zzm(paramParcel, n);
        break;
      case 5:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 6:
        l = zza.zzi(paramParcel, n);
        break;
      case 7:
        k = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzg(m, i, str2, d, str1, l, k);
  }

  public zzg[] zzhL(int paramInt)
  {
    return new zzg[paramInt];
  }
}