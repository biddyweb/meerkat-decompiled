package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zzl
  implements SafeParcelable
{
  public static final zzm CREATOR = new zzm();
  private final int zzFG;
  int zzamw;
  int zzamx;
  long zzamy;

  public zzl(int paramInt1, int paramInt2, int paramInt3, long paramLong)
  {
    this.zzFG = paramInt1;
    this.zzamw = paramInt2;
    this.zzamx = paramInt3;
    this.zzamy = paramLong;
  }

  private String zzfp(int paramInt)
  {
    switch (paramInt)
    {
    case 1:
    default:
      return "STATUS_UNKNOWN";
    case 0:
      return "STATUS_SUCCESSFUL";
    case 2:
      return "STATUS_TIMED_OUT_ON_SCAN";
    case 3:
      return "STATUS_NO_INFO_IN_DATABASE";
    case 4:
      return "STATUS_INVALID_SCAN";
    case 5:
      return "STATUS_UNABLE_TO_QUERY_DATABASE";
    case 6:
      return "STATUS_SCANS_DISABLED_IN_SETTINGS";
    case 7:
      return "STATUS_LOCATION_DISABLED_IN_SETTINGS";
    case 8:
    }
    return "STATUS_IN_PROGRESS";
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzl));
    zzl localzzl;
    do
    {
      return false;
      localzzl = (zzl)paramObject;
    }
    while ((this.zzamw != localzzl.zzamw) || (this.zzamx != localzzl.zzamx) || (this.zzamy != localzzl.zzamy));
    return true;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzamw);
    arrayOfObject[1] = Integer.valueOf(this.zzamx);
    arrayOfObject[2] = Long.valueOf(this.zzamy);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("LocationStatus[cell status: ").append(zzfp(this.zzamw));
    localStringBuilder.append(", wifi status: ").append(zzfp(this.zzamx));
    localStringBuilder.append(", elapsed realtime ns: ").append(this.zzamy);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
}