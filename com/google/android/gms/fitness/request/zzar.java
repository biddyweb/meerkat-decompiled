package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzar
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzar> CREATOR = new zzas();
  private final int zzFG;
  private final String zzFO;
  private final zznv zzaaN;
  private final zzt zzabH;

  zzar(int paramInt, IBinder paramIBinder1, IBinder paramIBinder2, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabH = zzt.zza.zzaV(paramIBinder1);
    if (paramIBinder2 == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder2))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public zzar(BleScanCallback paramBleScanCallback, zznv paramzznv, String paramString)
  {
    this(zza.zza.zzlO().zzb(paramBleScanCallback), paramzznv, paramString);
  }

  public zzar(zzt paramzzt, zznv paramzznv, String paramString)
  {
    this.zzFG = 2;
    this.zzabH = paramzzt;
    this.zzaaN = paramzznv;
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

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzas.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public IBinder zzmk()
  {
    return this.zzabH.asBinder();
  }
}