package com.google.android.gms.maps.model.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzp
  implements SafeParcelable
{
  public static final zzq CREATOR = new zzq();
  private final int zzFG;
  private zza zzarR;

  public zzp()
  {
    this.zzFG = 1;
  }

  zzp(int paramInt, zza paramzza)
  {
    this.zzFG = paramInt;
    this.zzarR = paramzza;
  }

  public int describeContents()
  {
    return 0;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzq.zza(this, paramParcel, paramInt);
  }

  public zza zzqO()
  {
    return this.zzarR;
  }
}