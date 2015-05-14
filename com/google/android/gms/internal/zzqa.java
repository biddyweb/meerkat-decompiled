package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.PlaceLikelihood;

public class zzqa
  implements SafeParcelable, PlaceLikelihood
{
  public static final Parcelable.Creator<zzqa> CREATOR = new zzqb();
  final int zzFG;
  final zzpy zzaoO;
  final float zzaoP;

  zzqa(int paramInt, zzpy paramzzpy, float paramFloat)
  {
    this.zzFG = paramInt;
    this.zzaoO = paramzzpy;
    this.zzaoP = paramFloat;
  }

  public static zzqa zza(zzpy paramzzpy, float paramFloat)
  {
    return new zzqa(0, (zzpy)zzx.zzl(paramzzpy), paramFloat);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzqa localzzqa;
    do
    {
      return true;
      if (!(paramObject instanceof zzqa))
        return false;
      localzzqa = (zzqa)paramObject;
    }
    while ((this.zzaoO.equals(localzzqa.zzaoO)) && (this.zzaoP == localzzqa.zzaoP));
    return false;
  }

  public float getLikelihood()
  {
    return this.zzaoP;
  }

  public Place getPlace()
  {
    return this.zzaoO;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzaoO;
    arrayOfObject[1] = Float.valueOf(this.zzaoP);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("place", this.zzaoO).zza("likelihood", Float.valueOf(this.zzaoP)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqb.zza(this, paramParcel, paramInt);
  }

  public PlaceLikelihood zzpX()
  {
    return this;
  }
}