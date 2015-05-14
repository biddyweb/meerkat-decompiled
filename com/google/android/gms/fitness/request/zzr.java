package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zznw;
import com.google.android.gms.internal.zznw.zza;

public class zzr
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzr> CREATOR = new zzs();
  private final int zzFG;
  private final String zzFO;
  private final zznw zzabj;

  zzr(int paramInt, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabj = zznw.zza.zzaT(paramIBinder);
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
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = this.zzabj;
    arrayOfObject[2] = this.zzFO;
    return String.format("GetSyncInfoRequest {%d, %s, %s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzs.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzabj.asBinder();
  }
}