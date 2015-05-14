package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<zzf>
{
  static void zza(zzf paramzzf, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzf.getStatus(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzf.getVersionCode());
    zzb.zzc(paramParcel, 2, paramzzf.zzmr(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzf zzcH(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        localObject4 = localObject2;
        m = j;
      case 1:
      case 1000:
      case 2:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        Status localStatus = (Status)zza.zza(paramParcel, k, Status.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localStatus;
        continue;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        localObject3 = zza.zzc(paramParcel, k, zzc.CREATOR);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzf(j, localObject2, localObject1);
  }

  public zzf[] zzeg(int paramInt)
  {
    return new zzf[paramInt];
  }
}