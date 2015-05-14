package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zza
  implements SafeParcelable
{
  public static final Parcelable.Creator<zza> CREATOR = new zzb();
  public final int zzFG;
  private String zzawF;

  zza(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzawF = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getJwsResult()
  {
    return this.zzawF;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}