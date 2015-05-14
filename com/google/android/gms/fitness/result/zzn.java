package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class zzn
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<zzn> CREATOR = new zzo();
  private final int zzFG;
  private final Status zzHb;
  private final long zzLk;

  zzn(int paramInt, Status paramStatus, long paramLong)
  {
    this.zzFG = paramInt;
    this.zzHb = paramStatus;
    this.zzLk = paramLong;
  }

  private boolean zzb(zzn paramzzn)
  {
    return (this.zzHb.equals(paramzzn.zzHb)) && (zzw.equal(Long.valueOf(this.zzLk), Long.valueOf(paramzzn.zzLk)));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof zzn)) && (zzb((zzn)paramObject)));
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzHb;
    arrayOfObject[1] = Long.valueOf(this.zzLk);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("timestamp", Long.valueOf(this.zzLk)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzo.zza(this, paramParcel, paramInt);
  }

  public long zzmu()
  {
    return this.zzLk;
  }
}