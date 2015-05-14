package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveSpace;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import java.util.ArrayList;

public class zza
  implements Parcelable.Creator<Query>
{
  static void zza(Query paramQuery, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramQuery.zzFG);
    zzb.zza(paramParcel, 1, paramQuery.zzWm, paramInt, false);
    zzb.zza(paramParcel, 3, paramQuery.zzWn, false);
    zzb.zza(paramParcel, 4, paramQuery.zzWo, paramInt, false);
    zzb.zzb(paramParcel, 5, paramQuery.zzWp, false);
    zzb.zza(paramParcel, 6, paramQuery.zzWq);
    zzb.zzc(paramParcel, 7, paramQuery.zzUx, false);
    zzb.zzH(paramParcel, i);
  }

  public Query zzbh(Parcel paramParcel)
  {
    boolean bool = false;
    ArrayList localArrayList1 = null;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    ArrayList localArrayList2 = null;
    SortOrder localSortOrder = null;
    String str = null;
    LogicalFilter localLogicalFilter = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1000:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 1:
        localLogicalFilter = (LogicalFilter)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, LogicalFilter.CREATOR);
        break;
      case 3:
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 4:
        localSortOrder = (SortOrder)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, SortOrder.CREATOR);
        break;
      case 5:
        localArrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzC(paramParcel, k);
        break;
      case 6:
        bool = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k);
        break;
      case 7:
        localArrayList1 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k, DriveSpace.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new Query(j, localLogicalFilter, str, localSortOrder, localArrayList2, bool, localArrayList1);
  }

  public Query[] zzcA(int paramInt)
  {
    return new Query[paramInt];
  }
}