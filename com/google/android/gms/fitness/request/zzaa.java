package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzns;
import com.google.android.gms.internal.zzns.zza;

public class zzaa
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaa> CREATOR = new zzab();
  private final int zzFG;
  private final String zzFO;
  private final zzns zzabo;

  zzaa(int paramInt, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabo = zzns.zza.zzaP(paramIBinder);
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
    return String.format("ReadStatsRequest", new Object[0]);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzab.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzabo.asBinder();
  }
}