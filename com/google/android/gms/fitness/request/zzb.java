package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.BleDevice;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzb
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzb> CREATOR = new zzc();
  private final int zzFG;
  private final String zzFO;
  private final String zzaaL;
  private final BleDevice zzaaM;
  private final zznv zzaaN;

  zzb(int paramInt, String paramString1, BleDevice paramBleDevice, IBinder paramIBinder, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzaaL = paramString1;
    this.zzaaM = paramBleDevice;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString2;
      return;
    }
  }

  public zzb(String paramString1, BleDevice paramBleDevice, zznv paramzznv, String paramString2)
  {
    this.zzFG = 3;
    this.zzaaL = paramString1;
    this.zzaaM = paramBleDevice;
    this.zzaaN = paramzznv;
    this.zzFO = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getDeviceAddress()
  {
    return this.zzaaL;
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
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzaaL;
    arrayOfObject[1] = this.zzaaM;
    return String.format("ClaimBleDeviceRequest{%s %s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public BleDevice zzlP()
  {
    return this.zzaaM;
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }
}