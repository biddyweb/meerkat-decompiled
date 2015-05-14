package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzty
  implements Parcelable.Creator<zztw.zza>
{
  static void zza(zztw.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzza.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzza.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zzc(paramParcel, 2, paramzza.zzawo);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zzc(paramParcel, 3, paramzza.zzawp);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zza zzeC(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
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
        i = zza.zzg(paramParcel, n);
        localHashSet.add(Integer.valueOf(3));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztw.zza(localHashSet, m, k, i);
  }

  public zztw.zza[] zzgP(int paramInt)
  {
    return new zztw.zza[paramInt];
  }
}