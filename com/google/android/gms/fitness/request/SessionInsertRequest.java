package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataPoint;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.internal.zzmo;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class SessionInsertRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<SessionInsertRequest> CREATOR = new zzag();
  private final int zzFG;
  private final String zzFO;
  private final List<DataSet> zzYD;
  private final Session zzYs;
  private final zznv zzaaN;
  private final List<DataPoint> zzabA;

  SessionInsertRequest(int paramInt, Session paramSession, List<DataSet> paramList, List<DataPoint> paramList1, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzYs = paramSession;
    this.zzYD = Collections.unmodifiableList(paramList);
    this.zzabA = Collections.unmodifiableList(paramList1);
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public SessionInsertRequest(Session paramSession, List<DataSet> paramList, List<DataPoint> paramList1, zznv paramzznv, String paramString)
  {
    this.zzFG = 2;
    this.zzYs = paramSession;
    this.zzYD = Collections.unmodifiableList(paramList);
    this.zzabA = Collections.unmodifiableList(paramList1);
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  private SessionInsertRequest(Builder paramBuilder)
  {
    this(Builder.zza(paramBuilder), Builder.zzb(paramBuilder), Builder.zzc(paramBuilder), null, null);
  }

  public SessionInsertRequest(SessionInsertRequest paramSessionInsertRequest, zznv paramzznv, String paramString)
  {
    this(paramSessionInsertRequest.zzYs, paramSessionInsertRequest.zzYD, paramSessionInsertRequest.zzabA, paramzznv, paramString);
  }

  private boolean zzb(SessionInsertRequest paramSessionInsertRequest)
  {
    return (zzw.equal(this.zzYs, paramSessionInsertRequest.zzYs)) && (zzw.equal(this.zzYD, paramSessionInsertRequest.zzYD)) && (zzw.equal(this.zzabA, paramSessionInsertRequest.zzabA));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof SessionInsertRequest)) && (zzb((SessionInsertRequest)paramObject)));
  }

  public List<DataPoint> getAggregateDataPoints()
  {
    return this.zzabA;
  }

  public List<DataSet> getDataSets()
  {
    return this.zzYD;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public Session getSession()
  {
    return this.zzYs;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzYs;
    arrayOfObject[1] = this.zzYD;
    arrayOfObject[2] = this.zzabA;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("session", this.zzYs).zza("dataSets", this.zzYD).zza("aggregateDataPoints", this.zzabA).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzag.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public static class Builder
  {
    private List<DataSet> zzYD = new ArrayList();
    private Session zzYs;
    private List<DataPoint> zzabA = new ArrayList();
    private List<DataSource> zzabB = new ArrayList();

    private void zzd(DataPoint paramDataPoint)
    {
      zzf(paramDataPoint);
      zze(paramDataPoint);
    }

    private void zze(DataPoint paramDataPoint)
    {
      long l1 = this.zzYs.getStartTime(TimeUnit.NANOSECONDS);
      long l2 = this.zzYs.getEndTime(TimeUnit.NANOSECONDS);
      long l3 = paramDataPoint.getStartTime(TimeUnit.NANOSECONDS);
      long l4 = paramDataPoint.getEndTime(TimeUnit.NANOSECONDS);
      TimeUnit localTimeUnit;
      if ((l3 != 0L) && (l4 != 0L))
      {
        localTimeUnit = TimeUnit.MILLISECONDS;
        if (l4 > l2)
          l4 = zzmo.zza(l4, TimeUnit.NANOSECONDS, localTimeUnit);
        if ((l3 < l1) || (l4 > l2))
          break label209;
      }
      label209: for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject1 = new Object[3];
        arrayOfObject1[0] = paramDataPoint;
        arrayOfObject1[1] = Long.valueOf(l1);
        arrayOfObject1[2] = Long.valueOf(l2);
        zzx.zza(bool, "Data point %s has start and end times outside session interval [%d, %d]", arrayOfObject1);
        if (l4 != paramDataPoint.getEndTime(TimeUnit.NANOSECONDS))
        {
          Object[] arrayOfObject2 = new Object[3];
          arrayOfObject2[0] = Long.valueOf(paramDataPoint.getEndTime(TimeUnit.NANOSECONDS));
          arrayOfObject2[1] = Long.valueOf(l4);
          arrayOfObject2[2] = localTimeUnit;
          Log.w("Fitness", String.format("Data point end time [%d] is truncated to [%d] to match the precision [%s] of the session start and end time", arrayOfObject2));
          paramDataPoint.setTimeInterval(l3, l4, TimeUnit.NANOSECONDS);
        }
        return;
      }
    }

    private void zzf(DataPoint paramDataPoint)
    {
      long l1 = this.zzYs.getStartTime(TimeUnit.NANOSECONDS);
      long l2 = this.zzYs.getEndTime(TimeUnit.NANOSECONDS);
      long l3 = paramDataPoint.getTimestamp(TimeUnit.NANOSECONDS);
      TimeUnit localTimeUnit;
      if (l3 != 0L)
      {
        localTimeUnit = TimeUnit.MILLISECONDS;
        if ((l3 < l1) || (l3 > l2))
          l3 = zzmo.zza(l3, TimeUnit.NANOSECONDS, localTimeUnit);
        if ((l3 < l1) || (l3 > l2))
          break label198;
      }
      label198: for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject1 = new Object[3];
        arrayOfObject1[0] = paramDataPoint;
        arrayOfObject1[1] = Long.valueOf(l1);
        arrayOfObject1[2] = Long.valueOf(l2);
        zzx.zza(bool, "Data point %s has time stamp outside session interval [%d, %d]", arrayOfObject1);
        if (paramDataPoint.getTimestamp(TimeUnit.NANOSECONDS) != l3)
        {
          Object[] arrayOfObject2 = new Object[3];
          arrayOfObject2[0] = Long.valueOf(paramDataPoint.getTimestamp(TimeUnit.NANOSECONDS));
          arrayOfObject2[1] = Long.valueOf(l3);
          arrayOfObject2[2] = localTimeUnit;
          Log.w("Fitness", String.format("Data point timestamp [%d] is truncated to [%d] to match the precision [%s] of the session start and end time", arrayOfObject2));
          paramDataPoint.setTimestamp(l3, TimeUnit.NANOSECONDS);
        }
        return;
      }
    }

    private void zzmi()
    {
      Iterator localIterator1 = this.zzYD.iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator3 = ((DataSet)localIterator1.next()).getDataPoints().iterator();
        while (localIterator3.hasNext())
          zzd((DataPoint)localIterator3.next());
      }
      Iterator localIterator2 = this.zzabA.iterator();
      while (localIterator2.hasNext())
        zzd((DataPoint)localIterator2.next());
    }

    public Builder addAggregateDataPoint(DataPoint paramDataPoint)
    {
      boolean bool1;
      boolean bool2;
      label45: DataSource localDataSource;
      if (paramDataPoint != null)
      {
        bool1 = true;
        zzx.zzb(bool1, "Must specify a valid aggregate data point.");
        long l1 = paramDataPoint.getStartTime(TimeUnit.NANOSECONDS);
        long l2 = paramDataPoint.getEndTime(TimeUnit.NANOSECONDS);
        if ((l1 <= 0L) || (l2 <= l1))
          break label129;
        bool2 = true;
        zzx.zzb(bool2, "Aggregate data point should have valid start and end times: %s", new Object[] { paramDataPoint });
        localDataSource = paramDataPoint.getDataSource();
        if (this.zzabB.contains(localDataSource))
          break label135;
      }
      label129: label135: for (boolean bool3 = true; ; bool3 = false)
      {
        zzx.zza(bool3, "Data set/Aggregate data point for this data source %s is already added.", new Object[] { localDataSource });
        this.zzabB.add(localDataSource);
        this.zzabA.add(paramDataPoint);
        return this;
        bool1 = false;
        break;
        bool2 = false;
        break label45;
      }
    }

    public Builder addDataSet(DataSet paramDataSet)
    {
      boolean bool1 = true;
      boolean bool2;
      DataSource localDataSource;
      boolean bool3;
      if (paramDataSet != null)
      {
        bool2 = bool1;
        zzx.zzb(bool2, "Must specify a valid data set.");
        localDataSource = paramDataSet.getDataSource();
        if (this.zzabB.contains(localDataSource))
          break label106;
        bool3 = bool1;
        label37: Object[] arrayOfObject = new Object[bool1];
        arrayOfObject[0] = localDataSource;
        zzx.zza(bool3, "Data set for this data source %s is already added.", arrayOfObject);
        if (paramDataSet.getDataPoints().isEmpty())
          break label112;
      }
      while (true)
      {
        zzx.zzb(bool1, "No data points specified in the input data set.");
        this.zzabB.add(localDataSource);
        this.zzYD.add(paramDataSet);
        return this;
        bool2 = false;
        break;
        label106: bool3 = false;
        break label37;
        label112: bool1 = false;
      }
    }

    public SessionInsertRequest build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (this.zzYs != null)
      {
        bool2 = bool1;
        zzx.zza(bool2, "Must specify a valid session.");
        if (this.zzYs.getEndTime(TimeUnit.MILLISECONDS) == 0L)
          break label57;
      }
      while (true)
      {
        zzx.zza(bool1, "Must specify a valid end time, cannot insert a continuing session.");
        zzmi();
        return new SessionInsertRequest(this, null);
        bool2 = false;
        break;
        label57: bool1 = false;
      }
    }

    public Builder setSession(Session paramSession)
    {
      this.zzYs = paramSession;
      return this;
    }
  }
}