package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.zzx;

public abstract class zzk
  implements Parcelable
{
  private volatile transient boolean zzSN = false;

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!zzkz());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzN(bool);
      this.zzSN = true;
      zzI(paramParcel, paramInt);
      return;
    }
  }

  protected abstract void zzI(Parcel paramParcel, int paramInt);

  public final boolean zzkz()
  {
    return this.zzSN;
  }
}