package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class FieldChangedDetails
  implements SafeParcelable
{
  public static final Parcelable.Creator<FieldChangedDetails> CREATOR = new zza();
  final int zzFG;
  final int zzXe;

  FieldChangedDetails(int paramInt1, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzXe = paramInt2;
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