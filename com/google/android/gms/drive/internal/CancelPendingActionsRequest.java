package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class CancelPendingActionsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CancelPendingActionsRequest> CREATOR = new zzd();
  final int zzFG;
  final List<String> zzSS;

  CancelPendingActionsRequest(int paramInt, List<String> paramList)
  {
    this.zzFG = paramInt;
    this.zzSS = paramList;
  }

  public CancelPendingActionsRequest(List<String> paramList)
  {
    this(1, paramList);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }
}