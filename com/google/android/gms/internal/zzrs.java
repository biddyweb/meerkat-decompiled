package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzrs
  implements Parcelable.Creator<zzrr>
{
  static void zza(zzrr paramzzrr, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzrr.zzatf);
    zzb.zzc(paramParcel, 1000, paramzzrr.versionCode);
    zzb.zzc(paramParcel, 2, paramzzrr.zzatg);
    zzb.zzc(paramParcel, 3, paramzzrr.zzath);
    zzb.zzH(paramParcel, i);
  }

  public zzrr zzem(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    int m = 0;
    int n = 0;
    while (paramParcel.dataPosition() < j)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        m = zza.zzg(paramParcel, i1);
        break;
      case 1000:
        n = zza.zzg(paramParcel, i1);
        break;
      case 2:
        k = zza.zzg(paramParcel, i1);
        break;
      case 3:
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzrr(n, m, k, i);
  }

  public zzrr[] zzgy(int paramInt)
  {
    return new zzrr[paramInt];
  }
}