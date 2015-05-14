package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class DataSourcesResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<DataSourcesResult> CREATOR = new zze();
  private final int zzFG;
  private final Status zzHb;
  private final List<DataSource> zzaaO;

  DataSourcesResult(int paramInt, List<DataSource> paramList, Status paramStatus)
  {
    this.zzFG = paramInt;
    this.zzaaO = Collections.unmodifiableList(paramList);
    this.zzHb = paramStatus;
  }

  public DataSourcesResult(List<DataSource> paramList, Status paramStatus)
  {
    this.zzFG = 3;
    this.zzaaO = Collections.unmodifiableList(paramList);
    this.zzHb = paramStatus;
  }

  public static DataSourcesResult zzC(Status paramStatus)
  {
    return new DataSourcesResult(Collections.emptyList(), paramStatus);
  }

  private boolean zzb(DataSourcesResult paramDataSourcesResult)
  {
    return (this.zzHb.equals(paramDataSourcesResult.zzHb)) && (zzw.equal(this.zzaaO, paramDataSourcesResult.zzaaO));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataSourcesResult)) && (zzb((DataSourcesResult)paramObject)));
  }

  public List<DataSource> getDataSources()
  {
    return this.zzaaO;
  }

  public List<DataSource> getDataSources(DataType paramDataType)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzaaO.iterator();
    while (localIterator.hasNext())
    {
      DataSource localDataSource = (DataSource)localIterator.next();
      if (localDataSource.getDataType().equals(paramDataType))
        localArrayList.add(localDataSource);
    }
    return Collections.unmodifiableList(localArrayList);
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
    arrayOfObject[1] = this.zzaaO;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("dataSets", this.zzaaO).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
}