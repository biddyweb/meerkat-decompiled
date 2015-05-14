package com.google.android.gms.maps;

import android.graphics.Bitmap;
import android.location.Location;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate.zza;
import com.google.android.gms.maps.internal.zzb;
import com.google.android.gms.maps.internal.zzb.zza;
import com.google.android.gms.maps.internal.zzd.zza;
import com.google.android.gms.maps.internal.zzf.zza;
import com.google.android.gms.maps.internal.zzg.zza;
import com.google.android.gms.maps.internal.zzh.zza;
import com.google.android.gms.maps.internal.zzj.zza;
import com.google.android.gms.maps.internal.zzk.zza;
import com.google.android.gms.maps.internal.zzl.zza;
import com.google.android.gms.maps.internal.zzn.zza;
import com.google.android.gms.maps.internal.zzo.zza;
import com.google.android.gms.maps.internal.zzp.zza;
import com.google.android.gms.maps.internal.zzq.zza;
import com.google.android.gms.maps.internal.zzv.zza;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.IndoorBuilding;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.internal.zzj;
import com.google.android.gms.maps.model.internal.zzl;
import com.google.android.gms.maps.model.internal.zzn;

public final class GoogleMap
{
  public static final int MAP_TYPE_HYBRID = 4;
  public static final int MAP_TYPE_NONE = 0;
  public static final int MAP_TYPE_NORMAL = 1;
  public static final int MAP_TYPE_SATELLITE = 2;
  public static final int MAP_TYPE_TERRAIN = 3;
  private final IGoogleMapDelegate zzapq;
  private UiSettings zzapr;

  protected GoogleMap(IGoogleMapDelegate paramIGoogleMapDelegate)
  {
    this.zzapq = ((IGoogleMapDelegate)zzx.zzl(paramIGoogleMapDelegate));
  }

  public final Circle addCircle(CircleOptions paramCircleOptions)
  {
    try
    {
      Circle localCircle = new Circle(this.zzapq.addCircle(paramCircleOptions));
      return localCircle;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final GroundOverlay addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
  {
    try
    {
      com.google.android.gms.maps.model.internal.zzi localzzi = this.zzapq.addGroundOverlay(paramGroundOverlayOptions);
      if (localzzi != null)
      {
        GroundOverlay localGroundOverlay = new GroundOverlay(localzzi);
        return localGroundOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Marker addMarker(MarkerOptions paramMarkerOptions)
  {
    try
    {
      zzl localzzl = this.zzapq.addMarker(paramMarkerOptions);
      if (localzzl != null)
      {
        Marker localMarker = new Marker(localzzl);
        return localMarker;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Polygon addPolygon(PolygonOptions paramPolygonOptions)
  {
    try
    {
      Polygon localPolygon = new Polygon(this.zzapq.addPolygon(paramPolygonOptions));
      return localPolygon;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Polyline addPolyline(PolylineOptions paramPolylineOptions)
  {
    try
    {
      Polyline localPolyline = new Polyline(this.zzapq.addPolyline(paramPolylineOptions));
      return localPolyline;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final TileOverlay addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
  {
    try
    {
      zzn localzzn = this.zzapq.addTileOverlay(paramTileOverlayOptions);
      if (localzzn != null)
      {
        TileOverlay localTileOverlay = new TileOverlay(localzzn);
        return localTileOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.zzapq.animateCamera(paramCameraUpdate.zzqe());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate, int paramInt, CancelableCallback paramCancelableCallback)
  {
    try
    {
      IGoogleMapDelegate localIGoogleMapDelegate = this.zzapq;
      zzd localzzd = paramCameraUpdate.zzqe();
      if (paramCancelableCallback == null);
      for (Object localObject = null; ; localObject = new zza(paramCancelableCallback))
      {
        localIGoogleMapDelegate.animateCameraWithDurationAndCallback(localzzd, paramInt, (zzb)localObject);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate, CancelableCallback paramCancelableCallback)
  {
    try
    {
      IGoogleMapDelegate localIGoogleMapDelegate = this.zzapq;
      zzd localzzd = paramCameraUpdate.zzqe();
      if (paramCancelableCallback == null);
      for (Object localObject = null; ; localObject = new zza(paramCancelableCallback))
      {
        localIGoogleMapDelegate.animateCameraWithCallback(localzzd, (zzb)localObject);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void clear()
  {
    try
    {
      this.zzapq.clear();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final CameraPosition getCameraPosition()
  {
    try
    {
      CameraPosition localCameraPosition = this.zzapq.getCameraPosition();
      return localCameraPosition;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public IndoorBuilding getFocusedBuilding()
  {
    try
    {
      zzj localzzj = this.zzapq.getFocusedBuilding();
      if (localzzj != null)
      {
        IndoorBuilding localIndoorBuilding = new IndoorBuilding(localzzj);
        return localIndoorBuilding;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final int getMapType()
  {
    try
    {
      int i = this.zzapq.getMapType();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final float getMaxZoomLevel()
  {
    try
    {
      float f = this.zzapq.getMaxZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final float getMinZoomLevel()
  {
    try
    {
      float f = this.zzapq.getMinZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  @Deprecated
  public final Location getMyLocation()
  {
    try
    {
      Location localLocation = this.zzapq.getMyLocation();
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Projection getProjection()
  {
    try
    {
      Projection localProjection = new Projection(this.zzapq.getProjection());
      return localProjection;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final UiSettings getUiSettings()
  {
    try
    {
      if (this.zzapr == null)
        this.zzapr = new UiSettings(this.zzapq.getUiSettings());
      UiSettings localUiSettings = this.zzapr;
      return localUiSettings;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isBuildingsEnabled()
  {
    try
    {
      boolean bool = this.zzapq.isBuildingsEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isIndoorEnabled()
  {
    try
    {
      boolean bool = this.zzapq.isIndoorEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isMyLocationEnabled()
  {
    try
    {
      boolean bool = this.zzapq.isMyLocationEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isTrafficEnabled()
  {
    try
    {
      boolean bool = this.zzapq.isTrafficEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void moveCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.zzapq.moveCamera(paramCameraUpdate.zzqe());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setBuildingsEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzapq.setBuildingsEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setContentDescription(String paramString)
  {
    try
    {
      this.zzapq.setContentDescription(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean setIndoorEnabled(boolean paramBoolean)
  {
    try
    {
      boolean bool = this.zzapq.setIndoorEnabled(paramBoolean);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setInfoWindowAdapter(final InfoWindowAdapter paramInfoWindowAdapter)
  {
    if (paramInfoWindowAdapter == null);
    try
    {
      this.zzapq.setInfoWindowAdapter(null);
      return;
      this.zzapq.setInfoWindowAdapter(new zzd.zza()
      {
        public zzd zzf(zzl paramAnonymouszzl)
        {
          return zze.zzn(paramInfoWindowAdapter.getInfoWindow(new Marker(paramAnonymouszzl)));
        }

        public zzd zzg(zzl paramAnonymouszzl)
        {
          return zze.zzn(paramInfoWindowAdapter.getInfoContents(new Marker(paramAnonymouszzl)));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setLocationSource(final LocationSource paramLocationSource)
  {
    if (paramLocationSource == null);
    try
    {
      this.zzapq.setLocationSource(null);
      return;
      this.zzapq.setLocationSource(new ILocationSourceDelegate.zza()
      {
        public void activate(final com.google.android.gms.maps.internal.zzi paramAnonymouszzi)
        {
          paramLocationSource.activate(new LocationSource.OnLocationChangedListener()
          {
            public void onLocationChanged(Location paramAnonymous2Location)
            {
              try
              {
                paramAnonymouszzi.zzd(paramAnonymous2Location);
                return;
              }
              catch (RemoteException localRemoteException)
              {
                throw new RuntimeRemoteException(localRemoteException);
              }
            }
          });
        }

        public void deactivate()
        {
          paramLocationSource.deactivate();
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setMapType(int paramInt)
  {
    try
    {
      this.zzapq.setMapType(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setMyLocationEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzapq.setMyLocationEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnCameraChangeListener(final OnCameraChangeListener paramOnCameraChangeListener)
  {
    if (paramOnCameraChangeListener == null);
    try
    {
      this.zzapq.setOnCameraChangeListener(null);
      return;
      this.zzapq.setOnCameraChangeListener(new zzf.zza()
      {
        public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
        {
          paramOnCameraChangeListener.onCameraChange(paramAnonymousCameraPosition);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnIndoorStateChangeListener(final OnIndoorStateChangeListener paramOnIndoorStateChangeListener)
  {
    if (paramOnIndoorStateChangeListener == null);
    try
    {
      this.zzapq.setOnIndoorStateChangeListener(null);
      return;
      this.zzapq.setOnIndoorStateChangeListener(new zzg.zza()
      {
        public void onIndoorBuildingFocused()
        {
          paramOnIndoorStateChangeListener.onIndoorBuildingFocused();
        }

        public void zza(zzj paramAnonymouszzj)
        {
          paramOnIndoorStateChangeListener.onIndoorLevelActivated(new IndoorBuilding(paramAnonymouszzj));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener paramOnInfoWindowClickListener)
  {
    if (paramOnInfoWindowClickListener == null);
    try
    {
      this.zzapq.setOnInfoWindowClickListener(null);
      return;
      this.zzapq.setOnInfoWindowClickListener(new zzh.zza()
      {
        public void zze(zzl paramAnonymouszzl)
        {
          paramOnInfoWindowClickListener.onInfoWindowClick(new Marker(paramAnonymouszzl));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMapClickListener(final OnMapClickListener paramOnMapClickListener)
  {
    if (paramOnMapClickListener == null);
    try
    {
      this.zzapq.setOnMapClickListener(null);
      return;
      this.zzapq.setOnMapClickListener(new zzj.zza()
      {
        public void onMapClick(LatLng paramAnonymousLatLng)
        {
          paramOnMapClickListener.onMapClick(paramAnonymousLatLng);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setOnMapLoadedCallback(final OnMapLoadedCallback paramOnMapLoadedCallback)
  {
    if (paramOnMapLoadedCallback == null);
    try
    {
      this.zzapq.setOnMapLoadedCallback(null);
      return;
      this.zzapq.setOnMapLoadedCallback(new zzk.zza()
      {
        public void onMapLoaded()
          throws RemoteException
        {
          paramOnMapLoadedCallback.onMapLoaded();
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMapLongClickListener(final OnMapLongClickListener paramOnMapLongClickListener)
  {
    if (paramOnMapLongClickListener == null);
    try
    {
      this.zzapq.setOnMapLongClickListener(null);
      return;
      this.zzapq.setOnMapLongClickListener(new zzl.zza()
      {
        public void onMapLongClick(LatLng paramAnonymousLatLng)
        {
          paramOnMapLongClickListener.onMapLongClick(paramAnonymousLatLng);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMarkerClickListener(final OnMarkerClickListener paramOnMarkerClickListener)
  {
    if (paramOnMarkerClickListener == null);
    try
    {
      this.zzapq.setOnMarkerClickListener(null);
      return;
      this.zzapq.setOnMarkerClickListener(new zzn.zza()
      {
        public boolean zza(zzl paramAnonymouszzl)
        {
          return paramOnMarkerClickListener.onMarkerClick(new Marker(paramAnonymouszzl));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMarkerDragListener(final OnMarkerDragListener paramOnMarkerDragListener)
  {
    if (paramOnMarkerDragListener == null);
    try
    {
      this.zzapq.setOnMarkerDragListener(null);
      return;
      this.zzapq.setOnMarkerDragListener(new zzo.zza()
      {
        public void zzb(zzl paramAnonymouszzl)
        {
          paramOnMarkerDragListener.onMarkerDragStart(new Marker(paramAnonymouszzl));
        }

        public void zzc(zzl paramAnonymouszzl)
        {
          paramOnMarkerDragListener.onMarkerDragEnd(new Marker(paramAnonymouszzl));
        }

        public void zzd(zzl paramAnonymouszzl)
        {
          paramOnMarkerDragListener.onMarkerDrag(new Marker(paramAnonymouszzl));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMyLocationButtonClickListener(final OnMyLocationButtonClickListener paramOnMyLocationButtonClickListener)
  {
    if (paramOnMyLocationButtonClickListener == null);
    try
    {
      this.zzapq.setOnMyLocationButtonClickListener(null);
      return;
      this.zzapq.setOnMyLocationButtonClickListener(new zzp.zza()
      {
        public boolean onMyLocationButtonClick()
          throws RemoteException
        {
          return paramOnMyLocationButtonClickListener.onMyLocationButtonClick();
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  @Deprecated
  public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener paramOnMyLocationChangeListener)
  {
    if (paramOnMyLocationChangeListener == null);
    try
    {
      this.zzapq.setOnMyLocationChangeListener(null);
      return;
      this.zzapq.setOnMyLocationChangeListener(new zzq.zza()
      {
        public void zzc(Location paramAnonymousLocation)
        {
          paramOnMyLocationChangeListener.onMyLocationChange(paramAnonymousLocation);
        }

        public void zzg(zzd paramAnonymouszzd)
        {
          paramOnMyLocationChangeListener.onMyLocationChange((Location)zze.zzf(paramAnonymouszzd));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      this.zzapq.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setTrafficEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzapq.setTrafficEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void snapshot(SnapshotReadyCallback paramSnapshotReadyCallback)
  {
    snapshot(paramSnapshotReadyCallback, null);
  }

  public final void snapshot(final SnapshotReadyCallback paramSnapshotReadyCallback, Bitmap paramBitmap)
  {
    zzd localzzd;
    if (paramBitmap != null)
      localzzd = zze.zzn(paramBitmap);
    while (true)
    {
      zze localzze = (zze)localzzd;
      try
      {
        this.zzapq.snapshot(new zzv.zza()
        {
          public void onSnapshotReady(Bitmap paramAnonymousBitmap)
            throws RemoteException
          {
            paramSnapshotReadyCallback.onSnapshotReady(paramAnonymousBitmap);
          }

          public void zzh(zzd paramAnonymouszzd)
            throws RemoteException
          {
            paramSnapshotReadyCallback.onSnapshotReady((Bitmap)zze.zzf(paramAnonymouszzd));
          }
        }
        , localzze);
        return;
        localzzd = null;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  public final void stopAnimation()
  {
    try
    {
      this.zzapq.stopAnimation();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  IGoogleMapDelegate zzqg()
  {
    return this.zzapq;
  }

  public static abstract interface CancelableCallback
  {
    public abstract void onCancel();

    public abstract void onFinish();
  }

  public static abstract interface InfoWindowAdapter
  {
    public abstract View getInfoContents(Marker paramMarker);

    public abstract View getInfoWindow(Marker paramMarker);
  }

  public static abstract interface OnCameraChangeListener
  {
    public abstract void onCameraChange(CameraPosition paramCameraPosition);
  }

  public static abstract interface OnIndoorStateChangeListener
  {
    public abstract void onIndoorBuildingFocused();

    public abstract void onIndoorLevelActivated(IndoorBuilding paramIndoorBuilding);
  }

  public static abstract interface OnInfoWindowClickListener
  {
    public abstract void onInfoWindowClick(Marker paramMarker);
  }

  public static abstract interface OnMapClickListener
  {
    public abstract void onMapClick(LatLng paramLatLng);
  }

  public static abstract interface OnMapLoadedCallback
  {
    public abstract void onMapLoaded();
  }

  public static abstract interface OnMapLongClickListener
  {
    public abstract void onMapLongClick(LatLng paramLatLng);
  }

  public static abstract interface OnMarkerClickListener
  {
    public abstract boolean onMarkerClick(Marker paramMarker);
  }

  public static abstract interface OnMarkerDragListener
  {
    public abstract void onMarkerDrag(Marker paramMarker);

    public abstract void onMarkerDragEnd(Marker paramMarker);

    public abstract void onMarkerDragStart(Marker paramMarker);
  }

  public static abstract interface OnMyLocationButtonClickListener
  {
    public abstract boolean onMyLocationButtonClick();
  }

  @Deprecated
  public static abstract interface OnMyLocationChangeListener
  {
    public abstract void onMyLocationChange(Location paramLocation);
  }

  public static abstract interface SnapshotReadyCallback
  {
    public abstract void onSnapshotReady(Bitmap paramBitmap);
  }

  private static final class zza extends zzb.zza
  {
    private final GoogleMap.CancelableCallback zzapI;

    zza(GoogleMap.CancelableCallback paramCancelableCallback)
    {
      this.zzapI = paramCancelableCallback;
    }

    public void onCancel()
    {
      this.zzapI.onCancel();
    }

    public void onFinish()
    {
      this.zzapI.onFinish();
    }
  }
}