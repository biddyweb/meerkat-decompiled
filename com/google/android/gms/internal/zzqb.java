package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzqb
  implements Parcelable.Creator<zzqa>
{
  static void zza(zzqa paramzzqa, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzqa.zzaoO, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzqa.zzFG);
    zzb.zza(paramParcel, 2, paramzzqa.zzaoP);
    zzb.zzH(paramParcel, i);
  }

  public zzqa zzdG(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject1 = null;
    float f1 = 0.0F;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      float f2;
      Object localObject2;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        f2 = f1;
        localObject2 = localObject1;
        m = j;
      case 1:
      case 1000:
      case 2:
      }
      while (true)
      {
        j = m;
        localObject1 = localObject2;
        f1 = f2;
        break;
        zzpy localzzpy = (zzpy)zza.zza(paramParcel, k, zzpy.CREATOR);
        m = j;
        f2 = f1;
        localObject2 = localzzpy;
        continue;
        int n = zza.zzg(paramParcel, k);
        float f3 = f1;
        localObject2 = localObject1;
        m = n;
        f2 = f3;
        continue;
        f2 = zza.zzl(paramParcel, k);
        localObject2 = localObject1;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzqa(j, localObject1, f1);
  }

  public zzqa[] zzfJ(int paramInt)
  {
    return new zzqa[paramInt];
  }
}