package com.google.android.gms.fitness.request;

import android.os.SystemClock;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.location.LocationRequest;
import java.util.concurrent.TimeUnit;

public class SensorRequest
{
  public static final int ACCURACY_MODE_DEFAULT = 2;
  public static final int ACCURACY_MODE_HIGH = 3;
  public static final int ACCURACY_MODE_LOW = 1;
  private final DataType zzYo;
  private final DataSource zzYp;
  private final long zzZQ;
  private final int zzZR;
  private final long zzabs;
  private final long zzabt;
  private final LocationRequest zzabx;
  private final long zzaby;

  private SensorRequest(DataSource paramDataSource, LocationRequest paramLocationRequest)
  {
    this.zzabx = paramLocationRequest;
    this.zzZQ = TimeUnit.MILLISECONDS.toMicros(paramLocationRequest.getInterval());
    this.zzabt = TimeUnit.MILLISECONDS.toMicros(paramLocationRequest.getFastestInterval());
    this.zzabs = this.zzZQ;
    this.zzYo = paramDataSource.getDataType();
    this.zzZR = zza(paramLocationRequest);
    this.zzYp = paramDataSource;
    long l = paramLocationRequest.getExpirationTime();
    if (l == 9223372036854775807L)
    {
      this.zzaby = 9223372036854775807L;
      return;
    }
    this.zzaby = TimeUnit.MILLISECONDS.toMicros(l - SystemClock.elapsedRealtime());
  }

  private SensorRequest(Builder paramBuilder)
  {
    this.zzYp = Builder.zza(paramBuilder);
    this.zzYo = Builder.zzb(paramBuilder);
    this.zzZQ = Builder.zzc(paramBuilder);
    this.zzabt = Builder.zzd(paramBuilder);
    this.zzabs = Builder.zze(paramBuilder);
    this.zzZR = Builder.zzf(paramBuilder);
    this.zzabx = null;
    this.zzaby = Builder.zzg(paramBuilder);
  }

  public static SensorRequest fromLocationRequest(DataSource paramDataSource, LocationRequest paramLocationRequest)
  {
    return new SensorRequest(paramDataSource, paramLocationRequest);
  }

  private static int zza(LocationRequest paramLocationRequest)
  {
    switch (paramLocationRequest.getPriority())
    {
    default:
      return 2;
    case 100:
      return 3;
    case 104:
    }
    return 1;
  }

  private boolean zza(SensorRequest paramSensorRequest)
  {
    return (zzw.equal(this.zzYp, paramSensorRequest.zzYp)) && (zzw.equal(this.zzYo, paramSensorRequest.zzYo)) && (this.zzZQ == paramSensorRequest.zzZQ) && (this.zzabt == paramSensorRequest.zzabt) && (this.zzabs == paramSensorRequest.zzabs) && (this.zzZR == paramSensorRequest.zzZR) && (zzw.equal(this.zzabx, paramSensorRequest.zzabx)) && (this.zzaby == paramSensorRequest.zzaby);
  }

  public static int zzdP(int paramInt)
  {
    switch (paramInt)
    {
    case 2:
    default:
      paramInt = 2;
    case 1:
    case 3:
    }
    return paramInt;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof SensorRequest)) && (zza((SensorRequest)paramObject)));
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

  public long getFastestRate(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzabt, TimeUnit.MICROSECONDS);
  }

  public long getMaxDeliveryLatency(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzabs, TimeUnit.MICROSECONDS);
  }

  public long getSamplingRate(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzZQ, TimeUnit.MICROSECONDS);
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = this.zzYo;
    arrayOfObject[2] = Long.valueOf(this.zzZQ);
    arrayOfObject[3] = Long.valueOf(this.zzabt);
    arrayOfObject[4] = Long.valueOf(this.zzabs);
    arrayOfObject[5] = Integer.valueOf(this.zzZR);
    arrayOfObject[6] = this.zzabx;
    arrayOfObject[7] = Long.valueOf(this.zzaby);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("dataSource", this.zzYp).zza("dataType", this.zzYo).zza("samplingRateMicros", Long.valueOf(this.zzZQ)).zza("deliveryLatencyMicros", Long.valueOf(this.zzabs)).zza("timeOutMicros", Long.valueOf(this.zzaby)).toString();
  }

  public long zzmh()
  {
    return this.zzaby;
  }

  public static class Builder
  {
    private DataType zzYo;
    private DataSource zzYp;
    private long zzZQ = -1L;
    private int zzZR = 2;
    private long zzabs = 0L;
    private long zzabt = 0L;
    private long zzaby = 9223372036854775807L;
    private boolean zzabz = false;

    public SensorRequest build()
    {
      if ((this.zzYp != null) || (this.zzYo != null));
      for (boolean bool1 = true; ; bool1 = false)
      {
        zzx.zza(bool1, "Must call setDataSource() or setDataType()");
        boolean bool2;
        if ((this.zzYo != null) && (this.zzYp != null))
        {
          boolean bool3 = this.zzYo.equals(this.zzYp.getDataType());
          bool2 = false;
          if (!bool3);
        }
        else
        {
          bool2 = true;
        }
        zzx.zza(bool2, "Specified data type is incompatible with specified data source");
        return new SensorRequest(this, null);
      }
    }

    public Builder setAccuracyMode(int paramInt)
    {
      this.zzZR = SensorRequest.zzdP(paramInt);
      return this;
    }

    public Builder setDataSource(DataSource paramDataSource)
    {
      this.zzYp = paramDataSource;
      return this;
    }

    public Builder setDataType(DataType paramDataType)
    {
      this.zzYo = paramDataType;
      return this;
    }

    public Builder setFastestRate(int paramInt, TimeUnit paramTimeUnit)
    {
      if (paramInt >= 0);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Cannot use a negative interval");
        this.zzabz = true;
        this.zzabt = paramTimeUnit.toMicros(paramInt);
        return this;
      }
    }

    public Builder setMaxDeliveryLatency(int paramInt, TimeUnit paramTimeUnit)
    {
      if (paramInt >= 0);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Cannot use a negative delivery interval");
        this.zzabs = paramTimeUnit.toMicros(paramInt);
        return this;
      }
    }

    public Builder setSamplingRate(long paramLong, TimeUnit paramTimeUnit)
    {
      if (paramLong >= 0L);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Cannot use a negative sampling interval");
        this.zzZQ = paramTimeUnit.toMicros(paramLong);
        if (!this.zzabz)
          this.zzabt = (this.zzZQ / 2L);
        return this;
      }
    }

    public Builder setTimeout(long paramLong, TimeUnit paramTimeUnit)
    {
      boolean bool1 = true;
      boolean bool2;
      if (paramLong > 0L)
      {
        bool2 = bool1;
        Object[] arrayOfObject = new Object[bool1];
        arrayOfObject[0] = Long.valueOf(paramLong);
        zzx.zzb(bool2, "Invalid time out value specified: %d", arrayOfObject);
        if (paramTimeUnit == null)
          break label65;
      }
      while (true)
      {
        zzx.zzb(bool1, "Invalid time unit specified");
        this.zzaby = paramTimeUnit.toMicros(paramLong);
        return this;
        bool2 = false;
        break;
        label65: bool1 = false;
      }
    }
  }
}