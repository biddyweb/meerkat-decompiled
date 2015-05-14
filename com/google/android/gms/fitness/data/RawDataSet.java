package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import java.util.List;

public final class RawDataSet
  implements SafeParcelable
{
  public static final Parcelable.Creator<RawDataSet> CREATOR = new zzo();
  final int zzFG;
  public final boolean zzYF;
  public final int zzZJ;
  public final int zzZL;
  public final List<RawDataPoint> zzZM;

  public RawDataSet(int paramInt1, int paramInt2, int paramInt3, List<RawDataPoint> paramList, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzZJ = paramInt2;
    this.zzZL = paramInt3;
    this.zzZM = paramList;
    this.zzYF = paramBoolean;
  }

  public RawDataSet(DataSet paramDataSet, List<DataSource> paramList, List<DataType> paramList1)
  {
    this.zzFG = 3;
    this.zzZM = paramDataSet.zzk(paramList);
    this.zzYF = paramDataSet.zzlo();
    this.zzZJ = zzt.zza(paramDataSet.getDataSource(), paramList);
    this.zzZL = zzt.zza(paramDataSet.getDataType(), paramList1);
  }

  private boolean zza(RawDataSet paramRawDataSet)
  {
    return (this.zzZJ == paramRawDataSet.zzZJ) && (this.zzYF == paramRawDataSet.zzYF) && (zzw.equal(this.zzZM, paramRawDataSet.zzZM));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof RawDataSet)) && (zza((RawDataSet)paramObject)));
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(this.zzZJ);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(this.zzZJ);
    arrayOfObject[1] = this.zzZM;
    return String.format("RawDataSet{%s@[%s]}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzo.zza(this, paramParcel, paramInt);
  }
}