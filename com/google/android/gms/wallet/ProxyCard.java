package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class ProxyCard
  implements SafeParcelable
{
  public static final Parcelable.Creator<ProxyCard> CREATOR = new zzp();
  private final int zzFG;
  String zzaEi;
  String zzaEj;
  int zzaEk;
  int zzaEl;

  ProxyCard(int paramInt1, String paramString1, String paramString2, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzaEi = paramString1;
    this.zzaEj = paramString2;
    this.zzaEk = paramInt2;
    this.zzaEl = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getCvn()
  {
    return this.zzaEj;
  }

  public int getExpirationMonth()
  {
    return this.zzaEk;
  }

  public int getExpirationYear()
  {
    return this.zzaEl;
  }

  public String getPan()
  {
    return this.zzaEi;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzp.zza(this, paramParcel, paramInt);
  }
}