package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzue
  implements Parcelable.Creator<zztw.zzf>
{
  static void zza(zztw.zzf paramzzf, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzf.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzf.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzzf.zzawz, true);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzzf.zzZO, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzzf.zzavu, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzzf.zzawA, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zza(paramParcel, 6, paramzzf.mName, true);
    if (localSet.contains(Integer.valueOf(7)))
      zzb.zza(paramParcel, 7, paramzzf.zzawB);
    if (localSet.contains(Integer.valueOf(8)))
      zzb.zza(paramParcel, 8, paramzzf.zzavK, true);
    if (localSet.contains(Integer.valueOf(9)))
      zzb.zza(paramParcel, 9, paramzzf.zzSy, true);
    if (localSet.contains(Integer.valueOf(10)))
      zzb.zzc(paramParcel, 10, paramzzf.zzJp);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzf zzeI(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    String str2 = null;
    boolean bool = false;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
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
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        str7 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        str6 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(3));
        break;
      case 4:
        str5 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(4));
        break;
      case 5:
        str4 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        str3 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(6));
        break;
      case 7:
        bool = zza.zzc(paramParcel, m);
        localHashSet.add(Integer.valueOf(7));
        break;
      case 8:
        str2 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(8));
        break;
      case 9:
        str1 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(9));
        break;
      case 10:
        i = zza.zzg(paramParcel, m);
        localHashSet.add(Integer.valueOf(10));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztw.zzf(localHashSet, k, str7, str6, str5, str4, str3, bool, str2, str1, i);
  }

  public zztw.zzf[] zzgV(int paramInt)
  {
    return new zztw.zzf[paramInt];
  }
}