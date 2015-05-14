package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zznv.zza;

public class zze
  implements SafeParcelable
{
  public static final Parcelable.Creator<zze> CREATOR = new zzf();
  private final int zzFG;
  private final String zzFO;
  private final DataSet zzZP;
  private final zznv zzaaN;
  private final boolean zzaaS;

  zze(int paramInt, DataSet paramDataSet, IBinder paramIBinder, String paramString, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzZP = paramDataSet;
    if (paramIBinder == null);
    for (zznv localzznv = null; ; localzznv = zznv.zza.zzaS(paramIBinder))
    {
      this.zzaaN = localzznv;
      this.zzFO = paramString;
      this.zzaaS = paramBoolean;
      return;
    }
  }

  public zze(DataSet paramDataSet, zznv paramzznv, String paramString, boolean paramBoolean)
  {
    this.zzFG = 3;
    this.zzZP = paramDataSet;
    this.zzaaN = paramzznv;
    this.zzFO = paramString;
    this.zzaaS = paramBoolean;
  }

  private boolean zzb(zze paramzze)
  {
    return zzw.equal(this.zzZP, paramzze.zzZP);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof zze)) && (zzb((zze)paramObject)));
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
    arrayOfObject[0] = this.zzZP;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("dataSet", this.zzZP).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public DataSet zzlH()
  {
    return this.zzZP;
  }

  public IBinder zzlQ()
  {
    if (this.zzaaN == null)
      return null;
    return this.zzaaN.asBinder();
  }

  public boolean zzlU()
  {
    return this.zzaaS;
  }
}