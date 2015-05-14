package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import java.util.ArrayList;

public class zze
  implements Parcelable.Creator<DataSourcesResult>
{
  static void zza(DataSourcesResult paramDataSourcesResult, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramDataSourcesResult.getDataSources(), false);
    zzb.zzc(paramParcel, 1000, paramDataSourcesResult.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataSourcesResult.getStatus(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public DataSourcesResult zzcG(Parcel paramParcel)
  {
    Status localStatus = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList = zza.zzc(paramParcel, k, DataSource.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localStatus = (Status)zza.zza(paramParcel, k, Status.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataSourcesResult(j, localArrayList, localStatus);
  }

  public DataSourcesResult[] zzef(int paramInt)
  {
    return new DataSourcesResult[paramInt];
  }
}