package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzub
  implements Parcelable.Creator<zztw.zzb.zzb>
{
  static void zza(zztw.zzb.zzb paramzzb, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzb.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzb.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zzc(paramParcel, 2, paramzzb.zzlj);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzzb.zzxX, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zzc(paramParcel, 4, paramzzb.zzli);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzb.zzb zzeF(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    String str = null;
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
        m = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        str = zza.zzo(paramParcel, n);
        localHashSet.add(Integer.valueOf(3));
        break;
      case 4:
        i = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(4));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztw.zzb.zzb(localHashSet, m, k, str, i);
  }

  public zztw.zzb.zzb[] zzgS(int paramInt)
  {
    return new zztw.zzb.zzb[paramInt];
  }
}