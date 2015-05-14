package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class zzq
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzq> CREATOR = new zzr();
  final int zzFG;
  private final Session zzYs;
  private final DataSet zzZP;

  zzq(int paramInt, Session paramSession, DataSet paramDataSet)
  {
    this.zzFG = paramInt;
    this.zzYs = paramSession;
    this.zzZP = paramDataSet;
  }

  private boolean zza(zzq paramzzq)
  {
    return (zzw.equal(this.zzYs, paramzzq.zzYs)) && (zzw.equal(this.zzZP, paramzzq.zzZP));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof zzq)) && (zza((zzq)paramObject)));
  }

  public Session getSession()
  {
    return this.zzYs;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzYs;
    arrayOfObject[1] = this.zzZP;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("session", this.zzYs).zza("dataSet", this.zzZP).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzr.zza(this, paramParcel, paramInt);
  }

  public DataSet zzlH()
  {
    return this.zzZP;
  }
}