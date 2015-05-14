package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzpp
  implements Parcelable.Creator<zzpo>
{
  static void zza(zzpo paramzzpo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzpo.zzZO, false);
    zzb.zzc(paramParcel, 1000, paramzzpo.zzFG);
    zzb.zza(paramParcel, 2, paramzzpo.zzanM, false);
    zzb.zza(paramParcel, 3, paramzzpo.zzanu, false);
    zzb.zzc(paramParcel, 4, paramzzpo.zzaoi, false);
    zzb.zzc(paramParcel, 5, paramzzpo.zzaoj);
    zzb.zzH(paramParcel, i);
  }

  public zzpo zzdE(Parcel paramParcel)
  {
    int i = 0;
    ArrayList localArrayList1 = null;
    int j = zza.zzJ(paramParcel);
    ArrayList localArrayList2 = null;
    String str1 = null;
    String str2 = null;
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
        str2 = zza.zzo(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 3:
        localArrayList2 = zza.zzB(paramParcel, m);
        break;
      case 4:
        localArrayList1 = zza.zzc(paramParcel, m, zzpo.zza.CREATOR);
        break;
      case 5:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzpo(k, str2, str1, localArrayList2, localArrayList1, i);
  }

  public zzpo[] zzfG(int paramInt)
  {
    return new zzpo[paramInt];
  }
}