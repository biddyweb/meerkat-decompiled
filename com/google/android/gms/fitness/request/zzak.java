package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzak
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzak> CREATOR = new zzal();
  private final int zzFG;
  private final String zzFO;
  private final Session zzYs;
  private final zznv zzaaN;

  zzak(int paramInt, Session paramSession, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzYs = paramSession;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public zzak(Session paramSession, zznv paramzznv, String paramString)
  {
    zzx.zzb(paramSession.isOngoing(), "Cannot start a session which has already ended");
    this.zzFG = 2;
    this.zzYs = paramSession;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
  }

  private boolean zzb(zzak paramzzak)
  {
    return zzw.equal(this.zzYs, paramzzak.zzYs);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof zzak)) && (zzb((zzak)paramObject)));
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public Session getSession()
  {
    return this.zzYs;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzYs;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("session", this.zzYs).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzal.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }
}