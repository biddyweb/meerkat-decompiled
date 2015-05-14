package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class BeginCompoundOperationRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<BeginCompoundOperationRequest> CREATOR = new zza();
  final String mName;
  final int zzFG;
  final boolean zzWV;
  final boolean zzWW;

  BeginCompoundOperationRequest(int paramInt, boolean paramBoolean1, String paramString, boolean paramBoolean2)
  {
    this.zzFG = paramInt;
    this.zzWV = paramBoolean1;
    this.mName = paramString;
    this.zzWW = paramBoolean2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}