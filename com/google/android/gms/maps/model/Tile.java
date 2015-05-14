package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;

public final class Tile
  implements SafeParcelable
{
  public static final zzu CREATOR = new zzu();
  public final byte[] data;
  public final int height;
  public final int width;
  private final int zzFG;

  Tile(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte)
  {
    this.zzFG = paramInt1;
    this.width = paramInt2;
    this.height = paramInt3;
    this.data = paramArrayOfByte;
  }

  public Tile(int paramInt1, int paramInt2, byte[] paramArrayOfByte)
  {
    this(1, paramInt1, paramInt2, paramArrayOfByte);
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
    if (zzaa.zzqF())
    {
      zzv.zza(this, paramParcel, paramInt);
      return;
    }
    zzu.zza(this, paramParcel, paramInt);
  }
}