package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<DataSource>
{
  static void zza(DataSource paramDataSource, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataSource.getDataType(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramDataSource.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataSource.getName(), false);
    zzb.zzc(paramParcel, 3, paramDataSource.getType());
    zzb.zza(paramParcel, 4, paramDataSource.getDevice(), paramInt, false);
    zzb.zza(paramParcel, 5, paramDataSource.zzlz(), paramInt, false);
    zzb.zza(paramParcel, 6, paramDataSource.getStreamName(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataSource zzbO(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    zza localzza = null;
    Device localDevice = null;
    String str2 = null;
    DataType localDataType = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(m))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1:
        localDataType = (DataType)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, DataType.CREATOR);
        break;
      case 1000:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2:
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 3:
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 4:
        localDevice = (Device)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, Device.CREATOR);
        break;
      case 5:
        localzza = (zza)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, zza.CREATOR);
        break;
      case 6:
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new DataSource(k, localDataType, str2, i, localDevice, localzza, str1);
  }

  public DataSource[] zzdl(int paramInt)
  {
    return new DataSource[paramInt];
  }
}