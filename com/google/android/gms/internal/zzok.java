package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.DataType;
import java.util.Collections;
import java.util.List;

public class zzok
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzok> CREATOR = new zzol();
  private final int zzFG;
  private final List<DataType> zzYA;

  zzok(int paramInt, List<DataType> paramList)
  {
    this.zzFG = paramInt;
    this.zzYA = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public List<DataType> getDataTypes()
  {
    return Collections.unmodifiableList(this.zzYA);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("dataTypes", this.zzYA).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzol.zza(this, paramParcel, paramInt);
  }
}