package com.google.android.gms.fitness.request;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;

public class zzi
  implements Parcelable.Creator<zzh>
{
  static void zza(zzh paramzzh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzh.zzYp, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzh.zzFG);
    zzb.zza(paramParcel, 2, paramzzh.zzHf);
    zzb.zza(paramParcel, 3, paramzzh.zzYH);
    zzb.zza(paramParcel, 4, paramzzh.zzabb);
    zzb.zzc(paramParcel, 5, paramzzh.zzaaX);
    zzb.zzc(paramParcel, 6, paramzzh.zzabc);
    zzb.zzH(paramParcel, i);
  }

  public zzh zzcf(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    DataSource localDataSource = null;
    int k = 0;
    long l2 = l1;
    long l3 = l1;
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
        localDataSource = (DataSource)zza.zza(paramParcel, n, DataSource.CREATOR);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 3:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 4:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzh(m, localDataSource, l3, l2, l1, k, i);
  }

  public zzh[] zzdD(int paramInt)
  {
    return new zzh[paramInt];
  }
}