package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnLoadRealtimeResponse
  implements SafeParcelable
{
  public static final Parcelable.Creator<OnLoadRealtimeResponse> CREATOR = new zzaz();
  final int zzFG;
  final boolean zzmE;

  OnLoadRealtimeResponse(int paramInt, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzmE = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaz.zza(this, paramParcel, paramInt);
  }
}