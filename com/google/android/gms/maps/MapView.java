package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.zza;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzf;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.MapLifecycleDelegate;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.internal.zzm.zza;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MapView extends FrameLayout
{
  private GoogleMap zzapW;
  private final zzb zzaqc;

  public MapView(Context paramContext)
  {
    super(paramContext);
    this.zzaqc = new zzb(this, paramContext, null);
  }

  public MapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.zzaqc = new zzb(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }

  public MapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.zzaqc = new zzb(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }

  public MapView(Context paramContext, GoogleMapOptions paramGoogleMapOptions)
  {
    super(paramContext);
    this.zzaqc = new zzb(this, paramContext, paramGoogleMapOptions);
  }

  @Deprecated
  public final GoogleMap getMap()
  {
    if (this.zzapW != null)
      return this.zzapW;
    this.zzaqc.zzqs();
    if (this.zzaqc.zzlg() == null)
      return null;
    try
    {
      this.zzapW = new GoogleMap(((zza)this.zzaqc.zzlg()).zzqt().getMap());
      return this.zzapW;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
  {
    com.google.android.gms.common.internal.zzx.zzbd("getMapAsync() must be called on the main thread");
    this.zzaqc.getMapAsync(paramOnMapReadyCallback);
  }

  public final void onCreate(Bundle paramBundle)
  {
    this.zzaqc.onCreate(paramBundle);
    if (this.zzaqc.zzlg() == null)
      zza.zzb(this);
  }

  public final void onDestroy()
  {
    this.zzaqc.onDestroy();
  }

  public final void onLowMemory()
  {
    this.zzaqc.onLowMemory();
  }

  public final void onPause()
  {
    this.zzaqc.onPause();
  }

  public final void onResume()
  {
    this.zzaqc.onResume();
  }

  public final void onSaveInstanceState(Bundle paramBundle)
  {
    this.zzaqc.onSaveInstanceState(paramBundle);
  }

  static class zza
    implements MapLifecycleDelegate
  {
    private final ViewGroup zzaqd;
    private final IMapViewDelegate zzaqe;
    private View zzaqf;

    public zza(ViewGroup paramViewGroup, IMapViewDelegate paramIMapViewDelegate)
    {
      this.zzaqe = ((IMapViewDelegate)com.google.android.gms.common.internal.zzx.zzl(paramIMapViewDelegate));
      this.zzaqd = ((ViewGroup)com.google.android.gms.common.internal.zzx.zzl(paramViewGroup));
    }

    public void getMapAsync(final OnMapReadyCallback paramOnMapReadyCallback)
    {
      try
      {
        this.zzaqe.getMapAsync(new zzm.zza()
        {
          public void zza(IGoogleMapDelegate paramAnonymousIGoogleMapDelegate)
            throws RemoteException
          {
            paramOnMapReadyCallback.onMapReady(new GoogleMap(paramAnonymousIGoogleMapDelegate));
          }
        });
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onCreate(Bundle paramBundle)
    {
      try
      {
        this.zzaqe.onCreate(paramBundle);
        this.zzaqf = ((View)zze.zzf(this.zzaqe.getView()));
        this.zzaqd.removeAllViews();
        this.zzaqd.addView(this.zzaqf);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
    }

    public void onDestroy()
    {
      try
      {
        this.zzaqe.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
    }

    public void onLowMemory()
    {
      try
      {
        this.zzaqe.onLowMemory();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onPause()
    {
      try
      {
        this.zzaqe.onPause();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onResume()
    {
      try
      {
        this.zzaqe.onResume();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onSaveInstanceState(Bundle paramBundle)
    {
      try
      {
        this.zzaqe.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onStart()
    {
    }

    public void onStop()
    {
    }

    public IMapViewDelegate zzqt()
    {
      return this.zzaqe;
    }
  }

  static class zzb extends zza<MapView.zza>
  {
    private final Context mContext;
    protected zzf<MapView.zza> zzaqa;
    private final List<OnMapReadyCallback> zzaqb = new ArrayList();
    private final ViewGroup zzaqh;
    private final GoogleMapOptions zzaqi;

    zzb(ViewGroup paramViewGroup, Context paramContext, GoogleMapOptions paramGoogleMapOptions)
    {
      this.zzaqh = paramViewGroup;
      this.mContext = paramContext;
      this.zzaqi = paramGoogleMapOptions;
    }

    public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
    {
      if (zzlg() != null)
      {
        ((MapView.zza)zzlg()).getMapAsync(paramOnMapReadyCallback);
        return;
      }
      this.zzaqb.add(paramOnMapReadyCallback);
    }

    protected void zza(zzf<MapView.zza> paramzzf)
    {
      this.zzaqa = paramzzf;
      zzqs();
    }

    public void zzqs()
    {
      if ((this.zzaqa != null) && (zzlg() == null));
      try
      {
        IMapViewDelegate localIMapViewDelegate = com.google.android.gms.maps.internal.zzx.zzac(this.mContext).zza(zze.zzn(this.mContext), this.zzaqi);
        this.zzaqa.zza(new MapView.zza(this.zzaqh, localIMapViewDelegate));
        Iterator localIterator = this.zzaqb.iterator();
        while (localIterator.hasNext())
        {
          OnMapReadyCallback localOnMapReadyCallback = (OnMapReadyCallback)localIterator.next();
          ((MapView.zza)zzlg()).getMapAsync(localOnMapReadyCallback);
        }
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
        this.zzaqb.clear();
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
      }
    }
  }
}