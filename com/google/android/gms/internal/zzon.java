package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;

public class zzon
  implements Parcelable.Creator<zzom>
{
  static void zza(zzom paramzzom, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzom.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzom.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public zzom zzca(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DataSource localDataSource = null;
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
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzom(j, localDataSource);
  }

  public zzom[] zzdy(int paramInt)
  {
    return new zzom[paramInt];
  }
}