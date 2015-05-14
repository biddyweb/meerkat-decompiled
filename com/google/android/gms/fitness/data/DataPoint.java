package com.google.android.gms.fitness.data;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzmo;
import com.google.android.gms.internal.zzmu;
import com.google.android.gms.internal.zzmx;
import com.google.android.gms.internal.zzxc.zzc;
import com.google.android.gms.internal.zzxd.zzb;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public final class DataPoint
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataPoint> CREATOR = new zze();
  private final int zzFG;
  private long zzYG;
  private long zzYH;
  private final Value[] zzYI;
  private DataSource zzYJ;
  private long zzYK;
  private long zzYL;
  private final DataSource zzYp;

  DataPoint(int paramInt, DataSource paramDataSource1, long paramLong1, long paramLong2, Value[] paramArrayOfValue, DataSource paramDataSource2, long paramLong3, long paramLong4)
  {
    this.zzFG = paramInt;
    this.zzYp = paramDataSource1;
    this.zzYJ = paramDataSource2;
    this.zzYG = paramLong1;
    this.zzYH = paramLong2;
    this.zzYI = paramArrayOfValue;
    this.zzYK = paramLong3;
    this.zzYL = paramLong4;
  }

  private DataPoint(DataSource paramDataSource)
  {
    this.zzFG = 4;
    this.zzYp = ((DataSource)zzx.zzb(paramDataSource, "Data source cannot be null"));
    List localList = paramDataSource.getDataType().getFields();
    this.zzYI = new Value[localList.size()];
    Iterator localIterator = localList.iterator();
    for (int i = 0; localIterator.hasNext(); i++)
    {
      Field localField = (Field)localIterator.next();
      this.zzYI[i] = new Value(localField.getFormat());
    }
  }

  public DataPoint(DataSource paramDataSource1, DataSource paramDataSource2, zzxd.zzb paramzzb)
  {
    this(4, paramDataSource1, zza(Long.valueOf(paramzzb.zzaIA), 0L), zza(Long.valueOf(paramzzb.zzaIB), 0L), zzmx.zza(paramDataSource1.zzly().zzaIf, paramzzb.zzaIC), paramDataSource2, zza(Long.valueOf(paramzzb.zzaIH), 0L), zza(Long.valueOf(paramzzb.zzaII), 0L));
  }

  DataPoint(List<DataSource> paramList, RawDataPoint paramRawDataPoint)
  {
    this(paramList, zzmu.zzb(paramRawDataPoint));
  }

  DataPoint(List<DataSource> paramList, zzxd.zzb paramzzb)
  {
    this(zzc(paramList, paramzzb.zzaID), zzc(paramList, paramzzb.zzaIF), paramzzb);
  }

  public static DataPoint create(DataSource paramDataSource)
  {
    return new DataPoint(paramDataSource);
  }

  public static DataPoint extract(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return (DataPoint)zzc.zza(paramIntent, "com.google.android.gms.fitness.EXTRA_DATA_POINT", CREATOR);
  }

  private static long zza(Long paramLong, long paramLong1)
  {
    if (paramLong != null)
      paramLong1 = paramLong.longValue();
    return paramLong1;
  }

  private boolean zza(DataPoint paramDataPoint)
  {
    return (zzw.equal(this.zzYp, paramDataPoint.zzYp)) && (this.zzYG == paramDataPoint.zzYG) && (this.zzYH == paramDataPoint.zzYH) && (Arrays.equals(this.zzYI, paramDataPoint.zzYI)) && (zzw.equal(this.zzYJ, paramDataPoint.zzYJ));
  }

  private static DataSource zzc(List<DataSource> paramList, int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < paramList.size()))
      return (DataSource)paramList.get(paramInt);
    return null;
  }

  private void zzdi(int paramInt)
  {
    List localList = getDataType().getFields();
    int i = localList.size();
    if (paramInt == i);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      arrayOfObject[1] = Integer.valueOf(i);
      arrayOfObject[2] = localList;
      zzx.zzb(bool, "Attempting to insert %s values, but needed %s: %s", arrayOfObject);
      return;
    }
  }

  private boolean zzlr()
  {
    return getDataType() == DataType.TYPE_LOCATION_SAMPLE;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataPoint)) && (zza((DataPoint)paramObject)));
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public DataType getDataType()
  {
    return this.zzYp.getDataType();
  }

  public long getEndTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYG, TimeUnit.NANOSECONDS);
  }

  public DataSource getOriginalDataSource()
  {
    return this.zzYJ;
  }

  public long getStartTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYH, TimeUnit.NANOSECONDS);
  }

  public long getTimestamp(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYG, TimeUnit.NANOSECONDS);
  }

  public long getTimestampNanos()
  {
    return this.zzYG;
  }

  public Value getValue(Field paramField)
  {
    int i = getDataType().indexOf(paramField);
    return this.zzYI[i];
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = Long.valueOf(this.zzYG);
    arrayOfObject[2] = Long.valueOf(this.zzYH);
    return zzw.hashCode(arrayOfObject);
  }

  public DataPoint setFloatValues(float[] paramArrayOfFloat)
  {
    zzdi(paramArrayOfFloat.length);
    for (int i = 0; i < paramArrayOfFloat.length; i++)
      this.zzYI[i].setFloat(paramArrayOfFloat[i]);
    return this;
  }

  public DataPoint setIntValues(int[] paramArrayOfInt)
  {
    zzdi(paramArrayOfInt.length);
    for (int i = 0; i < paramArrayOfInt.length; i++)
      this.zzYI[i].setInt(paramArrayOfInt[i]);
    return this;
  }

  public DataPoint setTimeInterval(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
  {
    this.zzYH = paramTimeUnit.toNanos(paramLong1);
    this.zzYG = paramTimeUnit.toNanos(paramLong2);
    return this;
  }

  public DataPoint setTimestamp(long paramLong, TimeUnit paramTimeUnit)
  {
    this.zzYG = paramTimeUnit.toNanos(paramLong);
    if ((zzlr()) && (zzmo.zza(paramTimeUnit)))
    {
      Log.w("Fitness", "Storing location at more than millisecond granularity is not supported. Extra precision is lost as the value is converted to milliseconds.");
      this.zzYG = zzmo.zza(this.zzYG, TimeUnit.NANOSECONDS, TimeUnit.MILLISECONDS);
    }
    return this;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = Arrays.toString(this.zzYI);
    arrayOfObject[1] = Long.valueOf(this.zzYH);
    arrayOfObject[2] = Long.valueOf(this.zzYG);
    arrayOfObject[3] = Long.valueOf(this.zzYK);
    arrayOfObject[4] = Long.valueOf(this.zzYL);
    arrayOfObject[5] = this.zzYp.toDebugString();
    if (this.zzYJ != null);
    for (String str = this.zzYJ.toDebugString(); ; str = "N/A")
    {
      arrayOfObject[6] = str;
      return String.format("DataPoint{%s@[%s, %s,raw=%s,insert=%s](%s %s)}", arrayOfObject);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }

  public Value[] zzls()
  {
    return this.zzYI;
  }

  public long zzlt()
  {
    return this.zzYK;
  }

  public long zzlu()
  {
    return this.zzYL;
  }

  public long zzlv()
  {
    return this.zzYH;
  }
}