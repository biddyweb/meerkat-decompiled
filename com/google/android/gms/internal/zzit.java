package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzit
  implements SafeParcelable
{
  public static final zziu CREATOR = new zziu();
  public final int id;
  final int zzFG;
  final Bundle zzFX;

  zzit(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    this.zzFG = paramInt1;
    this.id = paramInt2;
    this.zzFX = paramBundle;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zziu.zza(this, paramParcel, paramInt);
  }
}