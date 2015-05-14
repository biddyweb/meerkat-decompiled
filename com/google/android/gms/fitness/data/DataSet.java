package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzmu;
import com.google.android.gms.internal.zzmv;
import com.google.android.gms.internal.zzxc.zzc;
import com.google.android.gms.internal.zzxd.zzc;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public final class DataSet
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataSet> CREATOR = new zzf();
  private final int zzFG;
  private boolean zzYF = false;
  private final List<DataPoint> zzYM;
  private final List<DataSource> zzYN;
  private final DataType zzYo;
  private final DataSource zzYp;

  DataSet(int paramInt, DataSource paramDataSource, DataType paramDataType, List<RawDataPoint> paramList, List<DataSource> paramList1, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzYp = paramDataSource;
    this.zzYo = paramDataSource.getDataType();
    this.zzYF = paramBoolean;
    this.zzYM = new ArrayList(paramList.size());
    if (paramInt >= 2);
    while (true)
    {
      this.zzYN = paramList1;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        RawDataPoint localRawDataPoint = (RawDataPoint)localIterator.next();
        this.zzYM.add(new DataPoint(this.zzYN, localRawDataPoint));
      }
      paramList1 = Collections.singletonList(paramDataSource);
    }
  }

  public DataSet(DataSource paramDataSource)
  {
    this.zzFG = 3;
    this.zzYp = ((DataSource)zzx.zzl(paramDataSource));
    this.zzYo = paramDataSource.getDataType();
    this.zzYM = new ArrayList();
    this.zzYN = new ArrayList();
    this.zzYN.add(this.zzYp);
  }

  public DataSet(RawDataSet paramRawDataSet, List<DataSource> paramList)
  {
    this(zzmv.zzb(paramRawDataSet), paramList);
  }

  public DataSet(zzxd.zzc paramzzc, List<DataSource> paramList)
  {
    this.zzFG = 3;
    this.zzYp = ((DataSource)zzd(paramList, paramzzc.zzaID));
    this.zzYo = this.zzYp.getDataType();
    this.zzYN = paramList;
    this.zzYF = paramzzc.zzaIx;
    List localList = zzmu.zza(((DataSource)zzd(paramList, paramzzc.zzaID)).zzly().zzaIf, paramzzc.zzaIK);
    this.zzYM = new ArrayList(localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      RawDataPoint localRawDataPoint = (RawDataPoint)localIterator.next();
      this.zzYM.add(new DataPoint(this.zzYN, localRawDataPoint));
    }
  }

  public static DataSet create(DataSource paramDataSource)
  {
    zzx.zzb(paramDataSource, "DataSource should be specified");
    return new DataSet(paramDataSource);
  }

  private boolean zza(DataSet paramDataSet)
  {
    return (zzw.equal(getDataType(), paramDataSet.getDataType())) && (zzw.equal(this.zzYp, paramDataSet.zzYp)) && (zzw.equal(this.zzYM, paramDataSet.zzYM)) && (this.zzYF == paramDataSet.zzYF);
  }

  private static <T> T zzd(List<T> paramList, int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < paramList.size()))
      return paramList.get(paramInt);
    return null;
  }

  public void add(DataPoint paramDataPoint)
  {
    DataSource localDataSource = paramDataPoint.getDataSource();
    boolean bool1 = localDataSource.getStreamIdentifier().equals(this.zzYp.getStreamIdentifier());
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = localDataSource;
    arrayOfObject1[1] = this.zzYp;
    zzx.zzb(bool1, "Conflicting data sources found %s vs %s", arrayOfObject1);
    boolean bool2 = paramDataPoint.getDataType().getName().equals(getDataType().getName());
    Object[] arrayOfObject2 = new Object[2];
    arrayOfObject2[0] = paramDataPoint.getDataType();
    arrayOfObject2[1] = getDataType();
    zzx.zzb(bool2, "Conflicting data types found %s vs %s", arrayOfObject2);
    boolean bool3;
    if (paramDataPoint.getTimestamp(TimeUnit.NANOSECONDS) > 0L)
    {
      bool3 = true;
      zzx.zzb(bool3, "Data point does not have the timestamp set: %s", new Object[] { paramDataPoint });
      if (paramDataPoint.getStartTime(TimeUnit.NANOSECONDS) > paramDataPoint.getEndTime(TimeUnit.NANOSECONDS))
        break label175;
    }
    label175: for (boolean bool4 = true; ; bool4 = false)
    {
      zzx.zzb(bool4, "Data point with start time greater than end time found: %s", new Object[] { paramDataPoint });
      zzb(paramDataPoint);
      return;
      bool3 = false;
      break;
    }
  }

  public void addAll(Iterable<DataPoint> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
      add((DataPoint)localIterator.next());
  }

  public DataPoint createDataPoint()
  {
    return DataPoint.create(this.zzYp);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof DataSet)) && (zza((DataSet)paramObject)));
  }

  public List<DataPoint> getDataPoints()
  {
    return Collections.unmodifiableList(this.zzYM);
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public DataType getDataType()
  {
    return this.zzYp.getDataType();
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzYp;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object localObject = zzlw();
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = this.zzYp.toDebugString();
    if (this.zzYM.size() < 10);
    while (true)
    {
      arrayOfObject1[1] = localObject;
      return String.format("DataSet{%s %s}", arrayOfObject1);
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = Integer.valueOf(this.zzYM.size());
      arrayOfObject2[1] = ((List)localObject).subList(0, 5);
      localObject = String.format("%d data points, first 5: %s", arrayOfObject2);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public void zzb(DataPoint paramDataPoint)
  {
    this.zzYM.add(paramDataPoint);
    DataSource localDataSource = paramDataPoint.getOriginalDataSource();
    if ((localDataSource != null) && (!this.zzYN.contains(localDataSource)))
      this.zzYN.add(localDataSource);
  }

  public void zzb(Iterable<DataPoint> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
      zzb((DataPoint)localIterator.next());
  }

  List<RawDataPoint> zzk(List<DataSource> paramList)
  {
    ArrayList localArrayList = new ArrayList(this.zzYM.size());
    Iterator localIterator = this.zzYM.iterator();
    while (localIterator.hasNext())
      localArrayList.add(new RawDataPoint((DataPoint)localIterator.next(), paramList));
    return localArrayList;
  }

  public boolean zzlo()
  {
    return this.zzYF;
  }

  List<RawDataPoint> zzlw()
  {
    return zzk(this.zzYN);
  }

  List<DataSource> zzlx()
  {
    return this.zzYN;
  }
}