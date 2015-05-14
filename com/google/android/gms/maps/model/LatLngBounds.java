package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.internal.zzaa;

public final class LatLngBounds
  implements SafeParcelable
{
  public static final zzg CREATOR = new zzg();
  public final LatLng northeast;
  public final LatLng southwest;
  private final int zzFG;

  LatLngBounds(int paramInt, LatLng paramLatLng1, LatLng paramLatLng2)
  {
    zzx.zzb(paramLatLng1, "null southwest");
    zzx.zzb(paramLatLng2, "null northeast");
    if (paramLatLng2.latitude >= paramLatLng1.latitude);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Double.valueOf(paramLatLng1.latitude);
      arrayOfObject[1] = Double.valueOf(paramLatLng2.latitude);
      zzx.zzb(bool, "southern latitude exceeds northern latitude (%s > %s)", arrayOfObject);
      this.zzFG = paramInt;
      this.southwest = paramLatLng1;
      this.northeast = paramLatLng2;
      return;
    }
  }

  public LatLngBounds(LatLng paramLatLng1, LatLng paramLatLng2)
  {
    this(1, paramLatLng1, paramLatLng2);
  }

  public static Builder builder()
  {
    return new Builder();
  }

  private static double zzb(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble1 - paramDouble2)) % 360.0D;
  }

  private static double zzc(double paramDouble1, double paramDouble2)
  {
    return (360.0D + (paramDouble2 - paramDouble1)) % 360.0D;
  }

  private boolean zzc(double paramDouble)
  {
    return (this.southwest.latitude <= paramDouble) && (paramDouble <= this.northeast.latitude);
  }

  private boolean zzd(double paramDouble)
  {
    if (this.southwest.longitude <= this.northeast.longitude)
      return (this.southwest.longitude <= paramDouble) && (paramDouble <= this.northeast.longitude);
    boolean bool1;
    if (this.southwest.longitude > paramDouble)
    {
      boolean bool2 = paramDouble < this.northeast.longitude;
      bool1 = false;
      if (bool2);
    }
    else
    {
      bool1 = true;
    }
    return bool1;
  }

  public boolean contains(LatLng paramLatLng)
  {
    return (zzc(paramLatLng.latitude)) && (zzd(paramLatLng.longitude));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    LatLngBounds localLatLngBounds;
    do
    {
      return true;
      if (!(paramObject instanceof LatLngBounds))
        return false;
      localLatLngBounds = (LatLngBounds)paramObject;
    }
    while ((this.southwest.equals(localLatLngBounds.southwest)) && (this.northeast.equals(localLatLngBounds.northeast)));
    return false;
  }

  public LatLng getCenter()
  {
    double d1 = (this.southwest.latitude + this.northeast.latitude) / 2.0D;
    double d2 = this.northeast.longitude;
    double d3 = this.southwest.longitude;
    if (d3 <= d2);
    for (double d4 = (d2 + d3) / 2.0D; ; d4 = (d3 + (d2 + 360.0D)) / 2.0D)
      return new LatLng(d1, d4);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.southwest;
    arrayOfObject[1] = this.northeast;
    return zzw.hashCode(arrayOfObject);
  }

  public LatLngBounds including(LatLng paramLatLng)
  {
    double d1 = Math.min(this.southwest.latitude, paramLatLng.latitude);
    double d2 = Math.max(this.northeast.latitude, paramLatLng.latitude);
    double d3 = this.northeast.longitude;
    double d4 = this.southwest.longitude;
    double d5 = paramLatLng.longitude;
    double d6;
    if (!zzd(d5))
      if (zzb(d4, d5) < zzc(d3, d5))
        d6 = d3;
    while (true)
    {
      return new LatLngBounds(new LatLng(d1, d5), new LatLng(d2, d6));
      d6 = d5;
      d5 = d4;
      continue;
      d5 = d4;
      d6 = d3;
    }
  }

  public String toString()
  {
    return zzw.zzk(this).zza("southwest", this.southwest).zza("northeast", this.northeast).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzh.zza(this, paramParcel, paramInt);
      return;
    }
    zzg.zza(this, paramParcel, paramInt);
  }

  public static final class Builder
  {
    private double zzaro = (1.0D / 0.0D);
    private double zzarp = (-1.0D / 0.0D);
    private double zzarq = (0.0D / 0.0D);
    private double zzarr = (0.0D / 0.0D);

    private boolean zzd(double paramDouble)
    {
      if (this.zzarq <= this.zzarr)
        return (this.zzarq <= paramDouble) && (paramDouble <= this.zzarr);
      boolean bool1;
      if (this.zzarq > paramDouble)
      {
        boolean bool2 = paramDouble < this.zzarr;
        bool1 = false;
        if (bool2);
      }
      else
      {
        bool1 = true;
      }
      return bool1;
    }

    public LatLngBounds build()
    {
      if (!Double.isNaN(this.zzarq));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "no included points");
        return new LatLngBounds(new LatLng(this.zzaro, this.zzarq), new LatLng(this.zzarp, this.zzarr));
      }
    }

    public Builder include(LatLng paramLatLng)
    {
      this.zzaro = Math.min(this.zzaro, paramLatLng.latitude);
      this.zzarp = Math.max(this.zzarp, paramLatLng.latitude);
      double d = paramLatLng.longitude;
      if (Double.isNaN(this.zzarq))
      {
        this.zzarq = d;
        this.zzarr = d;
      }
      while (zzd(d))
        return this;
      if (LatLngBounds.zzd(this.zzarq, d) < LatLngBounds.zze(this.zzarr, d))
      {
        this.zzarq = d;
        return this;
      }
      this.zzarr = d;
      return this;
    }
  }
}