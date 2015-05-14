package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@zzgi
public final class zzek
  implements SafeParcelable
{
  public static final zzej CREATOR = new zzej();
  public final String mimeType;
  public final String packageName;
  public final int versionCode;
  public final String zztQ;
  public final String zztR;
  public final String zztS;
  public final String zztT;
  public final String zztU;

  public zzek(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    this.versionCode = paramInt;
    this.zztQ = paramString1;
    this.zztR = paramString2;
    this.mimeType = paramString3;
    this.packageName = paramString4;
    this.zztS = paramString5;
    this.zztT = paramString6;
    this.zztU = paramString7;
  }

  public zzek(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    this(1, paramString1, paramString2, paramString3, paramString4, paramString5, paramString6, paramString7);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzej.zza(this, paramParcel, paramInt);
  }
}