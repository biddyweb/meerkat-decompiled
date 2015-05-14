package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Query;

public class QueryRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<QueryRequest> CREATOR = new zzbg();
  final int zzFG;
  final Query zzVd;

  QueryRequest(int paramInt, Query paramQuery)
  {
    this.zzFG = paramInt;
    this.zzVd = paramQuery;
  }

  public QueryRequest(Query paramQuery)
  {
    this(1, paramQuery);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbg.zza(this, paramParcel, paramInt);
  }
}