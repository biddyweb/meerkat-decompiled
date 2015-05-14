package com.google.android.gms.maps.model;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.model.internal.zzh;

public final class Circle
{
  private final zzh zzaqV;

  public Circle(zzh paramzzh)
  {
    this.zzaqV = ((zzh)zzx.zzl(paramzzh));
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Circle))
      return false;
    try
    {
      boolean bool = this.zzaqV.zza(((Circle)paramObject).zzaqV);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public LatLng getCenter()
  {
    try
    {
      LatLng localLatLng = this.zzaqV.getCenter();
      return localLatLng;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int getFillColor()
  {
    try
    {
      int i = this.zzaqV.getFillColor();
      return i;
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
      String str = this.zzaqV.getId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public double getRadius()
  {
    try
    {
      double d = this.zzaqV.getRadius();
      return d;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int getStrokeColor()
  {
    try
    {
      int i = this.zzaqV.getStrokeColor();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public float getStrokeWidth()
  {
    try
    {
      float f = this.zzaqV.getStrokeWidth();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public float getZIndex()
  {
    try
    {
      float f = this.zzaqV.getZIndex();
      return f;
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
      int i = this.zzaqV.hashCodeRemote();
      return i;
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
      boolean bool = this.zzaqV.isVisible();
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
      this.zzaqV.remove();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setCenter(LatLng paramLatLng)
  {
    try
    {
      this.zzaqV.setCenter(paramLatLng);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setFillColor(int paramInt)
  {
    try
    {
      this.zzaqV.setFillColor(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setRadius(double paramDouble)
  {
    try
    {
      this.zzaqV.setRadius(paramDouble);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setStrokeColor(int paramInt)
  {
    try
    {
      this.zzaqV.setStrokeColor(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setStrokeWidth(float paramFloat)
  {
    try
    {
      this.zzaqV.setStrokeWidth(paramFloat);
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
      this.zzaqV.setVisible(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setZIndex(float paramFloat)
  {
    try
    {
      this.zzaqV.setZIndex(paramFloat);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}