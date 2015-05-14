package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzaa
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaa> CREATOR = new zzab();
  final int zzFG;
  private boolean zzMT;
  private ConnectionResult zzNB;
  IBinder zzPn;
  private boolean zzQt;

  public zzaa(int paramInt)
  {
    this(new ConnectionResult(paramInt, null));
  }

  zzaa(int paramInt, IBinder paramIBinder, ConnectionResult paramConnectionResult, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.zzFG = paramInt;
    this.zzPn = paramIBinder;
    this.zzNB = paramConnectionResult;
    this.zzMT = paramBoolean1;
    this.zzQt = paramBoolean2;
  }

  public zzaa(ConnectionResult paramConnectionResult)
  {
    this(1, null, paramConnectionResult, false, false);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzaa localzzaa;
    do
    {
      return true;
      if (!(paramObject instanceof zzaa))
        return false;
      localzzaa = (zzaa)paramObject;
    }
    while ((this.zzNB.equals(localzzaa.zzNB)) && (zzjn().equals(localzzaa.zzjn())));
    return false;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzab.zza(this, paramParcel, paramInt);
  }

  public zzq zzjn()
  {
    return zzq.zza.zzR(this.zzPn);
  }

  public ConnectionResult zzjo()
  {
    return this.zzNB;
  }

  public boolean zzjp()
  {
    return this.zzMT;
  }

  public boolean zzjq()
  {
    return this.zzQt;
  }
}