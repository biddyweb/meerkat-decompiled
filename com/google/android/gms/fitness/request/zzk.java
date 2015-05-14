package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.Field;
import java.util.ArrayList;

public class zzk
  implements Parcelable.Creator<DataTypeCreateRequest>
{
  static void zza(DataTypeCreateRequest paramDataTypeCreateRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataTypeCreateRequest.getName(), false);
    zzb.zzc(paramParcel, 1000, paramDataTypeCreateRequest.getVersionCode());
    zzb.zzc(paramParcel, 2, paramDataTypeCreateRequest.getFields(), false);
    zzb.zza(paramParcel, 3, paramDataTypeCreateRequest.zzlQ(), false);
    zzb.zza(paramParcel, 4, paramDataTypeCreateRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataTypeCreateRequest zzch(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder = null;
    ArrayList localArrayList = null;
    String str2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList = zza.zzc(paramParcel, k, Field.CREATOR);
        break;
      case 3:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataTypeCreateRequest(j, str2, localArrayList, localIBinder, str1);
  }

  public DataTypeCreateRequest[] zzdF(int paramInt)
  {
    return new DataTypeCreateRequest[paramInt];
  }
}