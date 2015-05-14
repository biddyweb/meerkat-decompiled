package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzav
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzav> CREATOR = new zzaw();
  private final int zzFG;
  private final String zzFO;
  private final String zzaaL;
  private final zznv zzaaN;

  zzav(int paramInt, String paramString1, IBinder paramIBinder, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzaaL = paramString1;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString2;
      return;
    }
  }

  public zzav(String paramString1, zznv paramzznv, String paramString2)
  {
    this.zzFG = 4;
    this.zzaaL = paramString1;
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
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzaaL;
    return String.format("UnclaimBleDeviceRequest{%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaw.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }
}