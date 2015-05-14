package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzh
  implements Parcelable.Creator<DataType>
{
  static void zza(DataType paramDataType, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataType.getName(), false);
    zzb.zzc(paramParcel, 1000, paramDataType.getVersionCode());
    zzb.zzc(paramParcel, 2, paramDataType.getFields(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataType zzbP(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList = zza.zzc(paramParcel, k, Field.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataType(j, str, localArrayList);
  }

  public DataType[] zzdm(int paramInt)
  {
    return new DataType[paramInt];
  }
}