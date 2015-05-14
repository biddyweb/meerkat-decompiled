package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzuf
  implements Parcelable.Creator<zztw.zzg>
{
  static void zza(zztw.zzg paramzzg, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzg.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzg.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzzg.zzawB);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzzg.mValue, true);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzg zzeJ(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    String str = null;
    int j = 0;
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
        bool = zza.zzc(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(3));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztw.zzg(localHashSet, j, bool, str);
  }

  public zztw.zzg[] zzgW(int paramInt)
  {
    return new zztw.zzg[paramInt];
  }
}