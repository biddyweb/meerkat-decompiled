package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzp
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzp> CREATOR = new zzq();
  private final int zzFG;
  private final String zzFO;
  private final zznv zzaaN;

  zzp(int paramInt, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzaaN = zznv.zza.zzaS(paramIBinder);
    this.zzFO = paramString;
  }

  public zzp(zznv paramzznv, String paramString)
  {
    this.zzFG = 1;
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

  public String toString()
  {
    return String.format("DisableFitRequest", new Object[0]);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzq.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzaaN.asBinder();
  }
}