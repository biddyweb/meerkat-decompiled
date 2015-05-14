package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzap
  implements Parcelable.Creator<zzao>
{
  static void zza(zzao paramzzao, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzao.zzmb(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzao.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzao.zzlQ(), false);
    zzb.zza(paramParcel, 3, paramzzao.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzao zzcx(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    Object localObject3 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject4;
      Object localObject5;
      Object localObject6;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject4 = localObject1;
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = j;
      case 1:
      case 1000:
      case 2:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject3 = localObject6;
        localObject2 = localObject5;
        localObject1 = localObject4;
        break;
        PendingIntent localPendingIntent = (PendingIntent)zza.zza(paramParcel, k, PendingIntent.CREATOR);
        m = j;
        Object localObject9 = localObject2;
        localObject6 = localPendingIntent;
        localObject4 = localObject1;
        localObject5 = localObject9;
        continue;
        int n = zza.zzg(paramParcel, k);
        Object localObject8 = localObject1;
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = n;
        localObject4 = localObject8;
        continue;
        IBinder localIBinder = zza.zzp(paramParcel, k);
        localObject6 = localObject3;
        m = j;
        Object localObject7 = localObject1;
        localObject5 = localIBinder;
        localObject4 = localObject7;
        continue;
        localObject4 = zza.zzo(paramParcel, k);
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzao(j, localObject3, localObject2, localObject1);
  }

  public zzao[] zzdW(int paramInt)
  {
    return new zzao[paramInt];
  }
}