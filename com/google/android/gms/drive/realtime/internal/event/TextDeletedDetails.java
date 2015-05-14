package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class TextDeletedDetails
  implements SafeParcelable
{
  public static final Parcelable.Creator<TextDeletedDetails> CREATOR = new zzf();
  final int mIndex;
  final int zzFG;
  final int zzXC;

  TextDeletedDetails(int paramInt1, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.mIndex = paramInt2;
    this.zzXC = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }
}