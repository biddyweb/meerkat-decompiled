package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.query.Query;

public class zzbg
  implements Parcelable.Creator<QueryRequest>
{
  static void zza(QueryRequest paramQueryRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramQueryRequest.zzFG);
    zzb.zza(paramParcel, 2, paramQueryRequest.zzVd, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public QueryRequest zzaS(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Query localQuery = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localQuery = (Query)zza.zza(paramParcel, k, Query.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new QueryRequest(j, localQuery);
  }

  public QueryRequest[] zzcl(int paramInt)
  {
    return new QueryRequest[paramInt];
  }
}