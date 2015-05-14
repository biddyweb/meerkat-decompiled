package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class zzc
  implements SafeParcelable
{
  public static final zzd CREATOR = new zzd();
  private final int zzFG;
  private final int zzalN;
  private final int zzanA;
  private final PlaceFilter zzanB;

  zzc(int paramInt1, int paramInt2, int paramInt3, PlaceFilter paramPlaceFilter)
  {
    this.zzFG = paramInt1;
    this.zzalN = paramInt2;
    this.zzanA = paramInt3;
    this.zzanB = paramPlaceFilter;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzc localzzc;
    do
    {
      return true;
      if (!(paramObject instanceof zzc))
        return false;
      localzzc = (zzc)paramObject;
    }
    while ((this.zzalN == localzzc.zzalN) && (this.zzanA == localzzc.zzanA) && (this.zzanB.equals(localzzc.zzanB)));
    return false;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(this.zzalN);
    arrayOfObject[1] = Integer.valueOf(this.zzanA);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("transitionTypes", Integer.valueOf(this.zzalN)).zza("loiteringTimeMillis", Integer.valueOf(this.zzanA)).zza("placeFilter", this.zzanB).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }

  public int zzpD()
  {
    return this.zzalN;
  }

  public int zzpG()
  {
    return this.zzanA;
  }

  public PlaceFilter zzpH()
  {
    return this.zzanB;
  }
}