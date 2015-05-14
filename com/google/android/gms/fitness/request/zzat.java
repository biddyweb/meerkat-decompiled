package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.Subscription;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zzat
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzat> CREATOR = new zzau();
  private final int zzFG;
  private final String zzFO;
  private final zznv zzaaN;
  private final Subscription zzabJ;
  private final boolean zzabK;

  zzat(int paramInt, Subscription paramSubscription, boolean paramBoolean, IBinder paramIBinder, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabJ = paramSubscription;
    this.zzabK = paramBoolean;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      return;
    }
  }

  public zzat(Subscription paramSubscription, boolean paramBoolean, zznv paramzznv, String paramString)
  {
    this.zzFG = 2;
    this.zzabJ = paramSubscription;
    this.zzabK = paramBoolean;
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
    return zzw.zzk(this).zza("subscription", this.zzabJ).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzau.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public Subscription zzml()
  {
    return this.zzabJ;
  }

  public boolean zzmm()
  {
    return this.zzabK;
  }
}