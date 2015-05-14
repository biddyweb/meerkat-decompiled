package com.google.android.gms.maps.internal;

import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.maps.OnStreetViewPanoramaReadyCallback;

public abstract interface StreetViewLifecycleDelegate extends LifecycleDelegate
{
  public abstract void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback);
}