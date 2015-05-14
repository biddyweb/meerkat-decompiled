package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.zzk;
import com.google.android.gms.fitness.data.zzk.zza;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;
import com.google.android.gms.location.LocationRequest;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class zzac
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzac> CREATOR = new zzad();
  private final PendingIntent mPendingIntent;
  private final int zzFG;
  private final String zzFO;
  private final DataType zzYo;
  private final DataSource zzYp;
  private final long zzZQ;
  private final int zzZR;
  private final zznv zzaaN;
  private zzk zzabp;
  int zzabq;
  int zzabr;
  private final long zzabs;
  private final long zzabt;
  private final List<LocationRequest> zzabu;
  private final long zzabv;
  private final List<Object> zzabw;

  zzac(int paramInt1, DataSource paramDataSource, DataType paramDataType, IBinder paramIBinder1, int paramInt2, int paramInt3, long paramLong1, long paramLong2, PendingIntent paramPendingIntent, long paramLong3, int paramInt4, List<LocationRequest> paramList, long paramLong4, IBinder paramIBinder2, String paramString)
  {
    this.zzFG = paramInt1;
    this.zzYp = paramDataSource;
    this.zzYo = paramDataType;
    zzk localzzk;
    if (paramIBinder1 == null)
    {
      localzzk = null;
      this.zzabp = localzzk;
      if (paramLong1 == 0L)
        paramLong1 = paramInt2;
      this.zzZQ = paramLong1;
      this.zzabt = paramLong3;
      if (paramLong2 == 0L)
        paramLong2 = paramInt3;
      this.zzabs = paramLong2;
      this.zzabu = paramList;
      this.mPendingIntent = paramPendingIntent;
      this.zzZR = paramInt4;
      this.zzabw = Collections.emptyList();
      this.zzabv = paramLong4;
      if (paramIBinder2 != null)
        break label137;
    }
    label137: for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder2))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
      localzzk = zzk.zza.zzav(paramIBinder1);
      break;
    }
  }

  public zzac(DataSource paramDataSource, DataType paramDataType, zzk paramzzk, PendingIntent paramPendingIntent, long paramLong1, long paramLong2, long paramLong3, int paramInt, List<LocationRequest> paramList, List<Object> paramList1, long paramLong4, zznv paramzznv, String paramString)
  {
    this.zzFG = 5;
    this.zzYp = paramDataSource;
    this.zzYo = paramDataType;
    this.zzabp = paramzzk;
    this.mPendingIntent = paramPendingIntent;
    this.zzZQ = paramLong1;
    this.zzabt = paramLong2;
    this.zzabs = paramLong3;
    this.zzZR = paramInt;
    this.zzabu = paramList;
    this.zzabw = paramList1;
    this.zzabv = paramLong4;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  public zzac(SensorRequest paramSensorRequest, zzk paramzzk, PendingIntent paramPendingIntent, zznv paramzznv, String paramString)
  {
    this(paramSensorRequest.getDataSource(), paramSensorRequest.getDataType(), paramzzk, paramPendingIntent, paramSensorRequest.getSamplingRate(TimeUnit.MICROSECONDS), paramSensorRequest.getFastestRate(TimeUnit.MICROSECONDS), paramSensorRequest.getMaxDeliveryLatency(TimeUnit.MICROSECONDS), paramSensorRequest.getAccuracyMode(), null, Collections.emptyList(), paramSensorRequest.zzmh(), paramzznv, paramString);
  }

  private boolean zzb(zzac paramzzac)
  {
    return (zzw.equal(this.zzYp, paramzzac.zzYp)) && (zzw.equal(this.zzYo, paramzzac.zzYo)) && (this.zzZQ == paramzzac.zzZQ) && (this.zzabt == paramzzac.zzabt) && (this.zzabs == paramzzac.zzabs) && (this.zzZR == paramzzac.zzZR) && (zzw.equal(this.zzabu, paramzzac.zzabu));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof zzac)) && (zzb((zzac)paramObject)));
  }

  public int getAccuracyMode()
  {
    return this.zzZR;
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public DataType getDataType()
  {
    return this.zzYo;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = this.zzYo;
    arrayOfObject[2] = this.zzabp;
    arrayOfObject[3] = Long.valueOf(this.zzZQ);
    arrayOfObject[4] = Long.valueOf(this.zzabt);
    arrayOfObject[5] = Long.valueOf(this.zzabs);
    arrayOfObject[6] = Integer.valueOf(this.zzZR);
    arrayOfObject[7] = this.zzabu;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzYo;
    arrayOfObject[1] = this.zzYp;
    arrayOfObject[2] = Long.valueOf(this.zzZQ);
    arrayOfObject[3] = Long.valueOf(this.zzabt);
    arrayOfObject[4] = Long.valueOf(this.zzabs);
    return String.format("SensorRegistrationRequest{type %s source %s interval %s fastest %s latency %s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzad.zza(this, paramParcel, paramInt);
  }

  public long zzlI()
  {
    return this.zzZQ;
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public PendingIntent zzmb()
  {
    return this.mPendingIntent;
  }

  public long zzmc()
  {
    return this.zzabt;
  }

  public long zzmd()
  {
    return this.zzabs;
  }

  public List<LocationRequest> zzme()
  {
    return this.zzabu;
  }

  public long zzmf()
  {
    return this.zzabv;
  }

  IBinder zzmg()
  {
    if (this.zzabp == null)
      return null;
    return this.zzabp.asBinder();
  }
}