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
import com.google.android.gms.internal.zznt;
import com.google.android.gms.internal.zznt.zza;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class SessionReadRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<SessionReadRequest> CREATOR = new zzah();
  private final int zzFG;
  private final String zzFO;
  private final long zzON;
  private final List<DataType> zzYA;
  private final long zzYq;
  private final List<DataSource> zzaaO;
  private final boolean zzaaZ;
  private final String zzabC;
  private boolean zzabD;
  private final List<String> zzabE;
  private final zznt zzabF;
  private final String zzyL;

  SessionReadRequest(int paramInt, String paramString1, String paramString2, long paramLong1, long paramLong2, List<DataType> paramList, List<DataSource> paramList1, boolean paramBoolean1, boolean paramBoolean2, List<String> paramList2, IBinder paramIBinder, String paramString3)
  {
    this.zzFG = paramInt;
    this.zzabC = paramString1;
    this.zzyL = paramString2;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzYA = Collections.unmodifiableList(paramList);
    this.zzaaO = Collections.unmodifiableList(paramList1);
    this.zzabD = paramBoolean1;
    this.zzaaZ = paramBoolean2;
    this.zzabE = paramList2;
    if (paramIBinder == null);
    for (zznt localzznt = null; ; localzznt = zznt.zza.zzaQ(paramIBinder))
    {
      this.zzabF = localzznt;
      this.zzFO = paramString3;
      return;
    }
  }

  private SessionReadRequest(Builder paramBuilder)
  {
    this(Builder.zza(paramBuilder), Builder.zzb(paramBuilder), Builder.zzc(paramBuilder), Builder.zzd(paramBuilder), Builder.zze(paramBuilder), Builder.zzf(paramBuilder), Builder.zzg(paramBuilder), Builder.zzh(paramBuilder), Builder.zzi(paramBuilder), null, null);
  }

  public SessionReadRequest(SessionReadRequest paramSessionReadRequest, zznt paramzznt, String paramString)
  {
    this(paramSessionReadRequest.zzabC, paramSessionReadRequest.zzyL, paramSessionReadRequest.zzON, paramSessionReadRequest.zzYq, paramSessionReadRequest.zzYA, paramSessionReadRequest.zzaaO, paramSessionReadRequest.zzabD, paramSessionReadRequest.zzaaZ, paramSessionReadRequest.zzabE, paramzznt, paramString);
  }

  public SessionReadRequest(String paramString1, String paramString2, long paramLong1, long paramLong2, List<DataType> paramList, List<DataSource> paramList1, boolean paramBoolean1, boolean paramBoolean2, List<String> paramList2, zznt paramzznt, String paramString3)
  {
    this.zzFG = 4;
    this.zzabC = paramString1;
    this.zzyL = paramString2;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzYA = Collections.unmodifiableList(paramList);
    this.zzaaO = Collections.unmodifiableList(paramList1);
    this.zzabD = paramBoolean1;
    this.zzaaZ = paramBoolean2;
    this.zzabE = paramList2;
    this.zzabF = paramzznt;
    this.zzFO = paramString3;
  }

  private boolean zzb(SessionReadRequest paramSessionReadRequest)
  {
    return (zzw.equal(this.zzabC, paramSessionReadRequest.zzabC)) && (this.zzyL.equals(paramSessionReadRequest.zzyL)) && (this.zzON == paramSessionReadRequest.zzON) && (this.zzYq == paramSessionReadRequest.zzYq) && (zzw.equal(this.zzYA, paramSessionReadRequest.zzYA)) && (zzw.equal(this.zzaaO, paramSessionReadRequest.zzaaO)) && (this.zzabD == paramSessionReadRequest.zzabD) && (this.zzabE.equals(paramSessionReadRequest.zzabE)) && (this.zzaaZ == paramSessionReadRequest.zzaaZ);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof SessionReadRequest)) && (zzb((SessionReadRequest)paramObject)));
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

  public List<String> getExcludedPackages()
  {
    return this.zzabE;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public String getSessionId()
  {
    return this.zzyL;
  }

  public String getSessionName()
  {
    return this.zzabC;
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
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzabC;
    arrayOfObject[1] = this.zzyL;
    arrayOfObject[2] = Long.valueOf(this.zzON);
    arrayOfObject[3] = Long.valueOf(this.zzYq);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean includeSessionsFromAllApps()
  {
    return this.zzabD;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("sessionName", this.zzabC).zza("sessionId", this.zzyL).zza("startTimeMillis", Long.valueOf(this.zzON)).zza("endTimeMillis", Long.valueOf(this.zzYq)).zza("dataTypes", this.zzYA).zza("dataSources", this.zzaaO).zza("sessionsFromAllApps", Boolean.valueOf(this.zzabD)).zza("excludedPackages", this.zzabE).zza("useServer", Boolean.valueOf(this.zzaaZ)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzah.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzabF == null)
      return null;
    return this.zzabF.asBinder();
  }

  public boolean zzlV()
  {
    return this.zzaaZ;
  }

  public long zzlp()
  {
    return this.zzON;
  }

  public long zzlq()
  {
    return this.zzYq;
  }

  public boolean zzmj()
  {
    return this.zzabD;
  }

  public static class Builder
  {
    private long zzON = 0L;
    private List<DataType> zzYA = new ArrayList();
    private long zzYq = 0L;
    private List<DataSource> zzaaO = new ArrayList();
    private boolean zzaaZ = false;
    private String zzabC;
    private boolean zzabD = false;
    private List<String> zzabE = new ArrayList();
    private String zzyL;

    public SessionReadRequest build()
    {
      boolean bool1;
      if (this.zzON > 0L)
      {
        bool1 = true;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Long.valueOf(this.zzON);
        zzx.zzb(bool1, "Invalid start time: %s", arrayOfObject1);
        if ((this.zzYq <= 0L) || (this.zzYq <= this.zzON))
          break label96;
      }
      label96: for (boolean bool2 = true; ; bool2 = false)
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Long.valueOf(this.zzYq);
        zzx.zzb(bool2, "Invalid end time: %s", arrayOfObject2);
        return new SessionReadRequest(this, null);
        bool1 = false;
        break;
      }
    }

    public Builder enableServerQueries()
    {
      this.zzaaZ = true;
      return this;
    }

    public Builder excludePackage(String paramString)
    {
      zzx.zzb(paramString, "Attempting to use a null package name");
      if (!this.zzabE.contains(paramString))
        this.zzabE.add(paramString);
      return this;
    }

    public Builder read(DataSource paramDataSource)
    {
      zzx.zzb(paramDataSource, "Attempting to add a null data source");
      if (!this.zzaaO.contains(paramDataSource))
        this.zzaaO.add(paramDataSource);
      return this;
    }

    public Builder read(DataType paramDataType)
    {
      zzx.zzb(paramDataType, "Attempting to use a null data type");
      if (!this.zzYA.contains(paramDataType))
        this.zzYA.add(paramDataType);
      return this;
    }

    public Builder readSessionsFromAllApps()
    {
      this.zzabD = true;
      return this;
    }

    public Builder setSessionId(String paramString)
    {
      this.zzyL = paramString;
      return this;
    }

    public Builder setSessionName(String paramString)
    {
      this.zzabC = paramString;
      return this;
    }

    public Builder setTimeInterval(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      this.zzON = paramTimeUnit.toMillis(paramLong1);
      this.zzYq = paramTimeUnit.toMillis(paramLong2);
      return this;
    }
  }
}