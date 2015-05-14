package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzqk
  implements Parcelable.Creator<zzpo.zza>
{
  static void zza(zzpo.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzza.mOffset);
    zzb.zzc(paramParcel, 1000, paramzza.zzFG);
    zzb.zzc(paramParcel, 2, paramzza.mLength);
    zzb.zzH(paramParcel, i);
  }

  public zzpo.zza zzdJ(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
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
        k = zza.zzg(paramParcel, n);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzpo.zza(m, k, i);
  }

  public zzpo.zza[] zzfM(int paramInt)
  {
    return new zzpo.zza[paramInt];
  }
}