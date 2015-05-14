package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.internal.zzni;
import com.google.android.gms.internal.zzni.zza;

public class zzl
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzl> CREATOR = new zzm();
  private final String mName;
  private final int zzFG;
  private final String zzFO;
  private final zzni zzabi;

  zzl(int paramInt, String paramString1, IBinder paramIBinder, String paramString2)
  {
    this.zzFG = paramInt;
    this.mName = paramString1;
    if (paramIBinder == null);
    for (zzni localzzni = null; ; localzzni = zzni.zza.zzaF(paramIBinder))
    {
      this.zzabi = localzzni;
      this.zzFO = paramString2;
      return;
    }
  }

  public zzl(String paramString1, zzni paramzzni, String paramString2)
  {
    this.zzFG = 2;
    this.mName = paramString1;
    this.zzabi = paramzzni;
    this.zzFO = paramString2;
  }

  private boolean zzb(zzl paramzzl)
  {
    return zzw.equal(this.mName, paramzzl.mName);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof zzl)) && (zzb((zzl)paramObject)));
  }

  public String getName()
  {
    return this.mName;
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
    arrayOfObject[0] = this.mName;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.mName).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    return this.zzabi.asBinder();
  }
}