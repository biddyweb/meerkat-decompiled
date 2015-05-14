package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Bucket;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.internal.zzng;
import com.google.android.gms.internal.zzng.zza;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class DataReadRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataReadRequest> CREATOR = new zzg();
  public static final int NO_LIMIT;
  private final int zzFG;
  private final String zzFO;
  private final long zzON;
  private final List<DataType> zzYA;
  private final int zzYE;
  private final long zzYq;
  private final List<DataSource> zzaaO;
  private final List<DataType> zzaaT;
  private final List<DataSource> zzaaU;
  private final long zzaaV;
  private final DataSource zzaaW;
  private final int zzaaX;
  private final boolean zzaaY;
  private final boolean zzaaZ;
  private final zzng zzaba;

  DataReadRequest(int paramInt1, List<DataType> paramList1, List<DataSource> paramList2, long paramLong1, long paramLong2, List<DataType> paramList3, List<DataSource> paramList4, int paramInt2, long paramLong3, DataSource paramDataSource, int paramInt3, boolean paramBoolean1, boolean paramBoolean2, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt1;
    this.zzYA = Collections.unmodifiableList(paramList1);
    this.zzaaO = Collections.unmodifiableList(paramList2);
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzaaT = Collections.unmodifiableList(paramList3);
    this.zzaaU = Collections.unmodifiableList(paramList4);
    this.zzYE = paramInt2;
    this.zzaaV = paramLong3;
    this.zzaaW = paramDataSource;
    this.zzaaX = paramInt3;
    this.zzaaY = paramBoolean1;
    this.zzaaZ = paramBoolean2;
    if (paramIBinder == null);
    for (zzng localzzng = null; ; localzzng = zzng.zza.zzaD(paramIBinder))
    {
      this.zzaba = localzzng;
      this.zzFO = paramString;
      return;
    }
  }

  private DataReadRequest(Builder paramBuilder)
  {
    this(Builder.zza(paramBuilder), Builder.zzb(paramBuilder), Builder.zzc(paramBuilder), Builder.zzd(paramBuilder), Builder.zze(paramBuilder), Builder.zzf(paramBuilder), Builder.zzg(paramBuilder), Builder.zzh(paramBuilder), Builder.zzi(paramBuilder), Builder.zzj(paramBuilder), Builder.zzk(paramBuilder), Builder.zzl(paramBuilder), null, null);
  }

  public DataReadRequest(DataReadRequest paramDataReadRequest, zzng paramzzng, String paramString)
  {
    this(paramDataReadRequest.zzYA, paramDataReadRequest.zzaaO, paramDataReadRequest.zzON, paramDataReadRequest.zzYq, paramDataReadRequest.zzaaT, paramDataReadRequest.zzaaU, paramDataReadRequest.zzYE, paramDataReadRequest.zzaaV, paramDataReadRequest.zzaaW, paramDataReadRequest.zzaaX, paramDataReadRequest.zzaaY, paramDataReadRequest.zzaaZ, paramzzng, paramString);
  }

  public DataReadRequest(List<DataType> paramList1, List<DataSource> paramList2, long paramLong1, long paramLong2, List<DataType> paramList3, List<DataSource> paramList4, int paramInt1, long paramLong3, DataSource paramDataSource, int paramInt2, boolean paramBoolean1, boolean paramBoolean2, zzng paramzzng, String paramString)
  {
    this.zzFG = 3;
    this.zzYA = Collections.unmodifiableList(paramList1);
    this.zzaaO = Collections.unmodifiableList(paramList2);
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzaaT = Collections.unmodifiableList(paramList3);
    this.zzaaU = Collections.unmodifiableList(paramList4);
    this.zzYE = paramInt1;
    this.zzaaV = paramLong3;
    this.zzaaW = paramDataSource;
    this.zzaaX = paramInt2;
    this.zzaaY = paramBoolean1;
    this.zzaaZ = paramBoolean2;
    this.zzaba = paramzzng;
    this.zzFO = paramString;
  }

  private boolean zzb(DataReadRequest paramDataReadRequest)
  {
    return (this.zzYA.equals(paramDataReadRequest.zzYA)) && (this.zzaaO.equals(paramDataReadRequest.zzaaO)) && (this.zzON == paramDataReadRequest.zzON) && (this.zzYq == paramDataReadRequest.zzYq) && (this.zzYE == paramDataReadRequest.zzYE) && (this.zzaaU.equals(paramDataReadRequest.zzaaU)) && (this.zzaaT.equals(paramDataReadRequest.zzaaT)) && (zzw.equal(this.zzaaW, paramDataReadRequest.zzaaW)) && (this.zzaaV == paramDataReadRequest.zzaaV) && (this.zzaaZ == paramDataReadRequest.zzaaZ);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataReadRequest)) && (zzb((DataReadRequest)paramObject)));
  }

  public DataSource getActivityDataSource()
  {
    return this.zzaaW;
  }

  public List<DataSource> getAggregatedDataSources()
  {
    return this.zzaaU;
  }

  public List<DataType> getAggregatedDataTypes()
  {
    return this.zzaaT;
  }

  public long getBucketDuration(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzaaV, TimeUnit.MILLISECONDS);
  }

  public int getBucketType()
  {
    return this.zzYE;
  }

  public List<DataSource> getDataSources()
  {
    return this.zzaaO;
  }

  public List<DataType> getDataTypes()
  {
    return this.zzYA;
  }

  public long getEndTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYq, TimeUnit.MILLISECONDS);
  }

  public int getLimit()
  {
    return this.zzaaX;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public long getStartTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzON, TimeUnit.MILLISECONDS);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzYE);
    arrayOfObject[1] = Long.valueOf(this.zzON);
    arrayOfObject[2] = Long.valueOf(this.zzYq);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("DataReadRequest{");
    if (!this.zzYA.isEmpty())
    {
      Iterator localIterator4 = this.zzYA.iterator();
      while (localIterator4.hasNext())
        localStringBuilder.append(((DataType)localIterator4.next()).zzlB()).append(" ");
    }
    if (!this.zzaaO.isEmpty())
    {
      Iterator localIterator3 = this.zzaaO.iterator();
      while (localIterator3.hasNext())
        localStringBuilder.append(((DataSource)localIterator3.next()).toDebugString()).append(" ");
    }
    if (this.zzYE != 0)
    {
      localStringBuilder.append("bucket by ").append(Bucket.zzdg(this.zzYE));
      if (this.zzaaV > 0L)
        localStringBuilder.append(" >").append(this.zzaaV).append("ms");
      localStringBuilder.append(": ");
    }
    if (!this.zzaaT.isEmpty())
    {
      Iterator localIterator2 = this.zzaaT.iterator();
      while (localIterator2.hasNext())
        localStringBuilder.append(((DataType)localIterator2.next()).zzlB()).append(" ");
    }
    if (!this.zzaaU.isEmpty())
    {
      Iterator localIterator1 = this.zzaaU.iterator();
      while (localIterator1.hasNext())
        localStringBuilder.append(((DataSource)localIterator1.next()).toDebugString()).append(" ");
    }
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Long.valueOf(this.zzON);
    arrayOfObject[1] = Long.valueOf(this.zzON);
    arrayOfObject[2] = Long.valueOf(this.zzYq);
    arrayOfObject[3] = Long.valueOf(this.zzYq);
    localStringBuilder.append(String.format("(%tF %tT - %tF %tT)", arrayOfObject));
    if (this.zzaaW != null)
      localStringBuilder.append("activities: ").append(this.zzaaW.toDebugString());
    if (this.zzaaZ)
      localStringBuilder.append(" +server");
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaba == null)
      return null;
    return this.zzaba.asBinder();
  }

  public boolean zzlV()
  {
    return this.zzaaZ;
  }

  public boolean zzlW()
  {
    return this.zzaaY;
  }

  public long zzlX()
  {
    return this.zzaaV;
  }

  public long zzlp()
  {
    return this.zzON;
  }

  public long zzlq()
  {
    return this.zzYq;
  }

  public static class Builder
  {
    private long zzON;
    private List<DataType> zzYA = new ArrayList();
    private int zzYE = 0;
    private long zzYq;
    private List<DataSource> zzaaO = new ArrayList();
    private List<DataType> zzaaT = new ArrayList();
    private List<DataSource> zzaaU = new ArrayList();
    private long zzaaV = 0L;
    private DataSource zzaaW;
    private int zzaaX = 0;
    private boolean zzaaY = false;
    private boolean zzaaZ = false;

    public Builder aggregate(DataSource paramDataSource, DataType paramDataType)
    {
      zzx.zzb(paramDataSource, "Attempting to add a null data source");
      if (!this.zzaaO.contains(paramDataSource));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Cannot add the same data source for aggregated and detailed");
        DataType localDataType = paramDataSource.getDataType();
        zzx.zzb(DataType.AGGREGATE_INPUT_TYPES.contains(localDataType), "Unsupported input data type specified for aggregation: %s", new Object[] { localDataType });
        zzx.zzb(DataType.getAggregatesForInput(localDataType).contains(paramDataType), "Invalid output aggregate data type specified: %s -> %s", new Object[] { localDataType, paramDataType });
        if (!this.zzaaU.contains(paramDataSource))
          this.zzaaU.add(paramDataSource);
        return this;
      }
    }

    public Builder aggregate(DataType paramDataType1, DataType paramDataType2)
    {
      zzx.zzb(paramDataType1, "Attempting to use a null data type");
      if (!this.zzYA.contains(paramDataType1));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Cannot add the same data type as aggregated and detailed");
        zzx.zzb(DataType.AGGREGATE_INPUT_TYPES.contains(paramDataType1), "Unsupported input data type specified for aggregation: %s", new Object[] { paramDataType1 });
        zzx.zzb(DataType.getAggregatesForInput(paramDataType1).contains(paramDataType2), "Invalid output aggregate data type specified: %s -> %s", new Object[] { paramDataType1, paramDataType2 });
        if (!this.zzaaT.contains(paramDataType1))
          this.zzaaT.add(paramDataType1);
        return this;
      }
    }

    public Builder bucketByActivitySegment(int paramInt, TimeUnit paramTimeUnit)
    {
      boolean bool1;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label86;
      }
      label86: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        this.zzYE = 4;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
      }
    }

    public Builder bucketByActivitySegment(int paramInt, TimeUnit paramTimeUnit, DataSource paramDataSource)
    {
      boolean bool1;
      boolean bool2;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label131;
        bool2 = true;
        label43: Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        if (paramDataSource == null)
          break label137;
      }
      label131: label137: for (boolean bool3 = true; ; bool3 = false)
      {
        zzx.zzb(bool3, "Invalid activity data source specified");
        zzx.zzb(paramDataSource.getDataType().equals(DataType.TYPE_ACTIVITY_SEGMENT), "Invalid activity data source specified: %s", new Object[] { paramDataSource });
        this.zzaaW = paramDataSource;
        this.zzYE = 4;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
        bool2 = false;
        break label43;
      }
    }

    public Builder bucketByActivityType(int paramInt, TimeUnit paramTimeUnit)
    {
      boolean bool1;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label86;
      }
      label86: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        this.zzYE = 3;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
      }
    }

    public Builder bucketByActivityType(int paramInt, TimeUnit paramTimeUnit, DataSource paramDataSource)
    {
      boolean bool1;
      boolean bool2;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label131;
        bool2 = true;
        label43: Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        if (paramDataSource == null)
          break label137;
      }
      label131: label137: for (boolean bool3 = true; ; bool3 = false)
      {
        zzx.zzb(bool3, "Invalid activity data source specified");
        zzx.zzb(paramDataSource.getDataType().equals(DataType.TYPE_ACTIVITY_SEGMENT), "Invalid activity data source specified: %s", new Object[] { paramDataSource });
        this.zzaaW = paramDataSource;
        this.zzYE = 3;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
        bool2 = false;
        break label43;
      }
    }

    public Builder bucketBySession(int paramInt, TimeUnit paramTimeUnit)
    {
      boolean bool1;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label86;
      }
      label86: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        this.zzYE = 2;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
      }
    }

    public Builder bucketByTime(int paramInt, TimeUnit paramTimeUnit)
    {
      boolean bool1;
      if (this.zzYE == 0)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(this.zzYE);
        zzx.zzb(bool1, "Bucketing strategy already set to %s", arrayOfObject1);
        if (paramInt <= 0)
          break label86;
      }
      label86: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool2, "Must specify a valid minimum duration for an activity segment: %d", arrayOfObject2);
        this.zzYE = 1;
        this.zzaaV = paramTimeUnit.toMillis(paramInt);
        return this;
        bool1 = false;
        break;
      }
    }

    public DataReadRequest build()
    {
      boolean bool1 = true;
      boolean bool2;
      boolean bool3;
      label69: boolean bool4;
      label118: boolean bool5;
      if ((!this.zzaaO.isEmpty()) || (!this.zzYA.isEmpty()) || (!this.zzaaU.isEmpty()) || (!this.zzaaT.isEmpty()))
      {
        bool2 = bool1;
        zzx.zza(bool2, "Must add at least one data source (aggregated or detailed)");
        if (this.zzON <= 0L)
          break label216;
        bool3 = bool1;
        Object[] arrayOfObject1 = new Object[bool1];
        arrayOfObject1[0] = Long.valueOf(this.zzON);
        zzx.zza(bool3, "Invalid start time: %s", arrayOfObject1);
        if ((this.zzYq <= 0L) || (this.zzYq <= this.zzON))
          break label221;
        bool4 = bool1;
        Object[] arrayOfObject2 = new Object[bool1];
        arrayOfObject2[0] = Long.valueOf(this.zzYq);
        zzx.zza(bool4, "Invalid end time: %s", arrayOfObject2);
        if ((!this.zzaaU.isEmpty()) || (!this.zzaaT.isEmpty()))
          break label227;
        bool5 = bool1;
        label171: if (((!bool5) || (this.zzYE != 0)) && ((bool5) || (this.zzYE == 0)))
          break label233;
      }
      while (true)
      {
        zzx.zza(bool1, "Must specify a valid bucketing strategy while requesting aggregation");
        return new DataReadRequest(this, null);
        bool2 = false;
        break;
        label216: bool3 = false;
        break label69;
        label221: bool4 = false;
        break label118;
        label227: bool5 = false;
        break label171;
        label233: bool1 = false;
      }
    }

    public Builder enableServerQueries()
    {
      this.zzaaZ = true;
      return this;
    }

    public Builder read(DataSource paramDataSource)
    {
      zzx.zzb(paramDataSource, "Attempting to add a null data source");
      if (!this.zzaaU.contains(paramDataSource));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Cannot add the same data source as aggregated and detailed");
        if (!this.zzaaO.contains(paramDataSource))
          this.zzaaO.add(paramDataSource);
        return this;
      }
    }

    public Builder read(DataType paramDataType)
    {
      zzx.zzb(paramDataType, "Attempting to use a null data type");
      if (!this.zzaaT.contains(paramDataType));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Cannot add the same data type as aggregated and detailed");
        if (!this.zzYA.contains(paramDataType))
          this.zzYA.add(paramDataType);
        return this;
      }
    }

    public Builder setLimit(int paramInt)
    {
      if (paramInt > 0);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(paramInt);
        zzx.zzb(bool, "Invalid limit %d is specified", arrayOfObject);
        this.zzaaX = paramInt;
        return this;
      }
    }

    public Builder setTimeRange(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      this.zzON = paramTimeUnit.toMillis(paramLong1);
      this.zzYq = paramTimeUnit.toMillis(paramLong2);
      return this;
    }
  }
}