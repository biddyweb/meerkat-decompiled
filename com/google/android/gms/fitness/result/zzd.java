package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;

public class zzd
  implements Parcelable.Creator<zzc>
{
  static void zza(zzc paramzzc, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzc.zzYp, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzc.zzFG);
    zzb.zza(paramParcel, 2, paramzzc.zzHf);
    zzb.zza(paramParcel, 3, paramzzc.zzabP);
    zzb.zza(paramParcel, 4, paramzzc.zzabQ);
    zzb.zza(paramParcel, 5, paramzzc.zzabR);
    zzb.zzH(paramParcel, i);
  }

  public zzc zzcF(Parcel paramParcel)
  {
    boolean bool = false;
    long l1 = 0L;
    int i = zza.zzJ(paramParcel);
    DataSource localDataSource = null;
    long l2 = l1;
    long l3 = l1;
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
        localDataSource = (DataSource)zza.zza(paramParcel, k, DataSource.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        l3 = zza.zzi(paramParcel, k);
        break;
      case 3:
        bool = zza.zzc(paramParcel, k);
        break;
      case 4:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 5:
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzc(j, localDataSource, l3, bool, l2, l1);
  }

  public zzc[] zzee(int paramInt)
  {
    return new zzc[paramInt];
  }
}