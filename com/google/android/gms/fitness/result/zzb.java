package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<DataReadResult>
{
  static void zza(DataReadResult paramDataReadResult, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzd(paramParcel, 1, paramDataReadResult.zzmp(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1000, paramDataReadResult.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramDataReadResult.getStatus(), paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzd(paramParcel, 3, paramDataReadResult.zzmo(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 5, paramDataReadResult.zzmn());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 6, paramDataReadResult.zzlx(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 7, paramDataReadResult.zzmq(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public DataReadResult zzcE(Parcel paramParcel)
  {
    int i = 0;
    ArrayList localArrayList1 = null;
    int j = zza.zzJ(paramParcel);
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList3 = new ArrayList();
    ArrayList localArrayList4 = null;
    Status localStatus = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        zza.zza(paramParcel, m, localArrayList2, getClass().getClassLoader());
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localStatus = (Status)zza.zza(paramParcel, m, Status.CREATOR);
        break;
      case 3:
        zza.zza(paramParcel, m, localArrayList3, getClass().getClassLoader());
        break;
      case 5:
        i = zza.zzg(paramParcel, m);
        break;
      case 6:
        localArrayList4 = zza.zzc(paramParcel, m, DataSource.CREATOR);
        break;
      case 7:
        localArrayList1 = zza.zzc(paramParcel, m, DataType.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new DataReadResult(k, localArrayList2, localStatus, localArrayList3, i, localArrayList4, localArrayList1);
  }

  public DataReadResult[] zzed(int paramInt)
  {
    return new DataReadResult[paramInt];
  }
}