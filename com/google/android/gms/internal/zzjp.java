package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zzjp
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzjp> CREATOR = new zzjq();
  private final int zzFG;
  private String zzJZ;

  public zzjp()
  {
    this(1, null);
  }

  zzjp(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzJZ = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this)
      return true;
    if (!(paramObject instanceof zzjp))
      return false;
    zzjp localzzjp = (zzjp)paramObject;
    return zzjv.zza(this.zzJZ, localzzjp.zzJZ);
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzJZ;
    return zzw.hashCode(arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzjq.zza(this, paramParcel, paramInt);
  }

  public String zzhl()
  {
    return this.zzJZ;
  }
}