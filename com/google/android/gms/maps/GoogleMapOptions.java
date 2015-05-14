package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;
import com.google.android.gms.maps.model.CameraPosition;

public final class GoogleMapOptions
  implements SafeParcelable
{
  public static final zza CREATOR = new zza();
  private final int zzFG;
  private Boolean zzapJ;
  private Boolean zzapK;
  private int zzapL = -1;
  private CameraPosition zzapM;
  private Boolean zzapN;
  private Boolean zzapO;
  private Boolean zzapP;
  private Boolean zzapQ;
  private Boolean zzapR;
  private Boolean zzapS;
  private Boolean zzapT;
  private Boolean zzapU;

  public GoogleMapOptions()
  {
    this.zzFG = 1;
  }

  GoogleMapOptions(int paramInt1, byte paramByte1, byte paramByte2, int paramInt2, CameraPosition paramCameraPosition, byte paramByte3, byte paramByte4, byte paramByte5, byte paramByte6, byte paramByte7, byte paramByte8, byte paramByte9, byte paramByte10)
  {
    this.zzFG = paramInt1;
    this.zzapJ = com.google.android.gms.maps.internal.zza.zza(paramByte1);
    this.zzapK = com.google.android.gms.maps.internal.zza.zza(paramByte2);
    this.zzapL = paramInt2;
    this.zzapM = paramCameraPosition;
    this.zzapN = com.google.android.gms.maps.internal.zza.zza(paramByte3);
    this.zzapO = com.google.android.gms.maps.internal.zza.zza(paramByte4);
    this.zzapP = com.google.android.gms.maps.internal.zza.zza(paramByte5);
    this.zzapQ = com.google.android.gms.maps.internal.zza.zza(paramByte6);
    this.zzapR = com.google.android.gms.maps.internal.zza.zza(paramByte7);
    this.zzapS = com.google.android.gms.maps.internal.zza.zza(paramByte8);
    this.zzapT = com.google.android.gms.maps.internal.zza.zza(paramByte9);
    this.zzapU = com.google.android.gms.maps.internal.zza.zza(paramByte10);
  }

  public static GoogleMapOptions createFromAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
      return null;
    TypedArray localTypedArray = paramContext.getResources().obtainAttributes(paramAttributeSet, R.styleable.MapAttrs);
    GoogleMapOptions localGoogleMapOptions = new GoogleMapOptions();
    if (localTypedArray.hasValue(R.styleable.MapAttrs_mapType))
      localGoogleMapOptions.mapType(localTypedArray.getInt(R.styleable.MapAttrs_mapType, -1));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_zOrderOnTop))
      localGoogleMapOptions.zOrderOnTop(localTypedArray.getBoolean(R.styleable.MapAttrs_zOrderOnTop, false));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_useViewLifecycle))
      localGoogleMapOptions.useViewLifecycleInFragment(localTypedArray.getBoolean(R.styleable.MapAttrs_useViewLifecycle, false));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiCompass))
      localGoogleMapOptions.compassEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiCompass, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiRotateGestures))
      localGoogleMapOptions.rotateGesturesEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiRotateGestures, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiScrollGestures))
      localGoogleMapOptions.scrollGesturesEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiScrollGestures, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiTiltGestures))
      localGoogleMapOptions.tiltGesturesEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiTiltGestures, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiZoomGestures))
      localGoogleMapOptions.zoomGesturesEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiZoomGestures, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiZoomControls))
      localGoogleMapOptions.zoomControlsEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiZoomControls, true));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_liteMode))
      localGoogleMapOptions.liteMode(localTypedArray.getBoolean(R.styleable.MapAttrs_liteMode, false));
    if (localTypedArray.hasValue(R.styleable.MapAttrs_uiMapToolbar))
      localGoogleMapOptions.mapToolbarEnabled(localTypedArray.getBoolean(R.styleable.MapAttrs_uiMapToolbar, true));
    localGoogleMapOptions.camera(CameraPosition.createFromAttributes(paramContext, paramAttributeSet));
    localTypedArray.recycle();
    return localGoogleMapOptions;
  }

  public GoogleMapOptions camera(CameraPosition paramCameraPosition)
  {
    this.zzapM = paramCameraPosition;
    return this;
  }

  public GoogleMapOptions compassEnabled(boolean paramBoolean)
  {
    this.zzapO = Boolean.valueOf(paramBoolean);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public CameraPosition getCamera()
  {
    return this.zzapM;
  }

  public Boolean getCompassEnabled()
  {
    return this.zzapO;
  }

  public Boolean getLiteMode()
  {
    return this.zzapT;
  }

  public Boolean getMapToolbarEnabled()
  {
    return this.zzapU;
  }

  public int getMapType()
  {
    return this.zzapL;
  }

  public Boolean getRotateGesturesEnabled()
  {
    return this.zzapS;
  }

  public Boolean getScrollGesturesEnabled()
  {
    return this.zzapP;
  }

  public Boolean getTiltGesturesEnabled()
  {
    return this.zzapR;
  }

  public Boolean getUseViewLifecycleInFragment()
  {
    return this.zzapK;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public Boolean getZOrderOnTop()
  {
    return this.zzapJ;
  }

  public Boolean getZoomControlsEnabled()
  {
    return this.zzapN;
  }

  public Boolean getZoomGesturesEnabled()
  {
    return this.zzapQ;
  }

  public GoogleMapOptions liteMode(boolean paramBoolean)
  {
    this.zzapT = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions mapToolbarEnabled(boolean paramBoolean)
  {
    this.zzapU = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions mapType(int paramInt)
  {
    this.zzapL = paramInt;
    return this;
  }

  public GoogleMapOptions rotateGesturesEnabled(boolean paramBoolean)
  {
    this.zzapS = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions scrollGesturesEnabled(boolean paramBoolean)
  {
    this.zzapP = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions tiltGesturesEnabled(boolean paramBoolean)
  {
    this.zzapR = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions useViewLifecycleInFragment(boolean paramBoolean)
  {
    this.zzapK = Boolean.valueOf(paramBoolean);
    return this;
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

  public GoogleMapOptions zOrderOnTop(boolean paramBoolean)
  {
    this.zzapJ = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions zoomControlsEnabled(boolean paramBoolean)
  {
    this.zzapN = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions zoomGesturesEnabled(boolean paramBoolean)
  {
    this.zzapQ = Boolean.valueOf(paramBoolean);
    return this;
  }

  byte zzqh()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapJ);
  }

  byte zzqi()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapK);
  }

  byte zzqj()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapN);
  }

  byte zzqk()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapO);
  }

  byte zzql()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapP);
  }

  byte zzqm()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapQ);
  }

  byte zzqn()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapR);
  }

  byte zzqo()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapS);
  }

  byte zzqp()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapT);
  }

  byte zzqq()
  {
    return com.google.android.gms.maps.internal.zza.zzd(this.zzapU);
  }
}