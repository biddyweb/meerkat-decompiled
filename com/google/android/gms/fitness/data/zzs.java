package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzs
  implements Parcelable.Creator<Subscription>
{
  static void zza(Subscription paramSubscription, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSubscription.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramSubscription.getVersionCode());
    zzb.zza(paramParcel, 2, paramSubscription.getDataType(), paramInt, false);
    zzb.zza(paramParcel, 3, paramSubscription.zzlI());
    zzb.zzc(paramParcel, 4, paramSubscription.getAccuracyMode());
    zzb.zzH(paramParcel, i);
  }

  public Subscription zzbX(Parcel paramParcel)
  {
    DataType localDataType = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    long l = 0L;
    DataSource localDataSource = null;
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
        localDataSource = (DataSource)zza.zza(paramParcel, m, DataSource.CREATOR);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localDataType = (DataType)zza.zza(paramParcel, m, DataType.CREATOR);
        break;
      case 3:
        l = zza.zzi(paramParcel, m);
        break;
      case 4:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new Subscription(k, localDataSource, localDataType, l, i);
  }

  public Subscription[] zzdv(int paramInt)
  {
    return new Subscription[paramInt];
  }
}