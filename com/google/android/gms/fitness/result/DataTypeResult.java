package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.DataType;

public class DataTypeResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<DataTypeResult> CREATOR = new zzh();
  private final int zzFG;
  private final Status zzHb;
  private final DataType zzYo;

  DataTypeResult(int paramInt, Status paramStatus, DataType paramDataType)
  {
    this.zzFG = paramInt;
    this.zzHb = paramStatus;
    this.zzYo = paramDataType;
  }

  public DataTypeResult(Status paramStatus, DataType paramDataType)
  {
    this.zzFG = 2;
    this.zzHb = paramStatus;
    this.zzYo = paramDataType;
  }

  public static DataTypeResult zzD(Status paramStatus)
  {
    return new DataTypeResult(paramStatus, null);
  }

  private boolean zzb(DataTypeResult paramDataTypeResult)
  {
    return (this.zzHb.equals(paramDataTypeResult.zzHb)) && (zzw.equal(this.zzYo, paramDataTypeResult.zzYo));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataTypeResult)) && (zzb((DataTypeResult)paramObject)));
  }

  public DataType getDataType()
  {
    return this.zzYo;
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
    arrayOfObject[1] = this.zzYo;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("dataType", this.zzYo).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }
}