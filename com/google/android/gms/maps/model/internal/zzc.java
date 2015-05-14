package com.google.android.gms.maps.model.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzc
  implements SafeParcelable
{
  public static final zzd CREATOR = new zzd();
  private int type;
  private final int zzFG;
  private Bundle zzarO;

  zzc(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    this.zzFG = paramInt1;
    this.type = paramInt2;
    this.zzarO = paramBundle;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getType()
  {
    return this.type;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }

  public Bundle zzqL()
  {
    return this.zzarO;
  }
}