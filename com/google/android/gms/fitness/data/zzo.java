package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzo
  implements Parcelable.Creator<RawDataSet>
{
  static void zza(RawDataSet paramRawDataSet, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramRawDataSet.zzZJ);
    zzb.zzc(paramParcel, 1000, paramRawDataSet.zzFG);
    zzb.zzc(paramParcel, 2, paramRawDataSet.zzZL);
    zzb.zzc(paramParcel, 3, paramRawDataSet.zzZM, false);
    zzb.zza(paramParcel, 4, paramRawDataSet.zzYF);
    zzb.zzH(paramParcel, i);
  }

  public RawDataSet zzbU(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    int j = 0;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        k = zza.zzg(paramParcel, n);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        j = zza.zzg(paramParcel, n);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, n, RawDataPoint.CREATOR);
        break;
      case 4:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new RawDataSet(m, k, j, localArrayList, bool);
  }

  public RawDataSet[] zzdr(int paramInt)
  {
    return new RawDataSet[paramInt];
  }
}