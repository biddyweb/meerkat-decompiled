package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzvz
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzvz> CREATOR = new zzwa();
  private final int zzFG;
  String[] zzaEr;
  byte[][] zzaEs;

  zzvz()
  {
    this(1, new String[0], new byte[0][]);
  }

  zzvz(int paramInt, String[] paramArrayOfString, byte[][] paramArrayOfByte)
  {
    this.zzFG = paramInt;
    this.zzaEr = paramArrayOfString;
    this.zzaEs = paramArrayOfByte;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzwa.zza(this, paramParcel, paramInt);
  }
}