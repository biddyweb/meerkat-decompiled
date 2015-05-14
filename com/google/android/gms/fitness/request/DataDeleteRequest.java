package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class DataDeleteRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataDeleteRequest> CREATOR = new zzd();
  private final int zzFG;
  private final String zzFO;
  private final long zzON;
  private final List<DataType> zzYA;
  private final long zzYq;
  private final zznv zzaaN;
  private final List<DataSource> zzaaO;
  private final List<Session> zzaaP;
  private final boolean zzaaQ;
  private final boolean zzaaR;

  DataDeleteRequest(int paramInt, long paramLong1, long paramLong2, List<DataSource> paramList, List<DataType> paramList1, List<Session> paramList2, boolean paramBoolean1, boolean paramBoolean2, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzaaO = Collections.unmodifiableList(paramList);
    this.zzYA = Collections.unmodifiableList(paramList1);
    this.zzaaP = paramList2;
    this.zzaaQ = paramBoolean1;
    this.zzaaR = paramBoolean2;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public DataDeleteRequest(long paramLong1, long paramLong2, List<DataSource> paramList, List<DataType> paramList1, List<Session> paramList2, boolean paramBoolean1, boolean paramBoolean2, zznv paramzznv, String paramString)
  {
    this.zzFG = 2;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzaaO = Collections.unmodifiableList(paramList);
    this.zzYA = Collections.unmodifiableList(paramList1);
    this.zzaaP = paramList2;
    this.zzaaQ = paramBoolean1;
    this.zzaaR = paramBoolean2;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  private DataDeleteRequest(Builder paramBuilder)
  {
    this(Builder.zza(paramBuilder), Builder.zzb(paramBuilder), Builder.zzc(paramBuilder), Builder.zzd(paramBuilder), Builder.zze(paramBuilder), Builder.zzf(paramBuilder), Builder.zzg(paramBuilder), null, null);
  }

  public DataDeleteRequest(DataDeleteRequest paramDataDeleteRequest, zznv paramzznv, String paramString)
  {
    this(paramDataDeleteRequest.zzON, paramDataDeleteRequest.zzYq, paramDataDeleteRequest.zzaaO, paramDataDeleteRequest.zzYA, paramDataDeleteRequest.zzaaP, paramDataDeleteRequest.zzaaQ, paramDataDeleteRequest.zzaaR, paramzznv, paramString);
  }

  private boolean zzb(DataDeleteRequest paramDataDeleteRequest)
  {
    return (this.zzON == paramDataDeleteRequest.zzON) && (this.zzYq == paramDataDeleteRequest.zzYq) && (zzw.equal(this.zzaaO, paramDataDeleteRequest.zzaaO)) && (zzw.equal(this.zzYA, paramDataDeleteRequest.zzYA)) && (zzw.equal(this.zzaaP, paramDataDeleteRequest.zzaaP)) && (this.zzaaQ == paramDataDeleteRequest.zzaaQ) && (this.zzaaR == paramDataDeleteRequest.zzaaR);
  }

  public boolean deleteAllData()
  {
    return this.zzaaQ;
  }

  public boolean deleteAllSessions()
  {
    return this.zzaaR;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof DataDeleteRequest)) && (zzb((DataDeleteRequest)paramObject)));
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

  public String getPackageName()
  {
    return this.zzFO;
  }

  public List<Session> getSessions()
  {
    return this.zzaaP;
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
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Long.valueOf(this.zzON);
    arrayOfObject[1] = Long.valueOf(this.zzYq);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("startTimeMillis", Long.valueOf(this.zzON)).zza("endTimeMillis", Long.valueOf(this.zzYq)).zza("dataSources", this.zzaaO).zza("dateTypes", this.zzYA).zza("sessions", this.zzaaP).zza("deleteAllData", Boolean.valueOf(this.zzaaQ)).zza("deleteAllSessions", Boolean.valueOf(this.zzaaR)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public boolean zzlR()
  {
    return this.zzaaQ;
  }

  public boolean zzlS()
  {
    return this.zzaaR;
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
    private long zzYq;
    private List<DataSource> zzaaO = new ArrayList();
    private List<Session> zzaaP = new ArrayList();
    private boolean zzaaQ = false;
    private boolean zzaaR = false;

    private void zzlT()
    {
      if (this.zzaaP.isEmpty())
        return;
      Iterator localIterator = this.zzaaP.iterator();
      label23: Session localSession;
      if (localIterator.hasNext())
      {
        localSession = (Session)localIterator.next();
        if ((localSession.getStartTime(TimeUnit.MILLISECONDS) < this.zzON) || (localSession.getEndTime(TimeUnit.MILLISECONDS) > this.zzYq))
          break label118;
      }
      label118: for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[3];
        arrayOfObject[0] = localSession;
        arrayOfObject[1] = Long.valueOf(this.zzON);
        arrayOfObject[2] = Long.valueOf(this.zzYq);
        zzx.zza(bool, "Session %s is outside the time interval [%d, %d]", arrayOfObject);
        break label23;
        break;
      }
    }

    public Builder addDataSource(DataSource paramDataSource)
    {
      boolean bool1 = true;
      boolean bool2;
      if (!this.zzaaQ)
      {
        bool2 = bool1;
        zzx.zzb(bool2, "All data is already marked for deletion");
        if (paramDataSource == null)
          break label58;
      }
      while (true)
      {
        zzx.zzb(bool1, "Must specify a valid data source");
        if (!this.zzaaO.contains(paramDataSource))
          this.zzaaO.add(paramDataSource);
        return this;
        bool2 = false;
        break;
        label58: bool1 = false;
      }
    }

    public Builder addDataType(DataType paramDataType)
    {
      boolean bool1 = true;
      boolean bool2;
      if (!this.zzaaQ)
      {
        bool2 = bool1;
        zzx.zzb(bool2, "All data is already marked for deletion");
        if (paramDataType == null)
          break label58;
      }
      while (true)
      {
        zzx.zzb(bool1, "Must specify a valid data type");
        if (!this.zzYA.contains(paramDataType))
          this.zzYA.add(paramDataType);
        return this;
        bool2 = false;
        break;
        label58: bool1 = false;
      }
    }

    public Builder addSession(Session paramSession)
    {
      boolean bool1 = true;
      boolean bool2;
      boolean bool3;
      if (!this.zzaaR)
      {
        bool2 = bool1;
        zzx.zzb(bool2, "All sessions already marked for deletion");
        if (paramSession == null)
          break label67;
        bool3 = bool1;
        label24: zzx.zzb(bool3, "Must specify a valid session");
        if (paramSession.getEndTime(TimeUnit.MILLISECONDS) <= 0L)
          break label73;
      }
      while (true)
      {
        zzx.zzb(bool1, "Must specify a session that has already ended");
        this.zzaaP.add(paramSession);
        return this;
        bool2 = false;
        break;
        label67: bool3 = false;
        break label24;
        label73: bool1 = false;
      }
    }

    public DataDeleteRequest build()
    {
      boolean bool1;
      int i;
      if ((this.zzON > 0L) && (this.zzYq > this.zzON))
      {
        bool1 = true;
        zzx.zza(bool1, "Must specify a valid time interval");
        if ((!this.zzaaQ) && (this.zzaaO.isEmpty()) && (this.zzYA.isEmpty()))
          break label123;
        i = 1;
        label62: if ((!this.zzaaR) && (this.zzaaP.isEmpty()))
          break label128;
      }
      label128: for (int j = 1; ; j = 0)
      {
        boolean bool2;
        if (i == 0)
        {
          bool2 = false;
          if (j == 0);
        }
        else
        {
          bool2 = true;
        }
        zzx.zza(bool2, "No data or session marked for deletion");
        zzlT();
        return new DataDeleteRequest(this, null);
        bool1 = false;
        break;
        label123: i = 0;
        break label62;
      }
    }

    public Builder deleteAllData()
    {
      if ((this.zzYA.isEmpty()) && (this.zzaaO.isEmpty()));
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = this.zzaaO;
        arrayOfObject[1] = this.zzYA;
        zzx.zzb(bool, "Specific data source/type already specified for deletion. DataSources: %s DataTypes: %s", arrayOfObject);
        this.zzaaQ = true;
        return this;
      }
    }

    public Builder deleteAllSessions()
    {
      boolean bool = this.zzaaP.isEmpty();
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.zzaaP;
      zzx.zzb(bool, "Specific sessions already added for deletion: %s", arrayOfObject);
      this.zzaaR = true;
      return this;
    }

    public Builder setTimeInterval(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      boolean bool1;
      if (paramLong1 > 0L)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Long.valueOf(paramLong1);
        zzx.zzb(bool1, "Invalid start time :%d", arrayOfObject1);
        if (paramLong2 <= paramLong1)
          break label92;
      }
      label92: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Long.valueOf(paramLong2);
        zzx.zzb(bool2, "Invalid end time :%d", arrayOfObject2);
        this.zzON = paramTimeUnit.toMillis(paramLong1);
        this.zzYq = paramTimeUnit.toMillis(paramLong2);
        return this;
        bool1 = false;
        break;
      }
    }
  }
}