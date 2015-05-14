package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.List;

@Deprecated
public final class zzqd
  implements SafeParcelable
{
  public static final zzqe CREATOR = new zzqe();
  public final String name;
  public final int versionCode;
  public final String zzaoQ;
  public final String zzaoR;
  public final String zzaoS;
  public final List<String> zzaoT;

  public zzqd(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, List<String> paramList)
  {
    this.versionCode = paramInt;
    this.name = paramString1;
    this.zzaoQ = paramString2;
    this.zzaoR = paramString3;
    this.zzaoS = paramString4;
    this.zzaoT = paramList;
  }

  public static zzqd zza(String paramString1, String paramString2, String paramString3, String paramString4, List<String> paramList)
  {
    return new zzqd(0, paramString1, paramString2, paramString3, paramString4, paramList);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzqd localzzqd;
    do
    {
      return true;
      if (!(paramObject instanceof zzqd))
        return false;
      localzzqd = (zzqd)paramObject;
    }
    while ((zzw.equal(this.name, localzzqd.name)) && (zzw.equal(this.zzaoQ, localzzqd.zzaoQ)) && (zzw.equal(this.zzaoR, localzzqd.zzaoR)) && (zzw.equal(this.zzaoS, localzzqd.zzaoS)) && (zzw.equal(this.zzaoT, localzzqd.zzaoT)));
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.name;
    arrayOfObject[1] = this.zzaoQ;
    arrayOfObject[2] = this.zzaoR;
    arrayOfObject[3] = this.zzaoS;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.name).zza("address", this.zzaoQ).zza("internationalPhoneNumber", this.zzaoR).zza("regularOpenHours", this.zzaoS).zza("attributions", this.zzaoT).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqe.zza(this, paramParcel, paramInt);
  }
}