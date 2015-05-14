package com.google.android.gms.maps.model;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.internal.zzaa;

public final class CameraPosition
  implements SafeParcelable
{
  public static final zza CREATOR = new zza();
  public final float bearing;
  public final LatLng target;
  public final float tilt;
  public final float zoom;
  private final int zzFG;

  CameraPosition(int paramInt, LatLng paramLatLng, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    zzx.zzb(paramLatLng, "null camera target");
    if ((0.0F <= paramFloat2) && (paramFloat2 <= 90.0F));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Tilt needs to be between 0 and 90 inclusive");
      this.zzFG = paramInt;
      this.target = paramLatLng;
      this.zoom = paramFloat1;
      this.tilt = (paramFloat2 + 0.0F);
      if (paramFloat3 <= 0.0D)
        paramFloat3 = 360.0F + paramFloat3 % 360.0F;
      this.bearing = (paramFloat3 % 360.0F);
      return;
    }
  }

  public CameraPosition(LatLng paramLatLng, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(1, paramLatLng, paramFloat1, paramFloat2, paramFloat3);
  }

  public static Builder builder()
  {
    return new Builder();
  }

  public static Builder builder(CameraPosition paramCameraPosition)
  {
    return new Builder(paramCameraPosition);
  }

  public static CameraPosition createFromAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
      return null;
    TypedArray localTypedArray = paramContext.getResources().obtainAttributes(paramAttributeSet, R.styleable.MapAttrs);
    if (localTypedArray.hasValue(R.styleable.MapAttrs_cameraTargetLat));
    for (float f1 = localTypedArray.getFloat(R.styleable.MapAttrs_cameraTargetLat, 0.0F); ; f1 = 0.0F)
    {
      if (localTypedArray.hasValue(R.styleable.MapAttrs_cameraTargetLng));
      for (float f2 = localTypedArray.getFloat(R.styleable.MapAttrs_cameraTargetLng, 0.0F); ; f2 = 0.0F)
      {
        LatLng localLatLng = new LatLng(f1, f2);
        Builder localBuilder = builder();
        localBuilder.target(localLatLng);
        if (localTypedArray.hasValue(R.styleable.MapAttrs_cameraZoom))
          localBuilder.zoom(localTypedArray.getFloat(R.styleable.MapAttrs_cameraZoom, 0.0F));
        if (localTypedArray.hasValue(R.styleable.MapAttrs_cameraBearing))
          localBuilder.bearing(localTypedArray.getFloat(R.styleable.MapAttrs_cameraBearing, 0.0F));
        if (localTypedArray.hasValue(R.styleable.MapAttrs_cameraTilt))
          localBuilder.tilt(localTypedArray.getFloat(R.styleable.MapAttrs_cameraTilt, 0.0F));
        return localBuilder.build();
      }
    }
  }

  public static final CameraPosition fromLatLngZoom(LatLng paramLatLng, float paramFloat)
  {
    return new CameraPosition(paramLatLng, paramFloat, 0.0F, 0.0F);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    CameraPosition localCameraPosition;
    do
    {
      return true;
      if (!(paramObject instanceof CameraPosition))
        return false;
      localCameraPosition = (CameraPosition)paramObject;
    }
    while ((this.target.equals(localCameraPosition.target)) && (Float.floatToIntBits(this.zoom) == Float.floatToIntBits(localCameraPosition.zoom)) && (Float.floatToIntBits(this.tilt) == Float.floatToIntBits(localCameraPosition.tilt)) && (Float.floatToIntBits(this.bearing) == Float.floatToIntBits(localCameraPosition.bearing)));
    return false;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.target;
    arrayOfObject[1] = Float.valueOf(this.zoom);
    arrayOfObject[2] = Float.valueOf(this.tilt);
    arrayOfObject[3] = Float.valueOf(this.bearing);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("target", this.target).zza("zoom", Float.valueOf(this.zoom)).zza("tilt", Float.valueOf(this.tilt)).zza("bearing", Float.valueOf(this.bearing)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzb.zza(this, paramParcel, paramInt);
      return;
    }
    zza.zza(this, paramParcel, paramInt);
  }

  public static final class Builder
  {
    private LatLng zzaqR;
    private float zzaqS;
    private float zzaqT;
    private float zzaqU;

    public Builder()
    {
    }

    public Builder(CameraPosition paramCameraPosition)
    {
      this.zzaqR = paramCameraPosition.target;
      this.zzaqS = paramCameraPosition.zoom;
      this.zzaqT = paramCameraPosition.tilt;
      this.zzaqU = paramCameraPosition.bearing;
    }

    public Builder bearing(float paramFloat)
    {
      this.zzaqU = paramFloat;
      return this;
    }

    public CameraPosition build()
    {
      return new CameraPosition(this.zzaqR, this.zzaqS, this.zzaqT, this.zzaqU);
    }

    public Builder target(LatLng paramLatLng)
    {
      this.zzaqR = paramLatLng;
      return this;
    }

    public Builder tilt(float paramFloat)
    {
      this.zzaqT = paramFloat;
      return this;
    }

    public Builder zoom(float paramFloat)
    {
      this.zzaqS = paramFloat;
      return this;
    }
  }
}