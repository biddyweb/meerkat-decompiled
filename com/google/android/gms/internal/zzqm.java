package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.List;

public class zzqm
  implements SafeParcelable
{
  public static final zzqn CREATOR = new zzqn();
  final int zzFG;
  private final String zzapf;
  private final List<zza> zzapg;

  zzqm(int paramInt, String paramString, List<zza> paramList)
  {
    this.zzFG = paramInt;
    this.zzapf = paramString;
    this.zzapg = paramList;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzqm localzzqm;
    do
    {
      return true;
      if (!(paramObject instanceof zzqm))
        return false;
      localzzqm = (zzqm)paramObject;
    }
    while ((zzw.equal(this.zzapf, localzzqm.zzapf)) && (zzw.equal(this.zzapg, localzzqm.zzapg)));
    return false;
  }

  public List<zza> getActions()
  {
    return this.zzapg;
  }

  public String getData()
  {
    return this.zzapf;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzapf;
    arrayOfObject[1] = this.zzapg;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("data", this.zzapf).zza("actions", this.zzapg).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqn.zza(this, paramParcel, paramInt);
  }

  public static final class zza
    implements SafeParcelable
  {
    public static final zzql CREATOR = new zzql();
    final int zzFG;
    private final String zzFQ;
    private final String zzSy;

    zza(int paramInt, String paramString1, String paramString2)
    {
      this.zzFG = paramInt;
      this.zzSy = paramString1;
      this.zzFQ = paramString2;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      zza localzza;
      do
      {
        return true;
        if (!(paramObject instanceof zza))
          return false;
        localzza = (zza)paramObject;
      }
      while ((zzw.equal(this.zzSy, localzza.zzSy)) && (zzw.equal(this.zzFQ, localzza.zzFQ)));
      return false;
    }

    public String getTitle()
    {
      return this.zzSy;
    }

    public String getUri()
    {
      return this.zzFQ;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = this.zzSy;
      arrayOfObject[1] = this.zzFQ;
      return zzw.hashCode(arrayOfObject);
    }

    public String toString()
    {
      return zzw.zzk(this).zza("title", this.zzSy).zza("uri", this.zzFQ).toString();
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzql.zza(this, paramParcel, paramInt);
    }
  }
}