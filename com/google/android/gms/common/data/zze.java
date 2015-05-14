package com.google.android.gms.common.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zze<T extends SafeParcelable> extends AbstractDataBuffer<T>
{
  private static final String[] zzNS = { "data" };
  private final Parcelable.Creator<T> zzNT;

  public zze(DataHolder paramDataHolder, Parcelable.Creator<T> paramCreator)
  {
    super(paramDataHolder);
    this.zzNT = paramCreator;
  }

  public T zzaw(int paramInt)
  {
    byte[] arrayOfByte = this.zzMd.zzf("data", paramInt, this.zzMd.zzax(paramInt));
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(arrayOfByte, 0, arrayOfByte.length);
    localParcel.setDataPosition(0);
    SafeParcelable localSafeParcelable = (SafeParcelable)this.zzNT.createFromParcel(localParcel);
    localParcel.recycle();
    return localSafeParcelable;
  }
}