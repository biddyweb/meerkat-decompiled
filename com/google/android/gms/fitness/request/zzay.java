package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;

public class zzay
  implements Parcelable.Creator<zzax>
{
  static void zza(zzax paramzzax, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzax.getDataType(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzax.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzax.getDataSource(), paramInt, false);
    zzb.zza(paramParcel, 3, paramzzax.zzlQ(), false);
    zzb.zza(paramParcel, 4, paramzzax.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzax zzcC(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder = null;
    DataSource localDataSource = null;
    DataType localDataType = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localDataType = (DataType)zza.zza(paramParcel, k, DataType.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localDataSource = (DataSource)zza.zza(paramParcel, k, DataSource.CREATOR);
        break;
      case 3:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 4:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzax(j, localDataType, localDataSource, localIBinder, str);
  }

  public zzax[] zzeb(int paramInt)
  {
    return new zzax[paramInt];
  }
}