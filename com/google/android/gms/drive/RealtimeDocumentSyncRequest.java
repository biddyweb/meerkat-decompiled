package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

public class RealtimeDocumentSyncRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<RealtimeDocumentSyncRequest> CREATOR = new zzh();
  final int zzFG;
  final List<String> zzSB;
  final List<String> zzSC;

  RealtimeDocumentSyncRequest(int paramInt, List<String> paramList1, List<String> paramList2)
  {
    this.zzFG = paramInt;
    this.zzSB = ((List)zzx.zzl(paramList1));
    this.zzSC = ((List)zzx.zzl(paramList2));
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }
}