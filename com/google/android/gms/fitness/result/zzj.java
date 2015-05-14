package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzj
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<zzj> CREATOR = new zzk();
  private final int zzFG;
  private final DataHolder zzMd;

  zzj(int paramInt, DataHolder paramDataHolder)
  {
    this.zzFG = paramInt;
    this.zzMd = paramDataHolder;
  }

  public int describeContents()
  {
    return 0;
  }

  public Status getStatus()
  {
    return new Status(this.zzMd.getStatusCode());
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }

  DataHolder zzms()
  {
    return this.zzMd;
  }
}