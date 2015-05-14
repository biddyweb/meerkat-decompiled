package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.FitnessActivities;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzms;
import com.google.android.gms.internal.zzxd.zza;
import com.google.android.gms.internal.zzxd.zzc;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class Bucket
  implements SafeParcelable
{
  public static final Parcelable.Creator<Bucket> CREATOR = new zzd();
  public static final int TYPE_ACTIVITY_SEGMENT = 4;
  public static final int TYPE_ACTIVITY_TYPE = 3;
  public static final int TYPE_SESSION = 2;
  public static final int TYPE_TIME = 1;
  public static final Comparator<Bucket> zzYB = new Comparator()
  {
    public int zza(Bucket paramAnonymousBucket1, Bucket paramAnonymousBucket2)
    {
      return zzmd.compare(paramAnonymousBucket1.getStartTime(TimeUnit.MILLISECONDS), paramAnonymousBucket2.getStartTime(TimeUnit.MILLISECONDS));
    }
  };
  private final int zzFG;
  private final long zzON;
  private final int zzYC;
  private final List<DataSet> zzYD;
  private final int zzYE;
  private boolean zzYF = false;
  private final long zzYq;
  private final Session zzYs;

  Bucket(int paramInt1, long paramLong1, long paramLong2, Session paramSession, int paramInt2, List<DataSet> paramList, int paramInt3, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.zzYs = paramSession;
    this.zzYC = paramInt2;
    this.zzYD = paramList;
    this.zzYE = paramInt3;
    this.zzYF = paramBoolean;
  }

  public Bucket(RawBucket paramRawBucket, List<DataSource> paramList)
  {
    this(zzms.zzb(paramRawBucket), paramList);
  }

  public Bucket(zzxd.zza paramzza, List<DataSource> paramList)
  {
  }

  private static List<DataSet> zza(zzxd.zzc[] paramArrayOfzzc, List<DataSource> paramList)
  {
    ArrayList localArrayList = new ArrayList(paramArrayOfzzc.length);
    int i = paramArrayOfzzc.length;
    for (int j = 0; j < i; j++)
      localArrayList.add(new DataSet(paramArrayOfzzc[j], paramList));
    return localArrayList;
  }

  private boolean zza(Bucket paramBucket)
  {
    return (this.zzON == paramBucket.zzON) && (this.zzYq == paramBucket.zzYq) && (this.zzYC == paramBucket.zzYC) && (zzw.equal(this.zzYD, paramBucket.zzYD)) && (this.zzYE == paramBucket.zzYE) && (this.zzYF == paramBucket.zzYF);
  }

  public static String zzdg(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return "bug";
    case 1:
      return "time";
    case 3:
      return "type";
    case 4:
      return "segment";
    case 2:
      return "session";
    case 0:
    }
    return "unknown";
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof Bucket)) && (zza((Bucket)paramObject)));
  }

  public String getActivity()
  {
    return FitnessActivities.getName(this.zzYC);
  }

  public int getBucketType()
  {
    return this.zzYE;
  }

  public DataSet getDataSet(DataType paramDataType)
  {
    Iterator localIterator = this.zzYD.iterator();
    while (localIterator.hasNext())
    {
      DataSet localDataSet = (DataSet)localIterator.next();
      if (localDataSet.getDataType().equals(paramDataType))
        return localDataSet;
    }
    return null;
  }

  public List<DataSet> getDataSets()
  {
    return this.zzYD;
  }

  public long getEndTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYq, TimeUnit.MILLISECONDS);
  }

  public Session getSession()
  {
    return this.zzYs;
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
    arrayOfObject[0] = Long.valueOf(this.zzON);
    arrayOfObject[1] = Long.valueOf(this.zzYq);
    arrayOfObject[2] = Integer.valueOf(this.zzYC);
    arrayOfObject[3] = Integer.valueOf(this.zzYE);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("startTime", Long.valueOf(this.zzON)).zza("endTime", Long.valueOf(this.zzYq)).zza("activity", Integer.valueOf(this.zzYC)).zza("dataSets", this.zzYD).zza("bucketType", zzdg(this.zzYE)).zza("serverHasMoreData", Boolean.valueOf(this.zzYF)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }

  public boolean zzb(Bucket paramBucket)
  {
    return (this.zzON == paramBucket.zzON) && (this.zzYq == paramBucket.zzYq) && (this.zzYC == paramBucket.zzYC) && (this.zzYE == paramBucket.zzYE);
  }

  public int zzln()
  {
    return this.zzYC;
  }

  public boolean zzlo()
  {
    if (this.zzYF)
      return true;
    Iterator localIterator = this.zzYD.iterator();
    while (localIterator.hasNext())
      if (((DataSet)localIterator.next()).zzlo())
        return true;
    return false;
  }

  public long zzlp()
  {
    return this.zzON;
  }

  public long zzlq()
  {
    return this.zzYq;
  }
}