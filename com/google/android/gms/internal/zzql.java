package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzql
  implements Parcelable.Creator<zzqm.zza>
{
  static void zza(zzqm.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzza.getTitle(), false);
    zzb.zzc(paramParcel, 1000, paramzza.zzFG);
    zzb.zza(paramParcel, 2, paramzza.getUri(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzqm.zza zzdK(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzqm.zza(j, str2, str1);
  }

  public zzqm.zza[] zzfN(int paramInt)
  {
    return new zzqm.zza[paramInt];
  }
}