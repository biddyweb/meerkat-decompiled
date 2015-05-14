package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class zzf
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<zzf> CREATOR = new zzg();
  private final int zzFG;
  private final Status zzHb;
  private final List<zzc> zzabS;

  zzf(int paramInt, Status paramStatus, List<zzc> paramList)
  {
    this.zzFG = paramInt;
    this.zzHb = paramStatus;
    this.zzabS = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }

  List<zzc> zzmr()
  {
    return this.zzabS;
  }
}