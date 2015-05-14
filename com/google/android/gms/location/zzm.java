package com.google.android.gms.location;

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
    zzb.zzc(paramParcel, 1, paramzzl.zzamw);
    zzb.zzc(paramParcel, 1000, paramzzl.getVersionCode());
    zzb.zzc(paramParcel, 2, paramzzl.zzamx);
    zzb.zza(paramParcel, 3, paramzzl.zzamy);
    zzb.zzH(paramParcel, i);
  }

  public zzl zzdt(Parcel paramParcel)
  {
    int i = 1;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    long l = 0L;
    int m = i;
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
      case 1000:
        k = zza.zzg(paramParcel, n);
        break;
      case 2:
        i = zza.zzg(paramParcel, n);
        break;
      case 3:
        l = zza.zzi(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzl(k, m, i, l);
  }

  public zzl[] zzfs(int paramInt)
  {
    return new zzl[paramInt];
  }
}