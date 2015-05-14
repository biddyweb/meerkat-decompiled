package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zznr;
import com.google.android.gms.internal.zznr.zza;
import java.util.List;

public class zzy
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzy> CREATOR = new zzz();
  private final int zzFG;
  private final String zzFO;
  private final zznr zzabm;
  private final List<zzh> zzabn;

  zzy(int paramInt, IBinder paramIBinder, String paramString, List<zzh> paramList)
  {
    this.zzFG = paramInt;
    this.zzabm = zznr.zza.zzaO(paramIBinder);
    this.zzabn = paramList;
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
    zzz.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzabm.asBinder();
  }

  public List<zzh> zzma()
  {
    return this.zzabn;
  }
}