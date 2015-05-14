package com.google.android.gms.maps.model.internal;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zza
  implements SafeParcelable
{
  public static final zzb CREATOR = new zzb();
  private final int zzFG;
  private byte zzarN;
  private Bundle zzarO;
  private Bitmap zzarP;

  zza(int paramInt, byte paramByte, Bundle paramBundle, Bitmap paramBitmap)
  {
    this.zzFG = paramInt;
    this.zzarN = paramByte;
    this.zzarO = paramBundle;
    this.zzarP = paramBitmap;
  }

  public int describeContents()
  {
    return 0;
  }

  public Bitmap getBitmap()
  {
    return this.zzarP;
  }

  public byte getType()
  {
    return this.zzarN;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public Bundle zzqL()
  {
    return this.zzarO;
  }
}