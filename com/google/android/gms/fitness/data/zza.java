package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public final class zza
  implements SafeParcelable
{
  public static final Parcelable.Creator<zza> CREATOR = new zzb();
  public static final zza zzYv = new zza("com.google.android.gms", String.valueOf(7095000), null);
  private final int zzFG;
  private final String zzFO;
  private final String zzYw;
  private final String zzYx;

  zza(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    this.zzFG = paramInt;
    this.zzFO = ((String)zzx.zzl(paramString1));
    this.zzYw = "";
    this.zzYx = paramString3;
  }

  public zza(String paramString1, String paramString2, String paramString3)
  {
    this(1, paramString1, "", paramString3);
  }

  private boolean zza(zza paramzza)
  {
    return (this.zzFO.equals(paramzza.zzFO)) && (zzw.equal(this.zzYw, paramzza.zzYw)) && (zzw.equal(this.zzYx, paramzza.zzYx));
  }

  public static zza zzbI(String paramString)
  {
    return zzd(paramString, null, null);
  }

  public static zza zzd(String paramString1, String paramString2, String paramString3)
  {
    if ("com.google.android.gms".equals(paramString1))
      return zzYv;
    return new zza(paramString1, paramString2, paramString3);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof zza)) && (zza((zza)paramObject)));
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  public String getVersion()
  {
    return this.zzYw;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzFO;
    arrayOfObject[1] = this.zzYw;
    arrayOfObject[2] = this.zzYx;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzFO;
    arrayOfObject[1] = this.zzYw;
    arrayOfObject[2] = this.zzYx;
    return String.format("Application{%s:%s:%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public String zzlm()
  {
    return this.zzYx;
  }
}