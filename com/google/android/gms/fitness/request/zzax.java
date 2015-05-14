package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzax
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzax> CREATOR = new zzay();
  private final int zzFG;
  private final String zzFO;
  private final DataType zzYo;
  private final DataSource zzYp;
  private final zznv zzaaN;

  zzax(int paramInt, DataType paramDataType, DataSource paramDataSource, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzYo = paramDataType;
    this.zzYp = paramDataSource;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public zzax(DataType paramDataType, DataSource paramDataSource, zznv paramzznv, String paramString)
  {
    this.zzFG = 2;
    this.zzYo = paramDataType;
    this.zzYp = paramDataSource;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  private boolean zzb(zzax paramzzax)
  {
    return (zzw.equal(this.zzYp, paramzzax.zzYp)) && (zzw.equal(this.zzYo, paramzzax.zzYo));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof zzax)) && (zzb((zzax)paramObject)));
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public DataType getDataType()
  {
    return this.zzYo;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = this.zzYo;
    return zzw.hashCode(arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzay.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }
}