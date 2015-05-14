package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public class zztj
  implements SafeParcelable
{
  public static final zztk CREATOR = new zztk();
  public final String packageName;
  public final int versionCode;
  public final int zzatW;
  public final int zzatX;
  public final String zzatY;
  public final String zzatZ;
  public final boolean zzaua;
  public final String zzaub;

  public zztj(int paramInt1, String paramString1, int paramInt2, int paramInt3, String paramString2, String paramString3, boolean paramBoolean, String paramString4)
  {
    this.versionCode = paramInt1;
    this.packageName = paramString1;
    this.zzatW = paramInt2;
    this.zzatX = paramInt3;
    this.zzatY = paramString2;
    this.zzatZ = paramString3;
    this.zzaua = paramBoolean;
    this.zzaub = paramString4;
  }

  @Deprecated
  public zztj(String paramString1, int paramInt1, int paramInt2, String paramString2, String paramString3, boolean paramBoolean)
  {
    this.versionCode = 1;
    this.packageName = ((String)zzx.zzl(paramString1));
    this.zzatW = paramInt1;
    this.zzatX = paramInt2;
    this.zzaub = null;
    this.zzatY = paramString2;
    this.zzatZ = paramString3;
    this.zzaua = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zztj localzztj;
    do
    {
      return true;
      if (!(paramObject instanceof zztj))
        break;
      localzztj = (zztj)paramObject;
    }
    while ((this.packageName.equals(localzztj.packageName)) && (this.zzatW == localzztj.zzatW) && (this.zzatX == localzztj.zzatX) && (zzw.equal(this.zzaub, localzztj.zzaub)) && (zzw.equal(this.zzatY, localzztj.zzatY)) && (zzw.equal(this.zzatZ, localzztj.zzatZ)) && (this.zzaua == localzztj.zzaua));
    return false;
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = this.packageName;
    arrayOfObject[1] = Integer.valueOf(this.zzatW);
    arrayOfObject[2] = Integer.valueOf(this.zzatX);
    arrayOfObject[3] = this.zzatY;
    arrayOfObject[4] = this.zzatZ;
    arrayOfObject[5] = Boolean.valueOf(this.zzaua);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("PlayLoggerContext[");
    localStringBuilder.append("package=").append(this.packageName).append(',');
    localStringBuilder.append("versionCode=").append(this.versionCode).append(',');
    localStringBuilder.append("logSource=").append(this.zzatX).append(',');
    localStringBuilder.append("logSourceName=").append(this.zzaub).append(',');
    localStringBuilder.append("uploadAccount=").append(this.zzatY).append(',');
    localStringBuilder.append("loggingId=").append(this.zzatZ).append(',');
    localStringBuilder.append("logAndroidId=").append(this.zzaua);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zztk.zza(this, paramParcel, paramInt);
  }
}