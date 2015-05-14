package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzn
  implements Parcelable.Creator<RawDataPoint>
{
  static void zza(RawDataPoint paramRawDataPoint, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramRawDataPoint.zzYG);
    zzb.zzc(paramParcel, 1000, paramRawDataPoint.zzFG);
    zzb.zza(paramParcel, 2, paramRawDataPoint.zzYH);
    zzb.zza(paramParcel, 3, paramRawDataPoint.zzYI, paramInt, false);
    zzb.zzc(paramParcel, 4, paramRawDataPoint.zzZJ);
    zzb.zzc(paramParcel, 5, paramRawDataPoint.zzZK);
    zzb.zza(paramParcel, 6, paramRawDataPoint.zzYK);
    zzb.zza(paramParcel, 7, paramRawDataPoint.zzYL);
    zzb.zzH(paramParcel, i);
  }

  public RawDataPoint zzbT(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l1 = 0L;
    long l2 = 0L;
    Value[] arrayOfValue = null;
    int k = 0;
    int m = 0;
    long l3 = 0L;
    long l4 = 0L;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 3:
        arrayOfValue = (Value[])zza.zzb(paramParcel, n, Value.CREATOR);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        m = zza.zzg(paramParcel, n);
        break;
      case 6:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 7:
        l4 = zza.zzi(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new RawDataPoint(j, l1, l2, arrayOfValue, k, m, l3, l4);
  }

  public RawDataPoint[] zzdq(int paramInt)
  {
    return new RawDataPoint[paramInt];
  }
}