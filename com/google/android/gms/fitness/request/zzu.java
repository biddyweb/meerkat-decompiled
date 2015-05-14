package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzoj;
import com.google.android.gms.internal.zzoj.zza;

public class zzu
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzu> CREATOR = new zzv();
  private final int zzFG;
  private final String zzFO;
  private final zzoj zzabk;

  zzu(int paramInt, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabk = zzoj.zza.zzaU(paramIBinder);
    this.zzFO = paramString;
  }

  public zzu(zzoj paramzzoj, String paramString)
  {
    this.zzFG = 1;
    this.zzabk = paramzzoj;
    this.zzFO = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    return String.format("ListClaimedBleDevicesRequest", new Object[0]);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzv.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzabk.asBinder();
  }
}