package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.Locale;

public class zzqh
  implements SafeParcelable
{
  public static final zzqi CREATOR = new zzqi();
  public static final zzqh zzapa = new zzqh("com.google.android.gms", Locale.getDefault(), null);
  public final int versionCode;
  public final String zzaob;
  public final String zzapb;
  public final String zzapc;
  public final String zzapd;
  public final String zzape;

  public zzqh(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    this.versionCode = paramInt;
    this.zzapb = paramString1;
    this.zzapc = paramString2;
    this.zzapd = paramString3;
    this.zzaob = paramString4;
    this.zzape = paramString5;
  }

  public zzqh(String paramString1, Locale paramLocale, String paramString2)
  {
    this(1, paramString1, paramLocale.toString(), paramString2, null, null);
  }

  public zzqh(String paramString1, Locale paramLocale, String paramString2, String paramString3, String paramString4)
  {
    this(1, paramString1, paramLocale.toString(), paramString2, paramString3, paramString4);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzqh localzzqh;
    do
    {
      return true;
      if ((paramObject == null) || (!(paramObject instanceof zzqh)))
        return false;
      localzzqh = (zzqh)paramObject;
    }
    while ((this.zzapc.equals(localzzqh.zzapc)) && (this.zzapb.equals(localzzqh.zzapb)) && (zzw.equal(this.zzapd, localzzqh.zzapd)) && (zzw.equal(this.zzaob, localzzqh.zzaob)) && (zzw.equal(this.zzape, localzzqh.zzape)));
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzapb;
    arrayOfObject[1] = this.zzapc;
    arrayOfObject[2] = this.zzapd;
    arrayOfObject[3] = this.zzaob;
    arrayOfObject[4] = this.zzape;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("clientPackageName", this.zzapb).zza("locale", this.zzapc).zza("accountName", this.zzapd).zza("gCoreClientName", this.zzaob).zza("chargedPackageName", this.zzape).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqi.zza(this, paramParcel, paramInt);
  }
}