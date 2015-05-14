package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.DataSource;

public class zzom
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzom> CREATOR = new zzon();
  private final int zzFG;
  private final DataSource zzYp;

  zzom(int paramInt, DataSource paramDataSource)
  {
    this.zzFG = paramInt;
    this.zzYp = paramDataSource;
  }

  public int describeContents()
  {
    return 0;
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzYp;
    return String.format("ApplicationUnregistrationRequest{%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzon.zza(this, paramParcel, paramInt);
  }
}