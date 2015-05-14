package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public class StreetViewPanoramaLocation
  implements SafeParcelable
{
  public static final zzs CREATOR = new zzs();
  public final StreetViewPanoramaLink[] links;
  public final String panoId;
  public final LatLng position;
  private final int zzFG;

  StreetViewPanoramaLocation(int paramInt, StreetViewPanoramaLink[] paramArrayOfStreetViewPanoramaLink, LatLng paramLatLng, String paramString)
  {
    this.zzFG = paramInt;
    this.links = paramArrayOfStreetViewPanoramaLink;
    this.position = paramLatLng;
    this.panoId = paramString;
  }

  public StreetViewPanoramaLocation(StreetViewPanoramaLink[] paramArrayOfStreetViewPanoramaLink, LatLng paramLatLng, String paramString)
  {
    this(1, paramArrayOfStreetViewPanoramaLink, paramLatLng, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    StreetViewPanoramaLocation localStreetViewPanoramaLocation;
    do
    {
      return true;
      if (!(paramObject instanceof StreetViewPanoramaLocation))
        return false;
      localStreetViewPanoramaLocation = (StreetViewPanoramaLocation)paramObject;
    }
    while ((this.panoId.equals(localStreetViewPanoramaLocation.panoId)) && (this.position.equals(localStreetViewPanoramaLocation.position)));
    return false;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.position;
    arrayOfObject[1] = this.panoId;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("panoId", this.panoId).zza("position", this.position.toString()).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzs.zza(this, paramParcel, paramInt);
  }
}