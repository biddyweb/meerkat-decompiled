package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ValuesRemovedDetails
  implements SafeParcelable
{
  public static final Parcelable.Creator<ValuesRemovedDetails> CREATOR = new zzj();
  final int mIndex;
  final int zzFG;
  final String zzXF;
  final int zzXG;
  final int zzXf;
  final int zzXg;

  ValuesRemovedDetails(int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString, int paramInt5)
  {
    this.zzFG = paramInt1;
    this.mIndex = paramInt2;
    this.zzXf = paramInt3;
    this.zzXg = paramInt4;
    this.zzXF = paramString;
    this.zzXG = paramInt5;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }
}