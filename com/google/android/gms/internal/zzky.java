package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzky
  implements SafeParcelable
{
  public static final zzkz CREATOR = new zzkz();
  private final int zzFG;
  private final zzla zzQJ;

  zzky(int paramInt, zzla paramzzla)
  {
    this.zzFG = paramInt;
    this.zzQJ = paramzzla;
  }

  private zzky(zzla paramzzla)
  {
    this.zzFG = 1;
    this.zzQJ = paramzzla;
  }

  public static zzky zza(zzld.zzb<?, ?> paramzzb)
  {
    if ((paramzzb instanceof zzla))
      return new zzky((zzla)paramzzb);
    throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
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
    zzkz.zza(this, paramParcel, paramInt);
  }

  zzla zzju()
  {
    return this.zzQJ;
  }

  public zzld.zzb<?, ?> zzjv()
  {
    if (this.zzQJ != null)
      return this.zzQJ;
    throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
  }
}