package com.google.android.gms.plus.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class PlusCommonExtras
  implements SafeParcelable
{
  public static final zzf CREATOR = new zzf();
  public static String TAG = "PlusCommonExtras";
  private final int zzFG;
  private String zzaux;
  private String zzauy;

  public PlusCommonExtras()
  {
    this.zzFG = 1;
    this.zzaux = "";
    this.zzauy = "";
  }

  PlusCommonExtras(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzaux = paramString1;
    this.zzauy = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof PlusCommonExtras));
    PlusCommonExtras localPlusCommonExtras;
    do
    {
      return false;
      localPlusCommonExtras = (PlusCommonExtras)paramObject;
    }
    while ((this.zzFG != localPlusCommonExtras.zzFG) || (!zzw.equal(this.zzaux, localPlusCommonExtras.zzaux)) || (!zzw.equal(this.zzauy, localPlusCommonExtras.zzauy)));
    return true;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = this.zzaux;
    arrayOfObject[2] = this.zzauy;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("versionCode", Integer.valueOf(this.zzFG)).zza("Gpsrc", this.zzaux).zza("ClientCallingPackage", this.zzauy).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public String zzrQ()
  {
    return this.zzaux;
  }

  public String zzrR()
  {
    return this.zzauy;
  }

  public void zzu(Bundle paramBundle)
  {
    paramBundle.putByteArray("android.gms.plus.internal.PlusCommonExtras.extraPlusCommon", zzc.zza(this));
  }
}