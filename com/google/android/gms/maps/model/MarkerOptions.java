package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.internal.zzaa;

public final class MarkerOptions
  implements SafeParcelable
{
  public static final zzk CREATOR = new zzk();
  private float mAlpha = 1.0F;
  private final int zzFG;
  private String zzSy;
  private LatLng zzaqx;
  private boolean zzarc = true;
  private float zzark = 0.5F;
  private float zzarl = 1.0F;
  private String zzart;
  private BitmapDescriptor zzaru;
  private boolean zzarv;
  private boolean zzarw = false;
  private float zzarx = 0.0F;
  private float zzary = 0.5F;
  private float zzarz = 0.0F;

  public MarkerOptions()
  {
    this.zzFG = 1;
  }

  MarkerOptions(int paramInt, LatLng paramLatLng, String paramString1, String paramString2, IBinder paramIBinder, float paramFloat1, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    this.zzFG = paramInt;
    this.zzaqx = paramLatLng;
    this.zzSy = paramString1;
    this.zzart = paramString2;
    if (paramIBinder == null);
    for (BitmapDescriptor localBitmapDescriptor = null; ; localBitmapDescriptor = new BitmapDescriptor(zzd.zza.zzau(paramIBinder)))
    {
      this.zzaru = localBitmapDescriptor;
      this.zzark = paramFloat1;
      this.zzarl = paramFloat2;
      this.zzarv = paramBoolean1;
      this.zzarc = paramBoolean2;
      this.zzarw = paramBoolean3;
      this.zzarx = paramFloat3;
      this.zzary = paramFloat4;
      this.zzarz = paramFloat5;
      this.mAlpha = paramFloat6;
      return;
    }
  }

  public MarkerOptions alpha(float paramFloat)
  {
    this.mAlpha = paramFloat;
    return this;
  }

  public MarkerOptions anchor(float paramFloat1, float paramFloat2)
  {
    this.zzark = paramFloat1;
    this.zzarl = paramFloat2;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public MarkerOptions draggable(boolean paramBoolean)
  {
    this.zzarv = paramBoolean;
    return this;
  }

  public MarkerOptions flat(boolean paramBoolean)
  {
    this.zzarw = paramBoolean;
    return this;
  }

  public float getAlpha()
  {
    return this.mAlpha;
  }

  public float getAnchorU()
  {
    return this.zzark;
  }

  public float getAnchorV()
  {
    return this.zzarl;
  }

  public BitmapDescriptor getIcon()
  {
    return this.zzaru;
  }

  public float getInfoWindowAnchorU()
  {
    return this.zzary;
  }

  public float getInfoWindowAnchorV()
  {
    return this.zzarz;
  }

  public LatLng getPosition()
  {
    return this.zzaqx;
  }

  public float getRotation()
  {
    return this.zzarx;
  }

  public String getSnippet()
  {
    return this.zzart;
  }

  public String getTitle()
  {
    return this.zzSy;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public MarkerOptions icon(BitmapDescriptor paramBitmapDescriptor)
  {
    this.zzaru = paramBitmapDescriptor;
    return this;
  }

  public MarkerOptions infoWindowAnchor(float paramFloat1, float paramFloat2)
  {
    this.zzary = paramFloat1;
    this.zzarz = paramFloat2;
    return this;
  }

  public boolean isDraggable()
  {
    return this.zzarv;
  }

  public boolean isFlat()
  {
    return this.zzarw;
  }

  public boolean isVisible()
  {
    return this.zzarc;
  }

  public MarkerOptions position(LatLng paramLatLng)
  {
    this.zzaqx = paramLatLng;
    return this;
  }

  public MarkerOptions rotation(float paramFloat)
  {
    this.zzarx = paramFloat;
    return this;
  }

  public MarkerOptions snippet(String paramString)
  {
    this.zzart = paramString;
    return this;
  }

  public MarkerOptions title(String paramString)
  {
    this.zzSy = paramString;
    return this;
  }

  public MarkerOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzl.zza(this, paramParcel, paramInt);
      return;
    }
    zzk.zza(this, paramParcel, paramInt);
  }

  IBinder zzqI()
  {
    if (this.zzaru == null)
      return null;
    return this.zzaru.zzqe().asBinder();
  }
}