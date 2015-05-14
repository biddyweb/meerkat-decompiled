package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@zzgi
public final class zzhy
  implements SafeParcelable
{
  public static final zzhz CREATOR = new zzhz();
  public final int versionCode;
  public String zzzH;
  public int zzzI;
  public int zzzJ;
  public boolean zzzK;

  public zzhy(int paramInt1, int paramInt2, boolean paramBoolean)
  {
  }

  zzhy(int paramInt1, String paramString, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    this.versionCode = paramInt1;
    this.zzzH = paramString;
    this.zzzI = paramInt2;
    this.zzzJ = paramInt3;
    this.zzzK = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzhz.zza(this, paramParcel, paramInt);
  }
}