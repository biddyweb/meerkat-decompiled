package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<DataPoint>
{
  static void zza(DataPoint paramDataPoint, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataPoint.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramDataPoint.getVersionCode());
    zzb.zza(paramParcel, 3, paramDataPoint.getTimestampNanos());
    zzb.zza(paramParcel, 4, paramDataPoint.zzlv());
    zzb.zza(paramParcel, 5, paramDataPoint.zzls(), paramInt, false);
    zzb.zza(paramParcel, 6, paramDataPoint.getOriginalDataSource(), paramInt, false);
    zzb.zza(paramParcel, 7, paramDataPoint.zzlt());
    zzb.zza(paramParcel, 8, paramDataPoint.zzlu());
    zzb.zzH(paramParcel, i);
  }

  public DataPoint zzbM(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DataSource localDataSource1 = null;
    long l1 = 0L;
    long l2 = 0L;
    Value[] arrayOfValue = null;
    DataSource localDataSource2 = null;
    long l3 = 0L;
    long l4 = 0L;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localDataSource1 = (DataSource)zza.zza(paramParcel, k, DataSource.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 4:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 5:
        arrayOfValue = (Value[])zza.zzb(paramParcel, k, Value.CREATOR);
        break;
      case 6:
        localDataSource2 = (DataSource)zza.zza(paramParcel, k, DataSource.CREATOR);
        break;
      case 7:
        l3 = zza.zzi(paramParcel, k);
        break;
      case 8:
        l4 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataPoint(j, localDataSource1, l1, l2, arrayOfValue, localDataSource2, l3, l4);
  }

  public DataPoint[] zzdj(int paramInt)
  {
    return new DataPoint[paramInt];
  }
}