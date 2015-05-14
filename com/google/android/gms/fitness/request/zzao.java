package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzao
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzao> CREATOR = new zzap();
  private final PendingIntent mPendingIntent;
  private final int zzFG;
  private final String zzFO;
  private final zznv zzaaN;

  zzao(int paramInt, PendingIntent paramPendingIntent, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.mPendingIntent = paramPendingIntent;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public zzao(PendingIntent paramPendingIntent, zznv paramzznv, String paramString)
  {
    this.zzFG = 4;
    this.mPendingIntent = paramPendingIntent;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  private boolean zzb(zzao paramzzao)
  {
    return zzw.equal(this.mPendingIntent, paramzzao.mPendingIntent);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof zzao)) && (zzb((zzao)paramObject)));
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.mPendingIntent;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("pendingIntent", this.mPendingIntent).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzap.zza(this, paramParcel, paramInt);
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
}