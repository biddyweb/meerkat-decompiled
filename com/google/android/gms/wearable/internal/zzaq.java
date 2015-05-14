package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzaq
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaq> CREATOR = new zzar();
  public final String label;
  public final String packageName;
  public final int versionCode;
  public final long zzaGC;

  zzaq(int paramInt, String paramString1, String paramString2, long paramLong)
  {
    this.versionCode = paramInt;
    this.packageName = paramString1;
    this.label = paramString2;
    this.zzaGC = paramLong;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzar.zza(this, paramParcel, paramInt);
  }
}