package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzj
  implements Parcelable.Creator<DataSourcesRequest>
{
  static void zza(DataSourcesRequest paramDataSourcesRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramDataSourcesRequest.getDataTypes(), false);
    zzb.zzc(paramParcel, 1000, paramDataSourcesRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataSourcesRequest.zzlY(), false);
    zzb.zza(paramParcel, 3, paramDataSourcesRequest.zzlZ());
    zzb.zza(paramParcel, 4, paramDataSourcesRequest.zzlQ(), false);
    zzb.zza(paramParcel, 5, paramDataSourcesRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataSourcesRequest zzcg(Parcel paramParcel)
  {
    boolean bool = false;
    String str = null;
    int i = zza.zzJ(paramParcel);
    IBinder localIBinder = null;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
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
        localArrayList2 = zza.zzc(paramParcel, k, DataType.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList1 = zza.zzB(paramParcel, k);
        break;
      case 3:
        bool = zza.zzc(paramParcel, k);
        break;
      case 4:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 5:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataSourcesRequest(j, localArrayList2, localArrayList1, bool, localIBinder, str);
  }

  public DataSourcesRequest[] zzdE(int paramInt)
  {
    return new DataSourcesRequest[paramInt];
  }
}