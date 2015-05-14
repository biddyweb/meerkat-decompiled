package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.internal.zznq;
import com.google.android.gms.internal.zznq.zza;

public class zzw
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzw> CREATOR = new zzx();
  private final int zzFG;
  private final String zzFO;
  private final DataType zzYo;
  private final zznq zzabl;

  zzw(int paramInt, DataType paramDataType, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzYo = paramDataType;
    if (paramIBinder == null);
    for (zznq localzznq = null; ; localzznq = zznq.zza.zzaN(paramIBinder))
    {
      this.zzabl = localzznq;
      this.zzFO = paramString;
      return;
    }
  }

  public zzw(DataType paramDataType, zznq paramzznq, String paramString)
  {
    this.zzFG = 2;
    this.zzYo = paramDataType;
    this.zzabl = paramzznq;
    this.zzFO = paramString;
  }

  public int describeContents()
  {
    return 0;
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

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzx.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzabl == null)
      return null;
    return this.zzabl.asBinder();
  }
}