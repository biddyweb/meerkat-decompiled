package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ValuesSetDetails
  implements SafeParcelable
{
  public static final Parcelable.Creator<ValuesSetDetails> CREATOR = new zzk();
  final int mIndex;
  final int zzFG;
  final int zzXf;
  final int zzXg;

  ValuesSetDetails(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.zzFG = paramInt1;
    this.mIndex = paramInt2;
    this.zzXf = paramInt3;
    this.zzXg = paramInt4;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }
}