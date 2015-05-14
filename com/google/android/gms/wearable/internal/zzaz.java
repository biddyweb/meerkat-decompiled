package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class zzaz
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzaz> CREATOR = new zzba();
  public final int statusCode;
  public final int versionCode;
  public final long zzaGC;
  public final List<zzaq> zzaGE;

  zzaz(int paramInt1, int paramInt2, long paramLong, List<zzaq> paramList)
  {
    this.versionCode = paramInt1;
    this.statusCode = paramInt2;
    this.zzaGC = paramLong;
    this.zzaGE = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzba.zza(this, paramParcel, paramInt);
  }
}