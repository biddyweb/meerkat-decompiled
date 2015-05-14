package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzug
  implements Parcelable.Creator<zztw.zzh>
{
  static void zza(zztw.zzh paramzzh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzh.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzh.zzFG);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zzc(paramParcel, 3, paramzzh.zzso());
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzzh.mValue, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzzh.zzawC, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zzc(paramParcel, 6, paramzzh.zzJp);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzh zzeK(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int k = 0;
    String str2 = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      case 2:
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(3));
        break;
      case 4:
        str1 = zza.zzo(paramParcel, n);
        localHashSet.add(Integer.valueOf(4));
        break;
      case 5:
        str2 = zza.zzo(paramParcel, n);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        k = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(6));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztw.zzh(localHashSet, m, str2, k, str1, i);
  }

  public zztw.zzh[] zzgX(int paramInt)
  {
    return new zztw.zzh[paramInt];
  }
}