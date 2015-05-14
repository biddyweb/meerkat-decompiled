package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.fitness.data.zzq;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class SessionReadResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<SessionReadResult> CREATOR = new zzl();
  private final int zzFG;
  private final Status zzHb;
  private final List<Session> zzaaP;
  private final List<zzq> zzabU;

  SessionReadResult(int paramInt, List<Session> paramList, List<zzq> paramList1, Status paramStatus)
  {
    this.zzFG = paramInt;
    this.zzaaP = paramList;
    this.zzabU = Collections.unmodifiableList(paramList1);
    this.zzHb = paramStatus;
  }

  public SessionReadResult(List<Session> paramList, List<zzq> paramList1, Status paramStatus)
  {
    this.zzFG = 3;
    this.zzaaP = paramList;
    this.zzabU = Collections.unmodifiableList(paramList1);
    this.zzHb = paramStatus;
  }

  public static SessionReadResult zzF(Status paramStatus)
  {
    return new SessionReadResult(new ArrayList(), new ArrayList(), paramStatus);
  }

  private boolean zzb(SessionReadResult paramSessionReadResult)
  {
    return (this.zzHb.equals(paramSessionReadResult.zzHb)) && (zzw.equal(this.zzaaP, paramSessionReadResult.zzaaP)) && (zzw.equal(this.zzabU, paramSessionReadResult.zzabU));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof SessionReadResult)) && (zzb((SessionReadResult)paramObject)));
  }

  public List<DataSet> getDataSet(Session paramSession)
  {
    zzx.zzb(this.zzaaP.contains(paramSession), "Attempting to read data for session %s which was not returned", new Object[] { paramSession });
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzabU.iterator();
    while (localIterator.hasNext())
    {
      zzq localzzq = (zzq)localIterator.next();
      if (zzw.equal(paramSession, localzzq.getSession()))
        localArrayList.add(localzzq.zzlH());
    }
    return localArrayList;
  }

  public List<DataSet> getDataSet(Session paramSession, DataType paramDataType)
  {
    zzx.zzb(this.zzaaP.contains(paramSession), "Attempting to read data for session %s which was not returned", new Object[] { paramSession });
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzabU.iterator();
    while (localIterator.hasNext())
    {
      zzq localzzq = (zzq)localIterator.next();
      if ((zzw.equal(paramSession, localzzq.getSession())) && (paramDataType.equals(localzzq.zzlH().getDataType())))
        localArrayList.add(localzzq.zzlH());
    }
    return localArrayList;
  }

  public List<Session> getSessions()
  {
    return this.zzaaP;
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
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzHb;
    arrayOfObject[1] = this.zzaaP;
    arrayOfObject[2] = this.zzabU;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("sessions", this.zzaaP).zza("sessionDataSets", this.zzabU).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }

  public List<zzq> zzmt()
  {
    return this.zzabU;
  }
}