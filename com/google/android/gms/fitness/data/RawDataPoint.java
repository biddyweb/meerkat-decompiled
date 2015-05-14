package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

public final class RawDataPoint
  implements SafeParcelable
{
  public static final Parcelable.Creator<RawDataPoint> CREATOR = new zzn();
  final int zzFG;
  public final long zzYG;
  public final long zzYH;
  public final Value[] zzYI;
  public final long zzYK;
  public final long zzYL;
  public final int zzZJ;
  public final int zzZK;

  public RawDataPoint(int paramInt1, long paramLong1, long paramLong2, Value[] paramArrayOfValue, int paramInt2, int paramInt3, long paramLong3, long paramLong4)
  {
    this.zzFG = paramInt1;
    this.zzYG = paramLong1;
    this.zzYH = paramLong2;
    this.zzZJ = paramInt2;
    this.zzZK = paramInt3;
    this.zzYK = paramLong3;
    this.zzYL = paramLong4;
    this.zzYI = paramArrayOfValue;
  }

  RawDataPoint(DataPoint paramDataPoint, List<DataSource> paramList)
  {
    this.zzFG = 4;
    this.zzYG = paramDataPoint.getTimestamp(TimeUnit.NANOSECONDS);
    this.zzYH = paramDataPoint.getStartTime(TimeUnit.NANOSECONDS);
    this.zzYI = paramDataPoint.zzls();
    this.zzZJ = zzt.zza(paramDataPoint.getDataSource(), paramList);
    this.zzZK = zzt.zza(paramDataPoint.getOriginalDataSource(), paramList);
    this.zzYK = paramDataPoint.zzlt();
    this.zzYL = paramDataPoint.zzlu();
  }

  private boolean zza(RawDataPoint paramRawDataPoint)
  {
    return (this.zzYG == paramRawDataPoint.zzYG) && (this.zzYH == paramRawDataPoint.zzYH) && (Arrays.equals(this.zzYI, paramRawDataPoint.zzYI)) && (this.zzZJ == paramRawDataPoint.zzZJ) && (this.zzZK == paramRawDataPoint.zzZK) && (this.zzYK == paramRawDataPoint.zzYK);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof RawDataPoint)) && (zza((RawDataPoint)paramObject)));
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Long.valueOf(this.zzYG);
    arrayOfObject[1] = Long.valueOf(this.zzYH);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = Arrays.toString(this.zzYI);
    arrayOfObject[1] = Long.valueOf(this.zzYH);
    arrayOfObject[2] = Long.valueOf(this.zzYG);
    arrayOfObject[3] = Integer.valueOf(this.zzZJ);
    arrayOfObject[4] = Integer.valueOf(this.zzZK);
    return String.format("RawDataPoint{%s@[%s, %s](%d,%d)}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzn.zza(this, paramParcel, paramInt);
  }
}