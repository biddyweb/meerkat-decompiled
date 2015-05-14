package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.Bucket;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataSource.Builder;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.RawBucket;
import com.google.android.gms.fitness.data.RawDataSet;
import com.google.android.gms.fitness.request.DataReadRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class DataReadResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<DataReadResult> CREATOR = new zzb();
  private final int zzFG;
  private final Status zzHb;
  private final List<DataSet> zzYD;
  private final List<DataSource> zzYN;
  private final List<Bucket> zzabM;
  private int zzabN;
  private final List<DataType> zzabO;

  DataReadResult(int paramInt1, List<RawDataSet> paramList, Status paramStatus, List<RawBucket> paramList1, int paramInt2, List<DataSource> paramList2, List<DataType> paramList3)
  {
    this.zzFG = paramInt1;
    this.zzHb = paramStatus;
    this.zzabN = paramInt2;
    this.zzYN = paramList2;
    this.zzabO = paramList3;
    this.zzYD = new ArrayList(paramList.size());
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
    {
      RawDataSet localRawDataSet = (RawDataSet)localIterator1.next();
      this.zzYD.add(new DataSet(localRawDataSet, paramList2));
    }
    this.zzabM = new ArrayList(paramList1.size());
    Iterator localIterator2 = paramList1.iterator();
    while (localIterator2.hasNext())
    {
      RawBucket localRawBucket = (RawBucket)localIterator2.next();
      this.zzabM.add(new Bucket(localRawBucket, paramList2));
    }
  }

  public DataReadResult(List<DataSet> paramList, List<Bucket> paramList1, Status paramStatus)
  {
    this.zzFG = 5;
    this.zzYD = paramList;
    this.zzHb = paramStatus;
    this.zzabM = paramList1;
    this.zzabN = 1;
    this.zzYN = new ArrayList();
    this.zzabO = new ArrayList();
  }

  public static DataReadResult zza(Status paramStatus, DataReadRequest paramDataReadRequest)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = paramDataReadRequest.getDataSources().iterator();
    while (localIterator1.hasNext())
      localArrayList.add(DataSet.create((DataSource)localIterator1.next()));
    Iterator localIterator2 = paramDataReadRequest.getDataTypes().iterator();
    while (localIterator2.hasNext())
    {
      DataType localDataType = (DataType)localIterator2.next();
      localArrayList.add(DataSet.create(new DataSource.Builder().setDataType(localDataType).setType(1).setName("Default").build()));
    }
    return new DataReadResult(localArrayList, Collections.emptyList(), paramStatus);
  }

  private void zza(Bucket paramBucket, List<Bucket> paramList)
  {
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
    {
      Bucket localBucket = (Bucket)localIterator1.next();
      if (localBucket.zzb(paramBucket))
      {
        Iterator localIterator2 = paramBucket.getDataSets().iterator();
        while (localIterator2.hasNext())
          zza((DataSet)localIterator2.next(), localBucket.getDataSets());
      }
    }
    this.zzabM.add(paramBucket);
  }

  private void zza(DataSet paramDataSet, List<DataSet> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DataSet localDataSet = (DataSet)localIterator.next();
      if (localDataSet.getDataSource().equals(paramDataSet.getDataSource()))
      {
        localDataSet.zzb(paramDataSet.getDataPoints());
        return;
      }
    }
    paramList.add(paramDataSet);
  }

  private boolean zzc(DataReadResult paramDataReadResult)
  {
    return (this.zzHb.equals(paramDataReadResult.zzHb)) && (zzw.equal(this.zzYD, paramDataReadResult.zzYD)) && (zzw.equal(this.zzabM, paramDataReadResult.zzabM));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataReadResult)) && (zzc((DataReadResult)paramObject)));
  }

  public List<Bucket> getBuckets()
  {
    return this.zzabM;
  }

  public DataSet getDataSet(DataSource paramDataSource)
  {
    Iterator localIterator = this.zzYD.iterator();
    while (localIterator.hasNext())
    {
      DataSet localDataSet = (DataSet)localIterator.next();
      if (paramDataSource.equals(localDataSet.getDataSource()))
        return localDataSet;
    }
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramDataSource.getStreamIdentifier();
    throw new IllegalArgumentException(String.format("Attempting to read data for %s, which was not requested", arrayOfObject));
  }

  public DataSet getDataSet(DataType paramDataType)
  {
    Iterator localIterator = this.zzYD.iterator();
    while (localIterator.hasNext())
    {
      DataSet localDataSet = (DataSet)localIterator.next();
      if (paramDataType.equals(localDataSet.getDataType()))
        return localDataSet;
    }
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramDataType.getName();
    throw new IllegalArgumentException(String.format("Attempting to read data for %s, which was not requested", arrayOfObject));
  }

  public List<DataSet> getDataSets()
  {
    return this.zzYD;
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
    arrayOfObject[1] = this.zzYD;
    arrayOfObject[2] = this.zzabM;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    zzw.zza localzza1 = zzw.zzk(this).zza("status", this.zzHb);
    Object localObject1;
    zzw.zza localzza2;
    if (this.zzYD.size() > 5)
    {
      localObject1 = this.zzYD.size() + " data sets";
      localzza2 = localzza1.zza("dataSets", localObject1);
      if (this.zzabM.size() <= 5)
        break label125;
    }
    label125: for (Object localObject2 = this.zzabM.size() + " buckets"; ; localObject2 = this.zzabM)
    {
      return localzza2.zza("buckets", localObject2).toString();
      localObject1 = this.zzYD;
      break;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public void zzb(DataReadResult paramDataReadResult)
  {
    Iterator localIterator1 = paramDataReadResult.getDataSets().iterator();
    while (localIterator1.hasNext())
      zza((DataSet)localIterator1.next(), this.zzYD);
    Iterator localIterator2 = paramDataReadResult.getBuckets().iterator();
    while (localIterator2.hasNext())
      zza((Bucket)localIterator2.next(), this.zzabM);
  }

  List<DataSource> zzlx()
  {
    return this.zzYN;
  }

  public int zzmn()
  {
    return this.zzabN;
  }

  List<RawBucket> zzmo()
  {
    ArrayList localArrayList = new ArrayList(this.zzabM.size());
    Iterator localIterator = this.zzabM.iterator();
    while (localIterator.hasNext())
      localArrayList.add(new RawBucket((Bucket)localIterator.next(), this.zzYN, this.zzabO));
    return localArrayList;
  }

  List<RawDataSet> zzmp()
  {
    ArrayList localArrayList = new ArrayList(this.zzYD.size());
    Iterator localIterator = this.zzYD.iterator();
    while (localIterator.hasNext())
      localArrayList.add(new RawDataSet((DataSet)localIterator.next(), this.zzYN, this.zzabO));
    return localArrayList;
  }

  List<DataType> zzmq()
  {
    return this.zzabO;
  }
}