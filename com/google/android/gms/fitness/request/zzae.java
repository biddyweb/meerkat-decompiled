package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.fitness.data.zzk;
import com.google.android.gms.fitness.data.zzk.zza;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzae
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzae> CREATOR = new zzaf();
  private final PendingIntent mPendingIntent;
  private final int zzFG;
  private final String zzFO;
  private final zznv zzaaN;
  private final zzk zzabp;

  zzae(int paramInt, IBinder paramIBinder1, PendingIntent paramPendingIntent, IBinder paramIBinder2, String paramString)
  {
    this.zzFG = paramInt;
    if (paramIBinder1 == null);
    for (zzk localzzk = null; ; localzzk = zzk.zza.zzav(paramIBinder1))
    {
      this.zzabp = localzzk;
      this.mPendingIntent = paramPendingIntent;
      this.zzaaN = zznv.zza.zzaS(paramIBinder2);
      this.zzFO = paramString;
      return;
    }
  }

  public zzae(zzk paramzzk, PendingIntent paramPendingIntent, zznv paramzznv, String paramString)
  {
    this.zzFG = 3;
    this.zzabp = paramzzk;
    this.mPendingIntent = paramPendingIntent;
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
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzabp;
    return String.format("SensorUnregistrationRequest{%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaf.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public PendingIntent zzmb()
  {
    return this.mPendingIntent;
  }

  IBinder zzmg()
  {
    if (this.zzabp == null)
      return null;
    return this.zzabp.asBinder();
  }
}