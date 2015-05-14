package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzkw
  implements SafeParcelable
{
  public static final zzkx CREATOR = new zzkx();
  final int zzFG;
  public final String zzQH;
  public final int zzQI;

  public zzkw(int paramInt1, String paramString, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzQH = paramString;
    this.zzQI = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzkx.zza(this, paramParcel, paramInt);
  }
}