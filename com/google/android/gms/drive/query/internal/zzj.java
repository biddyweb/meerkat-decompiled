package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
  implements Parcelable.Creator<LogicalFilter>
{
  static void zza(LogicalFilter paramLogicalFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramLogicalFilter.zzFG);
    zzb.zza(paramParcel, 1, paramLogicalFilter.zzWw, paramInt, false);
    zzb.zzc(paramParcel, 2, paramLogicalFilter.zzWK, false);
    zzb.zzH(paramParcel, i);
  }

  public LogicalFilter zzbq(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        localObject4 = localObject2;
        m = j;
      case 1000:
      case 1:
      case 2:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        Operator localOperator = (Operator)zza.zza(paramParcel, k, Operator.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localOperator;
        continue;
        localObject3 = zza.zzc(paramParcel, k, FilterHolder.CREATOR);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LogicalFilter(j, localObject2, localObject1);
  }

  public LogicalFilter[] zzcJ(int paramInt)
  {
    return new LogicalFilter[paramInt];
  }
}