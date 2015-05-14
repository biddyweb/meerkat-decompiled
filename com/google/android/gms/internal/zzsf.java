package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzsf
  implements Parcelable.Creator<zzse>
{
  static void zza(zzse paramzzse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzse.versionCode);
    zzb.zza(paramParcel, 2, paramzzse.zzatk, paramInt, false);
    zzb.zza(paramParcel, 3, paramzzse.zzrq(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzse zzeq(Parcel paramParcel)
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
      case 2:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        zzrw localzzrw = (zzrw)zza.zza(paramParcel, k, zzrw.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localzzrw;
        continue;
        localObject3 = zza.zzp(paramParcel, k);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzse(j, localObject2, localObject1);
  }

  public zzse[] zzgC(int paramInt)
  {
    return new zzse[paramInt];
  }
}