package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.internal.zzaa;

public final class GroundOverlayOptions
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  public static final float NO_DIMENSION = -1.0F;
  private final int zzFG;
  private float zzaqU;
  private float zzarb;
  private boolean zzarc = true;
  private BitmapDescriptor zzare;
  private LatLng zzarf;
  private float zzarg;
  private float zzarh;
  private LatLngBounds zzari;
  private float zzarj = 0.0F;
  private float zzark = 0.5F;
  private float zzarl = 0.5F;

  public GroundOverlayOptions()
  {
    this.zzFG = 1;
  }

  GroundOverlayOptions(int paramInt, IBinder paramIBinder, LatLng paramLatLng, float paramFloat1, float paramFloat2, LatLngBounds paramLatLngBounds, float paramFloat3, float paramFloat4, boolean paramBoolean, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    this.zzFG = paramInt;
    this.zzare = new BitmapDescriptor(zzd.zza.zzau(paramIBinder));
    this.zzarf = paramLatLng;
    this.zzarg = paramFloat1;
    this.zzarh = paramFloat2;
    this.zzari = paramLatLngBounds;
    this.zzaqU = paramFloat3;
    this.zzarb = paramFloat4;
    this.zzarc = paramBoolean;
    this.zzarj = paramFloat5;
    this.zzark = paramFloat6;
    this.zzarl = paramFloat7;
  }

  private GroundOverlayOptions zza(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    this.zzarf = paramLatLng;
    this.zzarg = paramFloat1;
    this.zzarh = paramFloat2;
    return this;
  }

  public GroundOverlayOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.zzark = paramFloat1;
    this.zzarl = paramFloat2;
    return this;
  }

  public GroundOverlayOptions bearing(float paramFloat)
  {
    this.zzaqU = ((360.0F + paramFloat % 360.0F) % 360.0F);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public float getAnchorU()
  {
    return this.zzark;
  }

  public float getAnchorV()
  {
    return this.zzarl;
  }

  public float getBearing()
  {
    return this.zzaqU;
  }

  public LatLngBounds getBounds()
  {
    return this.zzari;
  }

  public float getHeight()
  {
    return this.zzarh;
  }

  public BitmapDescriptor getImage()
  {
    return this.zzare;
  }

  public LatLng getLocation()
  {
    return this.zzarf;
  }

  public float getTransparency()
  {
    return this.zzarj;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public float getWidth()
  {
    return this.zzarg;
  }

  public float getZIndex()
  {
    return this.zzarb;
  }

  public GroundOverlayOptions image(BitmapDescriptor paramBitmapDescriptor)
  {
    this.zzare = paramBitmapDescriptor;
    return this;
  }

  public boolean isVisible()
  {
    return this.zzarc;
  }

  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    if (this.zzari == null)
    {
      bool2 = bool1;
      zzx.zza(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null)
        break label60;
      bool3 = bool1;
      label26: zzx.zzb(bool3, "Location must be specified");
      if (paramFloat < 0.0F)
        break label66;
    }
    while (true)
    {
      zzx.zzb(bool1, "Width must be non-negative");
      return zza(paramLatLng, paramFloat, -1.0F);
      bool2 = false;
      break;
      label60: bool3 = false;
      break label26;
      label66: bool1 = false;
    }
  }

  public GroundOverlayOptions position(LatLng paramLatLng, float paramFloat1, float paramFloat2)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    label29: boolean bool4;
    if (this.zzari == null)
    {
      bool2 = bool1;
      zzx.zza(bool2, "Position has already been set using positionFromBounds");
      if (paramLatLng == null)
        break label80;
      bool3 = bool1;
      zzx.zzb(bool3, "Location must be specified");
      if (paramFloat1 < 0.0F)
        break label86;
      bool4 = bool1;
      label46: zzx.zzb(bool4, "Width must be non-negative");
      if (paramFloat2 < 0.0F)
        break label92;
    }
    while (true)
    {
      zzx.zzb(bool1, "Height must be non-negative");
      return zza(paramLatLng, paramFloat1, paramFloat2);
      bool2 = false;
      break;
      label80: bool3 = false;
      break label29;
      label86: bool4 = false;
      break label46;
      label92: bool1 = false;
    }
  }

  public GroundOverlayOptions positionFromBounds(LatLngBounds paramLatLngBounds)
  {
    if (this.zzarf == null);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Position has already been set using position: " + this.zzarf);
      this.zzari = paramLatLngBounds;
      return this;
    }
  }

  public GroundOverlayOptions transparency(float paramFloat)
  {
    if ((paramFloat >= 0.0F) && (paramFloat <= 1.0F));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Transparency must be in the range [0..1]");
      this.zzarj = paramFloat;
      return this;
    }
  }

  public GroundOverlayOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzf.zza(this, paramParcel, paramInt);
      return;
    }
    zze.zza(this, paramParcel, paramInt);
  }

  public GroundOverlayOptions zIndex(float paramFloat)
  {
    this.zzarb = paramFloat;
    return this;
  }

  IBinder zzqH()
  {
    return this.zzare.zzqe().asBinder();
  }
}