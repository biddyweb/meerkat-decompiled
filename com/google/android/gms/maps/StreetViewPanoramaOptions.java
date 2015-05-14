package com.google.android.gms.maps;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zza;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.StreetViewPanoramaCamera;

public final class StreetViewPanoramaOptions
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  private final int zzFG;
  private Boolean zzapK;
  private Boolean zzapQ = Boolean.valueOf(true);
  private Boolean zzaqA = Boolean.valueOf(true);
  private Boolean zzaqB = Boolean.valueOf(true);
  private StreetViewPanoramaCamera zzaqv;
  private String zzaqw;
  private LatLng zzaqx;
  private Integer zzaqy;
  private Boolean zzaqz = Boolean.valueOf(true);

  public StreetViewPanoramaOptions()
  {
    this.zzFG = 1;
  }

  StreetViewPanoramaOptions(int paramInt, StreetViewPanoramaCamera paramStreetViewPanoramaCamera, String paramString, LatLng paramLatLng, Integer paramInteger, byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4, byte paramByte5)
  {
    this.zzFG = paramInt;
    this.zzaqv = paramStreetViewPanoramaCamera;
    this.zzaqx = paramLatLng;
    this.zzaqy = paramInteger;
    this.zzaqw = paramString;
    this.zzaqz = zza.zza(paramByte1);
    this.zzapQ = zza.zza(paramByte2);
    this.zzaqA = zza.zza(paramByte3);
    this.zzaqB = zza.zza(paramByte4);
    this.zzapK = zza.zza(paramByte5);
  }

  public int describeContents()
  {
    return 0;
  }

  public Boolean getPanningGesturesEnabled()
  {
    return this.zzaqA;
  }

  public String getPanoramaId()
  {
    return this.zzaqw;
  }

  public LatLng getPosition()
  {
    return this.zzaqx;
  }

  public Integer getRadius()
  {
    return this.zzaqy;
  }

  public Boolean getStreetNamesEnabled()
  {
    return this.zzaqB;
  }

  public StreetViewPanoramaCamera getStreetViewPanoramaCamera()
  {
    return this.zzaqv;
  }

  public Boolean getUseViewLifecycleInFragment()
  {
    return this.zzapK;
  }

  public Boolean getUserNavigationEnabled()
  {
    return this.zzaqz;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public Boolean getZoomGesturesEnabled()
  {
    return this.zzapQ;
  }

  public StreetViewPanoramaOptions panningGesturesEnabled(boolean paramBoolean)
  {
    this.zzaqA = Boolean.valueOf(paramBoolean);
    return this;
  }

  public StreetViewPanoramaOptions panoramaCamera(StreetViewPanoramaCamera paramStreetViewPanoramaCamera)
  {
    this.zzaqv = paramStreetViewPanoramaCamera;
    return this;
  }

  public StreetViewPanoramaOptions panoramaId(String paramString)
  {
    this.zzaqw = paramString;
    return this;
  }

  public StreetViewPanoramaOptions position(LatLng paramLatLng)
  {
    this.zzaqx = paramLatLng;
    return this;
  }

  public StreetViewPanoramaOptions position(LatLng paramLatLng, Integer paramInteger)
  {
    this.zzaqx = paramLatLng;
    this.zzaqy = paramInteger;
    return this;
  }

  public StreetViewPanoramaOptions streetNamesEnabled(boolean paramBoolean)
  {
    this.zzaqB = Boolean.valueOf(paramBoolean);
    return this;
  }

  public StreetViewPanoramaOptions useViewLifecycleInFragment(boolean paramBoolean)
  {
    this.zzapK = Boolean.valueOf(paramBoolean);
    return this;
  }

  public StreetViewPanoramaOptions userNavigationEnabled(boolean paramBoolean)
  {
    this.zzaqz = Boolean.valueOf(paramBoolean);
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public StreetViewPanoramaOptions zoomGesturesEnabled(boolean paramBoolean)
  {
    this.zzapQ = Boolean.valueOf(paramBoolean);
    return this;
  }

  byte zzqi()
  {
    return zza.zzd(this.zzapK);
  }

  byte zzqm()
  {
    return zza.zzd(this.zzapQ);
  }

  byte zzqw()
  {
    return zza.zzd(this.zzaqz);
  }

  byte zzqx()
  {
    return zza.zzd(this.zzaqA);
  }

  byte zzqy()
  {
    return zza.zzd(this.zzaqB);
  }
}