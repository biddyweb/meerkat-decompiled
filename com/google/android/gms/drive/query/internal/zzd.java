package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzd
  implements Parcelable.Creator<FilterHolder>
{
  static void zza(FilterHolder paramFilterHolder, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramFilterHolder.zzWA, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramFilterHolder.zzFG);
    zzb.zza(paramParcel, 2, paramFilterHolder.zzWB, paramInt, false);
    zzb.zza(paramParcel, 3, paramFilterHolder.zzWC, paramInt, false);
    zzb.zza(paramParcel, 4, paramFilterHolder.zzWD, paramInt, false);
    zzb.zza(paramParcel, 5, paramFilterHolder.zzWE, paramInt, false);
    zzb.zza(paramParcel, 6, paramFilterHolder.zzWF, paramInt, false);
    zzb.zza(paramParcel, 7, paramFilterHolder.zzWG, paramInt, false);
    zzb.zza(paramParcel, 8, paramFilterHolder.zzWH, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public FilterHolder zzbm(Parcel paramParcel)
  {
    FullTextSearchFilter localFullTextSearchFilter = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    HasFilter localHasFilter = null;
    MatchAllFilter localMatchAllFilter = null;
    InFilter localInFilter = null;
    NotFilter localNotFilter = null;
    LogicalFilter localLogicalFilter = null;
    FieldOnlyFilter localFieldOnlyFilter = null;
    ComparisonFilter localComparisonFilter = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localComparisonFilter = (ComparisonFilter)zza.zza(paramParcel, k, ComparisonFilter.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localFieldOnlyFilter = (FieldOnlyFilter)zza.zza(paramParcel, k, FieldOnlyFilter.CREATOR);
        break;
      case 3:
        localLogicalFilter = (LogicalFilter)zza.zza(paramParcel, k, LogicalFilter.CREATOR);
        break;
      case 4:
        localNotFilter = (NotFilter)zza.zza(paramParcel, k, NotFilter.CREATOR);
        break;
      case 5:
        localInFilter = (InFilter)zza.zza(paramParcel, k, InFilter.CREATOR);
        break;
      case 6:
        localMatchAllFilter = (MatchAllFilter)zza.zza(paramParcel, k, MatchAllFilter.CREATOR);
        break;
      case 7:
        localHasFilter = (HasFilter)zza.zza(paramParcel, k, HasFilter.CREATOR);
        break;
      case 8:
        localFullTextSearchFilter = (FullTextSearchFilter)zza.zza(paramParcel, k, FullTextSearchFilter.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FilterHolder(j, localComparisonFilter, localFieldOnlyFilter, localLogicalFilter, localNotFilter, localInFilter, localMatchAllFilter, localHasFilter, localFullTextSearchFilter);
  }

  public FilterHolder[] zzcF(int paramInt)
  {
    return new FilterHolder[paramInt];
  }
}