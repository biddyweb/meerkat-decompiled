package com.google.android.gms.maps.model;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.model.internal.zzl;

public final class Marker
{
  private final zzl zzars;

  public Marker(zzl paramzzl)
  {
    this.zzars = ((zzl)zzx.zzl(paramzzl));
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Marker))
      return false;
    try
    {
      boolean bool = this.zzars.zzh(((Marker)paramObject).zzars);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public float getAlpha()
  {
    try
    {
      float f = this.zzars.getAlpha();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getId()
  {
    try
    {
      String str = this.zzars.getId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public LatLng getPosition()
  {
    try
    {
      LatLng localLatLng = this.zzars.getPosition();
      return localLatLng;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public float getRotation()
  {
    try
    {
      float f = this.zzars.getRotation();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getSnippet()
  {
    try
    {
      String str = this.zzars.getSnippet();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getTitle()
  {
    try
    {
      String str = this.zzars.getTitle();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int hashCode()
  {
    try
    {
      int i = this.zzars.hashCodeRemote();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void hideInfoWindow()
  {
    try
    {
      this.zzars.hideInfoWindow();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isDraggable()
  {
    try
    {
      boolean bool = this.zzars.isDraggable();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isFlat()
  {
    try
    {
      boolean bool = this.zzars.isFlat();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isInfoWindowShown()
  {
    try
    {
      boolean bool = this.zzars.isInfoWindowShown();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isVisible()
  {
    try
    {
      boolean bool = this.zzars.isVisible();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void remove()
  {
    try
    {
      this.zzars.remove();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setAlpha(float paramFloat)
  {
    try
    {
      this.zzars.setAlpha(paramFloat);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setAnchor(float paramFloat1, float paramFloat2)
  {
    try
    {
      this.zzars.setAnchor(paramFloat1, paramFloat2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setDraggable(boolean paramBoolean)
  {
    try
    {
      this.zzars.setDraggable(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setFlat(boolean paramBoolean)
  {
    try
    {
      this.zzars.setFlat(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setIcon(BitmapDescriptor paramBitmapDescriptor)
  {
    try
    {
      this.zzars.zzn(paramBitmapDescriptor.zzqe());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setInfoWindowAnchor(float paramFloat1, float paramFloat2)
  {
    try
    {
      this.zzars.setInfoWindowAnchor(paramFloat1, paramFloat2);
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
      this.zzars.setPosition(paramLatLng);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setRotation(float paramFloat)
  {
    try
    {
      this.zzars.setRotation(paramFloat);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setSnippet(String paramString)
  {
    try
    {
      this.zzars.setSnippet(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setTitle(String paramString)
  {
    try
    {
      this.zzars.setTitle(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setVisible(boolean paramBoolean)
  {
    try
    {
      this.zzars.setVisible(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void showInfoWindow()
  {
    try
    {
      this.zzars.showInfoWindow();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}