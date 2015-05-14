package com.google.android.gms.maps;

import android.graphics.Point;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.zzr.zza;
import com.google.android.gms.maps.internal.zzs.zza;
import com.google.android.gms.maps.internal.zzt.zza;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.StreetViewPanoramaCamera;
import com.google.android.gms.maps.model.StreetViewPanoramaLocation;
import com.google.android.gms.maps.model.StreetViewPanoramaOrientation;

public class StreetViewPanorama
{
  private final IStreetViewPanoramaDelegate zzaqk;

  protected StreetViewPanorama(IStreetViewPanoramaDelegate paramIStreetViewPanoramaDelegate)
  {
    this.zzaqk = ((IStreetViewPanoramaDelegate)zzx.zzl(paramIStreetViewPanoramaDelegate));
  }

  public void animateTo(StreetViewPanoramaCamera paramStreetViewPanoramaCamera, long paramLong)
  {
    try
    {
      this.zzaqk.animateTo(paramStreetViewPanoramaCamera, paramLong);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public StreetViewPanoramaLocation getLocation()
  {
    try
    {
      StreetViewPanoramaLocation localStreetViewPanoramaLocation = this.zzaqk.getStreetViewPanoramaLocation();
      return localStreetViewPanoramaLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public StreetViewPanoramaCamera getPanoramaCamera()
  {
    try
    {
      StreetViewPanoramaCamera localStreetViewPanoramaCamera = this.zzaqk.getPanoramaCamera();
      return localStreetViewPanoramaCamera;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isPanningGesturesEnabled()
  {
    try
    {
      boolean bool = this.zzaqk.isPanningGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isStreetNamesEnabled()
  {
    try
    {
      boolean bool = this.zzaqk.isStreetNamesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isUserNavigationEnabled()
  {
    try
    {
      boolean bool = this.zzaqk.isUserNavigationEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isZoomGesturesEnabled()
  {
    try
    {
      boolean bool = this.zzaqk.isZoomGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public Point orientationToPoint(StreetViewPanoramaOrientation paramStreetViewPanoramaOrientation)
  {
    try
    {
      zzd localzzd = this.zzaqk.orientationToPoint(paramStreetViewPanoramaOrientation);
      if (localzzd == null)
        return null;
      Point localPoint = (Point)zze.zzf(localzzd);
      return localPoint;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public StreetViewPanoramaOrientation pointToOrientation(Point paramPoint)
  {
    try
    {
      StreetViewPanoramaOrientation localStreetViewPanoramaOrientation = this.zzaqk.pointToOrientation(zze.zzn(paramPoint));
      return localStreetViewPanoramaOrientation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnStreetViewPanoramaCameraChangeListener(final OnStreetViewPanoramaCameraChangeListener paramOnStreetViewPanoramaCameraChangeListener)
  {
    if (paramOnStreetViewPanoramaCameraChangeListener == null);
    try
    {
      this.zzaqk.setOnStreetViewPanoramaCameraChangeListener(null);
      return;
      this.zzaqk.setOnStreetViewPanoramaCameraChangeListener(new zzr.zza()
      {
        public void onStreetViewPanoramaCameraChange(StreetViewPanoramaCamera paramAnonymousStreetViewPanoramaCamera)
        {
          paramOnStreetViewPanoramaCameraChangeListener.onStreetViewPanoramaCameraChange(paramAnonymousStreetViewPanoramaCamera);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnStreetViewPanoramaChangeListener(final OnStreetViewPanoramaChangeListener paramOnStreetViewPanoramaChangeListener)
  {
    if (paramOnStreetViewPanoramaChangeListener == null);
    try
    {
      this.zzaqk.setOnStreetViewPanoramaChangeListener(null);
      return;
      this.zzaqk.setOnStreetViewPanoramaChangeListener(new zzs.zza()
      {
        public void onStreetViewPanoramaChange(StreetViewPanoramaLocation paramAnonymousStreetViewPanoramaLocation)
        {
          paramOnStreetViewPanoramaChangeListener.onStreetViewPanoramaChange(paramAnonymousStreetViewPanoramaLocation);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnStreetViewPanoramaClickListener(final OnStreetViewPanoramaClickListener paramOnStreetViewPanoramaClickListener)
  {
    if (paramOnStreetViewPanoramaClickListener == null);
    try
    {
      this.zzaqk.setOnStreetViewPanoramaClickListener(null);
      return;
      this.zzaqk.setOnStreetViewPanoramaClickListener(new zzt.zza()
      {
        public void onStreetViewPanoramaClick(StreetViewPanoramaOrientation paramAnonymousStreetViewPanoramaOrientation)
        {
          paramOnStreetViewPanoramaClickListener.onStreetViewPanoramaClick(paramAnonymousStreetViewPanoramaOrientation);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setPanningGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqk.enablePanning(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setPosition(LatLng paramLatLng)
  {
    try
    {
      this.zzaqk.setPosition(paramLatLng);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setPosition(LatLng paramLatLng, int paramInt)
  {
    try
    {
      this.zzaqk.setPositionWithRadius(paramLatLng, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setPosition(String paramString)
  {
    try
    {
      this.zzaqk.setPositionWithID(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setStreetNamesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqk.enableStreetNames(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setUserNavigationEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqk.enableUserNavigation(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setZoomGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqk.enableZoom(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  IStreetViewPanoramaDelegate zzqu()
  {
    return this.zzaqk;
  }

  public static abstract interface OnStreetViewPanoramaCameraChangeListener
  {
    public abstract void onStreetViewPanoramaCameraChange(StreetViewPanoramaCamera paramStreetViewPanoramaCamera);
  }

  public static abstract interface OnStreetViewPanoramaChangeListener
  {
    public abstract void onStreetViewPanoramaChange(StreetViewPanoramaLocation paramStreetViewPanoramaLocation);
  }

  public static abstract interface OnStreetViewPanoramaClickListener
  {
    public abstract void onStreetViewPanoramaClick(StreetViewPanoramaOrientation paramStreetViewPanoramaOrientation);
  }
}