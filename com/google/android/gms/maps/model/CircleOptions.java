package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;

public final class CircleOptions
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  private final int zzFG;
  private LatLng zzaqW = null;
  private double zzaqX = 0.0D;
  private float zzaqY = 10.0F;
  private int zzaqZ = -16777216;
  private int zzara = 0;
  private float zzarb = 0.0F;
  private boolean zzarc = true;

  public CircleOptions()
  {
    this.zzFG = 1;
  }

  CircleOptions(int paramInt1, LatLng paramLatLng, double paramDouble, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean)
  {
    this.zzFG = paramInt1;
    this.zzaqW = paramLatLng;
    this.zzaqX = paramDouble;
    this.zzaqY = paramFloat1;
    this.zzaqZ = paramInt2;
    this.zzara = paramInt3;
    this.zzarb = paramFloat2;
    this.zzarc = paramBoolean;
  }

  public CircleOptions center(LatLng paramLatLng)
  {
    this.zzaqW = paramLatLng;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public CircleOptions fillColor(int paramInt)
  {
    this.zzara = paramInt;
    return this;
  }

  public LatLng getCenter()
  {
    return this.zzaqW;
  }

  public int getFillColor()
  {
    return this.zzara;
  }

  public double getRadius()
  {
    return this.zzaqX;
  }

  public int getStrokeColor()
  {
    return this.zzaqZ;
  }

  public float getStrokeWidth()
  {
    return this.zzaqY;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public float getZIndex()
  {
    return this.zzarb;
  }

  public boolean isVisible()
  {
    return this.zzarc;
  }

  public CircleOptions radius(double paramDouble)
  {
    this.zzaqX = paramDouble;
    return this;
  }

  public CircleOptions strokeColor(int paramInt)
  {
    this.zzaqZ = paramInt;
    return this;
  }

  public CircleOptions strokeWidth(float paramFloat)
  {
    this.zzaqY = paramFloat;
    return this;
  }

  public CircleOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzd.zza(this, paramParcel, paramInt);
      return;
    }
    zzc.zza(this, paramParcel, paramInt);
  }

  public CircleOptions zIndex(float paramFloat)
  {
    this.zzarb = paramFloat;
    return this;
  }
}