package com.google.android.gms.location;

import android.location.Location;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class zzh
  implements SafeParcelable
{
  public static final zzi CREATOR = new zzi();
  static final List<Location> zzamk = Collections.emptyList();
  private final int zzFG;
  List<Location> zzaml;

  zzh(int paramInt, List<Location> paramList)
  {
    this.zzFG = paramInt;
    this.zzaml = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzh))
      return false;
    zzh localzzh = (zzh)paramObject;
    if (localzzh.zzaml.size() != this.zzaml.size())
      return false;
    Iterator localIterator1 = localzzh.zzaml.iterator();
    Iterator localIterator2 = this.zzaml.iterator();
    while (localIterator1.hasNext())
    {
      Location localLocation1 = (Location)localIterator2.next();
      Location localLocation2 = (Location)localIterator1.next();
      if (localLocation1.getTime() != localLocation2.getTime())
        return false;
    }
    return true;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Iterator localIterator = this.zzaml.iterator();
    long l;
    for (int i = 17; localIterator.hasNext(); i = (int)(l ^ l >>> 32) + i * 31)
      l = ((Location)localIterator.next()).getTime();
    return i;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("LocationResult[success: ").append(zzpr());
    localStringBuilder.append(", locations: ").append(this.zzaml);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }

  public boolean zzpr()
  {
    return !this.zzaml.isEmpty();
  }
}