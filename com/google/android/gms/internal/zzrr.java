package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzrr
  implements SafeParcelable
{
  public static final zzrs CREATOR = new zzrs();
  final int versionCode;
  final int zzatf;
  final int zzatg;
  final int zzath;

  zzrr(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.versionCode = paramInt1;
    this.zzatf = paramInt2;
    this.zzatg = paramInt3;
    this.zzath = paramInt4;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzrs.zza(this, paramParcel, paramInt);
  }

  public static class zza
  {
    private int zzatf = 1;
    private int zzatg = 300;
    private int zzath = 0;

    public zzrr zzrp()
    {
      return new zzrr(1, this.zzatf, this.zzatg, this.zzath);
    }
  }
}