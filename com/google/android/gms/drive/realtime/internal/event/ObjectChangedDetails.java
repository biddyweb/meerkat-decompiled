package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ObjectChangedDetails
  implements SafeParcelable
{
  public static final Parcelable.Creator<ObjectChangedDetails> CREATOR = new zzb();
  final int zzFG;
  final int zzXf;
  final int zzXg;

  ObjectChangedDetails(int paramInt1, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzXf = paramInt2;
    this.zzXg = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}