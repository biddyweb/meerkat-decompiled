package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zzox
  implements SafeParcelable
{
  public static final zzoy CREATOR = new zzoy();
  public final String packageName;
  public final int uid;
  private final int zzFG;

  zzox(int paramInt1, int paramInt2, String paramString)
  {
    this.zzFG = paramInt1;
    this.uid = paramInt2;
    this.packageName = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzox));
    zzox localzzox;
    do
    {
      return false;
      localzzox = (zzox)paramObject;
    }
    while ((localzzox.uid != this.uid) || (!zzw.equal(localzzox.packageName, this.packageName)));
    return true;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return this.uid;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(this.uid);
    arrayOfObject[1] = this.packageName;
    return String.format("%d:%s", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzoy.zza(this, paramParcel, paramInt);
  }
}