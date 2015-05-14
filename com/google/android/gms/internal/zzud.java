package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzud
  implements Parcelable.Creator<zztw.zzd>
{
  static void zza(zztw.zzd paramzzd, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzd.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzd.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzzd.zzavv, true);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzzd.zzawv, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzzd.zzavy, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzzd.zzaww, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zza(paramParcel, 6, paramzzd.zzawx, true);
    if (localSet.contains(Integer.valueOf(7)))
      zzb.zza(paramParcel, 7, paramzzd.zzawy, true);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzd zzeH(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
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
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        str6 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        str5 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(3));
        break;
      case 4:
        str4 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(4));
        break;
      case 5:
        str3 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        str2 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(6));
        break;
      case 7:
        str1 = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(7));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztw.zzd(localHashSet, j, str6, str5, str4, str3, str2, str1);
  }

  public zztw.zzd[] zzgU(int paramInt)
  {
    return new zztw.zzd[paramInt];
  }
}