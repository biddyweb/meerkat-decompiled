package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzn
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzn> CREATOR = new zzo();
  String description;
  private final int zzFG;
  String zzatp;

  zzn()
  {
    this.zzFG = 1;
  }

  zzn(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzatp = paramString1;
    this.description = paramString2;
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
    zzo.zza(this, paramParcel, paramInt);
  }
}