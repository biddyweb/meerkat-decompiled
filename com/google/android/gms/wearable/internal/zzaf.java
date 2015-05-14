package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzaf
  implements Parcelable.Creator<zzae>
{
  static void zza(zzae paramzzae, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzae.versionCode);
    zzb.zzc(paramParcel, 2, paramzzae.statusCode);
    zzb.zza(paramParcel, 3, paramzzae.zzaGn, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzae zzfE(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    zzao localzzao = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
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
      case 2:
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        localzzao = (zzao)zza.zza(paramParcel, m, zzao.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzae(k, i, localzzao);
  }

  public zzae[] zzie(int paramInt)
  {
    return new zzae[paramInt];
  }
}