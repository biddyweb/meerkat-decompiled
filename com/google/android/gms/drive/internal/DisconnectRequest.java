package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class DisconnectRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DisconnectRequest> CREATOR = new zzo();
  final int zzFG;

  public DisconnectRequest()
  {
    this(1);
  }

  DisconnectRequest(int paramInt)
  {
    this.zzFG = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzo.zza(this, paramParcel, paramInt);
  }
}