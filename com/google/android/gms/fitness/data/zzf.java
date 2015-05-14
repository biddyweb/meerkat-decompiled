package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzf
  implements Parcelable.Creator<DataSet>
{
  static void zza(DataSet paramDataSet, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataSet.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramDataSet.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataSet.getDataType(), paramInt, false);
    zzb.zzd(paramParcel, 3, paramDataSet.zzlw(), false);
    zzb.zzc(paramParcel, 4, paramDataSet.zzlx(), false);
    zzb.zza(paramParcel, 5, paramDataSet.zzlo());
    zzb.zzH(paramParcel, i);
  }

  public DataSet zzbN(Parcel paramParcel)
  {
    boolean bool = false;
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList2 = new ArrayList();
    DataType localDataType = null;
    DataSource localDataSource = null;
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
        localDataType = (DataType)zza.zza(paramParcel, k, DataType.CREATOR);
        break;
      case 3:
        zza.zza(paramParcel, k, localArrayList2, getClass().getClassLoader());
        break;
      case 4:
        localArrayList1 = zza.zzc(paramParcel, k, DataSource.CREATOR);
        break;
      case 5:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataSet(j, localDataSource, localDataType, localArrayList2, localArrayList1, bool);
  }

  public DataSet[] zzdk(int paramInt)
  {
    return new DataSet[paramInt];
  }
}