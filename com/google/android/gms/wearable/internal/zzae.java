package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzae
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzae> CREATOR = new zzaf();
  public final int statusCode;
  public final int versionCode;
  public final zzao zzaGn;

  zzae(int paramInt1, int paramInt2, zzao paramzzao)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGn = paramzzao;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaf.zza(this, paramParcel, paramInt);
  }
}