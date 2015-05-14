package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zzuc
  implements Parcelable.Creator<zztw.zzc>
{
  static void zza(zztw.zzc paramzzc, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzc.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzc.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzzc.zzxX, true);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzc zzeG(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    String str = null;
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
        str = zza.zzo(paramParcel, k);
        localHashSet.add(Integer.valueOf(2));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztw.zzc(localHashSet, j, str);
  }

  public zztw.zzc[] zzgT(int paramInt)
  {
    return new zztw.zzc[paramInt];
  }
}