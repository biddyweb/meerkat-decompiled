package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzg
  implements Parcelable.Creator<DataReadRequest>
{
  static void zza(DataReadRequest paramDataReadRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramDataReadRequest.getDataTypes(), false);
    zzb.zzc(paramParcel, 1000, paramDataReadRequest.getVersionCode());
    zzb.zzc(paramParcel, 2, paramDataReadRequest.getDataSources(), false);
    zzb.zza(paramParcel, 3, paramDataReadRequest.zzlp());
    zzb.zza(paramParcel, 4, paramDataReadRequest.zzlq());
    zzb.zzc(paramParcel, 5, paramDataReadRequest.getAggregatedDataTypes(), false);
    zzb.zzc(paramParcel, 6, paramDataReadRequest.getAggregatedDataSources(), false);
    zzb.zzc(paramParcel, 7, paramDataReadRequest.getBucketType());
    zzb.zza(paramParcel, 8, paramDataReadRequest.zzlX());
    zzb.zza(paramParcel, 9, paramDataReadRequest.getActivityDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 10, paramDataReadRequest.getLimit());
    zzb.zza(paramParcel, 12, paramDataReadRequest.zzlW());
    zzb.zza(paramParcel, 13, paramDataReadRequest.zzlV());
    zzb.zza(paramParcel, 14, paramDataReadRequest.zzlQ(), false);
    zzb.zza(paramParcel, 15, paramDataReadRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataReadRequest zzce(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    long l1 = 0L;
    long l2 = 0L;
    ArrayList localArrayList3 = null;
    ArrayList localArrayList4 = null;
    int k = 0;
    long l3 = 0L;
    DataSource localDataSource = null;
    int m = 0;
    boolean bool1 = false;
    boolean bool2 = false;
    IBinder localIBinder = null;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        localArrayList1 = zza.zzc(paramParcel, n, DataType.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        localArrayList2 = zza.zzc(paramParcel, n, DataSource.CREATOR);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 4:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 5:
        localArrayList3 = zza.zzc(paramParcel, n, DataType.CREATOR);
        break;
      case 6:
        localArrayList4 = zza.zzc(paramParcel, n, DataSource.CREATOR);
        break;
      case 7:
        k = zza.zzg(paramParcel, n);
        break;
      case 8:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 9:
        localDataSource = (DataSource)zza.zza(paramParcel, n, DataSource.CREATOR);
        break;
      case 10:
        m = zza.zzg(paramParcel, n);
        break;
      case 12:
        bool1 = zza.zzc(paramParcel, n);
        break;
      case 13:
        bool2 = zza.zzc(paramParcel, n);
        break;
      case 14:
        localIBinder = zza.zzp(paramParcel, n);
        break;
      case 15:
        str = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataReadRequest(j, localArrayList1, localArrayList2, l1, l2, localArrayList3, localArrayList4, k, l3, localDataSource, m, bool1, bool2, localIBinder, str);
  }

  public DataReadRequest[] zzdC(int paramInt)
  {
    return new DataReadRequest[paramInt];
  }
}