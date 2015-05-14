package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.internal.zznu;
import com.google.android.gms.internal.zznu.zza;

public class zzam
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzam> CREATOR = new zzan();
  private final String mName;
  private final int zzFG;
  private final String zzFO;
  private final String zzZN;
  private final zznu zzabG;

  zzam(int paramInt, String paramString1, String paramString2, IBinder paramIBinder, String paramString3)
  {
    this.zzFG = paramInt;
    this.mName = paramString1;
    this.zzZN = paramString2;
    if (paramIBinder == null);
    for (zznu localzznu = null; ; localzznu = zznu.zza.zzaR(paramIBinder))
    {
      this.zzabG = localzznu;
      this.zzFO = paramString3;
      return;
    }
  }

  public zzam(String paramString1, String paramString2, zznu paramzznu, String paramString3)
  {
    this.zzFG = 2;
    this.mName = paramString1;
    this.zzZN = paramString2;
    this.zzabG = paramzznu;
    this.zzFO = paramString3;
  }

  private boolean zzb(zzam paramzzam)
  {
    return (zzw.equal(this.mName, paramzzam.mName)) && (zzw.equal(this.zzZN, paramzzam.zzZN));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof zzam)) && (zzb((zzam)paramObject)));
  }

  public String getIdentifier()
  {
    return this.zzZN;
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
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.mName;
    arrayOfObject[1] = this.zzZN;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.mName).zza("identifier", this.zzZN).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzan.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzabG == null)
      return null;
    return this.zzabG.asBinder();
  }
}