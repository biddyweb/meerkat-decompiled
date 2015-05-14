package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzo
  implements Parcelable.Creator<zzn>
{
  static void zza(zzn paramzzn, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzn.getStatus(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzn.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzn.zzmu());
    zzb.zzH(paramParcel, i);
  }

  public zzn zzcN(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject1 = null;
    long l1 = 0L;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      long l2;
      Object localObject2;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        l2 = l1;
        localObject2 = localObject1;
        m = j;
      case 1:
      case 1000:
      case 2:
      }
      while (true)
      {
        localObject1 = localObject2;
        j = m;
        l1 = l2;
        break;
        Status localStatus = (Status)zza.zza(paramParcel, k, Status.CREATOR);
        long l4 = l1;
        localObject2 = localStatus;
        m = j;
        l2 = l4;
        continue;
        int n = zza.zzg(paramParcel, k);
        long l3 = l1;
        localObject2 = localObject1;
        m = n;
        l2 = l3;
        continue;
        l2 = zza.zzi(paramParcel, k);
        localObject2 = localObject1;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzn(j, localObject1, l1);
  }

  public zzn[] zzem(int paramInt)
  {
    return new zzn[paramInt];
  }
}