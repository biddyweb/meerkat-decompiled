package com.google.android.gms.maps;

import android.os.RemoteException;
import com.google.android.gms.maps.internal.IUiSettingsDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class UiSettings
{
  private final IUiSettingsDelegate zzaqL;

  UiSettings(IUiSettingsDelegate paramIUiSettingsDelegate)
  {
    this.zzaqL = paramIUiSettingsDelegate;
  }

  public boolean isCompassEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isCompassEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isIndoorLevelPickerEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isIndoorLevelPickerEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isMapToolbarEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isMapToolbarEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isMyLocationButtonEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isMyLocationButtonEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isRotateGesturesEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isRotateGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isScrollGesturesEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isScrollGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isTiltGesturesEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isTiltGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isZoomControlsEnabled()
  {
    try
    {
      boolean bool = this.zzaqL.isZoomControlsEnabled();
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
      boolean bool = this.zzaqL.isZoomGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setAllGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setAllGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setCompassEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setCompassEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setIndoorLevelPickerEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setIndoorLevelPickerEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setMapToolbarEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setMapToolbarEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setMyLocationButtonEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setMyLocationButtonEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setRotateGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setRotateGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setScrollGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setScrollGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setTiltGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setTiltGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setZoomControlsEnabled(boolean paramBoolean)
  {
    try
    {
      this.zzaqL.setZoomControlsEnabled(paramBoolean);
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
      this.zzaqL.setZoomGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}