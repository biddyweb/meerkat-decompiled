package com.google.android.gms.fitness.service;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.zzk;
import com.google.android.gms.fitness.data.zzk.zza;
import java.util.concurrent.TimeUnit;

public class FitnessSensorServiceRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<FitnessSensorServiceRequest> CREATOR = new zza();
  public static final int UNSPECIFIED = -1;
  private final int zzFG;
  private final DataSource zzYp;
  private final long zzabX;
  private final long zzabY;
  private final zzk zzabp;

  FitnessSensorServiceRequest(int paramInt, DataSource paramDataSource, IBinder paramIBinder, long paramLong1, long paramLong2)
  {
    this.zzFG = paramInt;
    this.zzYp = paramDataSource;
    this.zzabp = zzk.zza.zzav(paramIBinder);
    this.zzabX = paramLong1;
    this.zzabY = paramLong2;
  }

  private boolean zza(FitnessSensorServiceRequest paramFitnessSensorServiceRequest)
  {
    return (zzw.equal(this.zzYp, paramFitnessSensorServiceRequest.zzYp)) && (this.zzabX == paramFitnessSensorServiceRequest.zzabX) && (this.zzabY == paramFitnessSensorServiceRequest.zzabY);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof FitnessSensorServiceRequest)) && (zza((FitnessSensorServiceRequest)paramObject)));
  }

  public long getBatchInterval(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzabY, TimeUnit.MICROSECONDS);
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public SensorEventDispatcher getDispatcher()
  {
    return new zzb(this.zzabp);
  }

  public long getSamplingRate(TimeUnit paramTimeUnit)
  {
    if (this.zzabX == -1L)
      return -1L;
    return paramTimeUnit.convert(this.zzabX, TimeUnit.MICROSECONDS);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = Long.valueOf(this.zzabX);
    arrayOfObject[2] = Long.valueOf(this.zzabY);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzYp;
    return String.format("FitnessSensorServiceRequest{%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public long zzlI()
  {
    return this.zzabX;
  }

  IBinder zzmg()
  {
    return this.zzabp.asBinder();
  }

  public long zzmw()
  {
    return this.zzabY;
  }
}