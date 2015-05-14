package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@zzgi
public final class zzx
  implements SafeParcelable
{
  public static final zzy CREATOR = new zzy();
  public final int versionCode;
  public final boolean zzml;
  public final boolean zzmy;

  zzx(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.versionCode = paramInt;
    this.zzml = paramBoolean1;
    this.zzmy = paramBoolean2;
  }

  public zzx(boolean paramBoolean1, boolean paramBoolean2)
  {
    this.versionCode = 1;
    this.zzml = paramBoolean1;
    this.zzmy = paramBoolean2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzy.zza(this, paramParcel, paramInt);
  }
}