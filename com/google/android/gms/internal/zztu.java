package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zztu
  implements Parcelable.Creator<zztt>
{
  static void zza(zztt paramzztt, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzztt.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzztt.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzztt.zzFA, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzztt.zzavS, paramInt, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzztt.zzavK, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zza(paramParcel, 6, paramzztt.zzavT, paramInt, true);
    if (localSet.contains(Integer.valueOf(7)))
      zzb.zza(paramParcel, 7, paramzztt.zzxV, true);
    zzb.zzH(paramParcel, i);
  }

  public zztt zzeA(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    Object localObject1 = null;
    String str2 = null;
    Object localObject2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      case 3:
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        str3 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 4:
        zztr localzztr2 = (zztr)zza.zza(paramParcel, k, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(4));
        localObject2 = localzztr2;
        break;
      case 5:
        str2 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        zztr localzztr1 = (zztr)zza.zza(paramParcel, k, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(6));
        localObject1 = localzztr1;
        break;
      case 7:
        str1 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(7));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztt(localHashSet, j, str3, localObject2, str2, localObject1, str1);
  }

  public zztt[] zzgN(int paramInt)
  {
    return new zztt[paramInt];
  }
}