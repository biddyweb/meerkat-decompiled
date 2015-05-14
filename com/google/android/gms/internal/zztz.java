package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.HashSet;
import java.util.Set;

public class zztz
  implements Parcelable.Creator<zztw.zzb>
{
  static void zza(zztw.zzb paramzzb, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzzb.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzzb.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzzb.zzawq, paramInt, true);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzzb.zzawr, paramInt, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zzc(paramParcel, 4, paramzzb.zzaws);
    zzb.zzH(paramParcel, i);
  }

  public zztw.zzb zzeD(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    Object localObject2 = null;
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
        zztw.zzb.zza localzza = (zztw.zzb.zza)zza.zza(paramParcel, m, zztw.zzb.zza.CREATOR);
        localHashSet.add(Integer.valueOf(2));
        localObject2 = localzza;
        break;
      case 3:
        zztw.zzb.zzb localzzb = (zztw.zzb.zzb)zza.zza(paramParcel, m, zztw.zzb.zzb.CREATOR);
        localHashSet.add(Integer.valueOf(3));
        localObject1 = localzzb;
        break;
      case 4:
        i = zza.zzg(paramParcel, m);
        localHashSet.add(Integer.valueOf(4));
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztw.zzb(localHashSet, k, localObject2, localObject1, i);
  }

  public zztw.zzb[] zzgQ(int paramInt)
  {
    return new zztw.zzb[paramInt];
  }
}