package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public final class RawBucket
  implements SafeParcelable
{
  public static final Parcelable.Creator<RawBucket> CREATOR = new zzm();
  final int zzFG;
  public final long zzON;
  public final List<RawDataSet> zzYD;
  public final int zzYE;
  public final boolean zzYF;
  public final long zzYq;
  public final Session zzYs;
  public final int zzZI;

  public RawBucket(int paramInt1, long paramLong1, long paramLong2, Session paramSession, int paramInt2, List<RawDataSet> paramList, int paramInt3, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzYs = paramSession;
    this.zzZI = paramInt2;
    this.zzYD = paramList;
    this.zzYE = paramInt3;
    this.zzYF = paramBoolean;
  }

  public RawBucket(Bucket paramBucket, List<DataSource> paramList, List<DataType> paramList1)
  {
    this.zzFG = 2;
    this.zzON = paramBucket.getStartTime(TimeUnit.MILLISECONDS);
    this.zzYq = paramBucket.getEndTime(TimeUnit.MILLISECONDS);
    this.zzYs = paramBucket.getSession();
    this.zzZI = paramBucket.zzln();
    this.zzYE = paramBucket.getBucketType();
    this.zzYF = paramBucket.zzlo();
    List localList = paramBucket.getDataSets();
    this.zzYD = new ArrayList(localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      DataSet localDataSet = (DataSet)localIterator.next();
      this.zzYD.add(new RawDataSet(localDataSet, paramList, paramList1));
    }
  }

  private boolean zza(RawBucket paramRawBucket)
  {
    return (this.zzON == paramRawBucket.zzON) && (this.zzYq == paramRawBucket.zzYq) && (this.zzZI == paramRawBucket.zzZI) && (zzw.equal(this.zzYD, paramRawBucket.zzYD)) && (this.zzYE == paramRawBucket.zzYE) && (this.zzYF == paramRawBucket.zzYF);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof RawBucket)) && (zza((RawBucket)paramObject)));
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Long.valueOf(this.zzON);
    arrayOfObject[1] = Long.valueOf(this.zzYq);
    arrayOfObject[2] = Integer.valueOf(this.zzYE);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("startTime", Long.valueOf(this.zzON)).zza("endTime", Long.valueOf(this.zzYq)).zza("activity", Integer.valueOf(this.zzZI)).zza("dataSets", this.zzYD).zza("bucketType", Integer.valueOf(this.zzYE)).zza("serverHasMoreData", Boolean.valueOf(this.zzYF)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
}