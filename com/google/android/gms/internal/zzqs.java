package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzqs
  implements Parcelable.Creator<zzqq>
{
  static void zza(zzqq paramzzqq, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzqq.zzpZ(), false);
    zzb.zzc(paramParcel, 1000, paramzzqq.zzFG);
    zzb.zza(paramParcel, 2, paramzzqq.getPlaceId(), false);
    zzb.zzc(paramParcel, 5, paramzzqq.zzqc(), false);
    zzb.zzc(paramParcel, 6, paramzzqq.zzqa(), false);
    zzb.zzc(paramParcel, 7, paramzzqq.zzqb(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzqq zzdN(Parcel paramParcel)
  {
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList2 = null;
    ArrayList localArrayList3 = null;
    String str1 = null;
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
        break;
      case 5:
        localArrayList3 = zza.zzc(paramParcel, k, zzqu.CREATOR);
        break;
      case 6:
        localArrayList2 = zza.zzc(paramParcel, k, zzqo.CREATOR);
        break;
      case 7:
        localArrayList1 = zza.zzc(paramParcel, k, zzqm.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzqq(j, str2, str1, localArrayList3, localArrayList2, localArrayList1);
  }

  public zzqq[] zzfQ(int paramInt)
  {
    return new zzqq[paramInt];
  }
}