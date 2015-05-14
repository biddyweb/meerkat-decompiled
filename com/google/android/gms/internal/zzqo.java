package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class zzqo
  implements SafeParcelable
{
  public static final zzqp CREATOR = new zzqp();
  public static final zzqo zzaph = new zzqo(0, "Home");
  public static final zzqo zzapi = new zzqo(0, "Work");
  final int zzFG;
  private final String zzapj;

  zzqo(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzapj = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof zzqo))
      return false;
    zzqo localzzqo = (zzqo)paramObject;
    return zzw.equal(this.zzapj, localzzqo.zzapj);
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.zzapj;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("alias", this.zzapj).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqp.zza(this, paramParcel, paramInt);
  }

  public String zzpY()
  {
    return this.zzapj;
  }
}