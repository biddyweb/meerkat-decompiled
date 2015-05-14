package com.google.android.gms.plus.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.Arrays;

public class zzh
  implements SafeParcelable
{
  public static final zzi CREATOR = new zzi();
  private final int zzFG;
  private final String zzHg;
  private final String[] zzauA;
  private final String[] zzauB;
  private final String[] zzauC;
  private final String zzauD;
  private final String zzauE;
  private final String zzauF;
  private final String zzauG;
  private final PlusCommonExtras zzauH;

  zzh(int paramInt, String paramString1, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3, String paramString2, String paramString3, String paramString4, String paramString5, PlusCommonExtras paramPlusCommonExtras)
  {
    this.zzFG = paramInt;
    this.zzHg = paramString1;
    this.zzauA = paramArrayOfString1;
    this.zzauB = paramArrayOfString2;
    this.zzauC = paramArrayOfString3;
    this.zzauD = paramString2;
    this.zzauE = paramString3;
    this.zzauF = paramString4;
    this.zzauG = paramString5;
    this.zzauH = paramPlusCommonExtras;
  }

  public zzh(String paramString1, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3, String paramString2, String paramString3, String paramString4, PlusCommonExtras paramPlusCommonExtras)
  {
    this.zzFG = 1;
    this.zzHg = paramString1;
    this.zzauA = paramArrayOfString1;
    this.zzauB = paramArrayOfString2;
    this.zzauC = paramArrayOfString3;
    this.zzauD = paramString2;
    this.zzauE = paramString3;
    this.zzauF = paramString4;
    this.zzauG = null;
    this.zzauH = paramPlusCommonExtras;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzh));
    zzh localzzh;
    do
    {
      return false;
      localzzh = (zzh)paramObject;
    }
    while ((this.zzFG != localzzh.zzFG) || (!zzw.equal(this.zzHg, localzzh.zzHg)) || (!Arrays.equals(this.zzauA, localzzh.zzauA)) || (!Arrays.equals(this.zzauB, localzzh.zzauB)) || (!Arrays.equals(this.zzauC, localzzh.zzauC)) || (!zzw.equal(this.zzauD, localzzh.zzauD)) || (!zzw.equal(this.zzauE, localzzh.zzauE)) || (!zzw.equal(this.zzauF, localzzh.zzauF)) || (!zzw.equal(this.zzauG, localzzh.zzauG)) || (!zzw.equal(this.zzauH, localzzh.zzauH)));
    return true;
  }

  public String getAccountName()
  {
    return this.zzHg;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[10];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = this.zzHg;
    arrayOfObject[2] = this.zzauA;
    arrayOfObject[3] = this.zzauB;
    arrayOfObject[4] = this.zzauC;
    arrayOfObject[5] = this.zzauD;
    arrayOfObject[6] = this.zzauE;
    arrayOfObject[7] = this.zzauF;
    arrayOfObject[8] = this.zzauG;
    arrayOfObject[9] = this.zzauH;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("versionCode", Integer.valueOf(this.zzFG)).zza("accountName", this.zzHg).zza("requestedScopes", this.zzauA).zza("visibleActivities", this.zzauB).zza("requiredFeatures", this.zzauC).zza("packageNameForAuth", this.zzauD).zza("callingPackageName", this.zzauE).zza("applicationName", this.zzauF).zza("extra", this.zzauH.toString()).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }

  public String[] zzrS()
  {
    return this.zzauA;
  }

  public String[] zzrT()
  {
    return this.zzauB;
  }

  public String[] zzrU()
  {
    return this.zzauC;
  }

  public String zzrV()
  {
    return this.zzauD;
  }

  public String zzrW()
  {
    return this.zzauE;
  }

  public String zzrX()
  {
    return this.zzauF;
  }

  public String zzrY()
  {
    return this.zzauG;
  }

  public PlusCommonExtras zzrZ()
  {
    return this.zzauH;
  }

  public Bundle zzsa()
  {
    Bundle localBundle = new Bundle();
    localBundle.setClassLoader(PlusCommonExtras.class.getClassLoader());
    this.zzauH.zzu(localBundle);
    return localBundle;
  }
}