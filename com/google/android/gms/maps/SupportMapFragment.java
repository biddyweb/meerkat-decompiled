package com.google.android.gms.maps;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.v4.app.Fragment;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzf;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapFragmentDelegate;
import com.google.android.gms.maps.internal.MapLifecycleDelegate;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.internal.zzm.zza;
import com.google.android.gms.maps.internal.zzw;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SupportMapFragment extends Fragment
{
  private GoogleMap zzapW;
  private final zzb zzaqH = new zzb(this);

  public static SupportMapFragment newInstance()
  {
    return new SupportMapFragment();
  }

  public static SupportMapFragment newInstance(GoogleMapOptions paramGoogleMapOptions)
  {
    SupportMapFragment localSupportMapFragment = new SupportMapFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", paramGoogleMapOptions);
    localSupportMapFragment.setArguments(localBundle);
    return localSupportMapFragment;
  }

  @Deprecated
  public final GoogleMap getMap()
  {
    IMapFragmentDelegate localIMapFragmentDelegate = zzqr();
    if (localIMapFragmentDelegate == null);
    while (true)
    {
      return null;
      try
      {
        IGoogleMapDelegate localIGoogleMapDelegate = localIMapFragmentDelegate.getMap();
        if (localIGoogleMapDelegate == null)
          continue;
        if ((this.zzapW == null) || (this.zzapW.zzqg().asBinder() != localIGoogleMapDelegate.asBinder()))
          this.zzapW = new GoogleMap(localIGoogleMapDelegate);
        return this.zzapW;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
  {
    com.google.android.gms.common.internal.zzx.zzbd("getMapAsync must be called on the main thread.");
    this.zzaqH.getMapAsync(paramOnMapReadyCallback);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    if (paramBundle != null)
      paramBundle.setClassLoader(SupportMapFragment.class.getClassLoader());
    super.onActivityCreated(paramBundle);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    zzb.zza(this.zzaqH, paramActivity);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.zzaqH.onCreate(paramBundle);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return this.zzaqH.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }

  public void onDestroy()
  {
    this.zzaqH.onDestroy();
    super.onDestroy();
  }

  public void onDestroyView()
  {
    this.zzaqH.onDestroyView();
    super.onDestroyView();
  }

  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    zzb.zza(this.zzaqH, paramActivity);
    GoogleMapOptions localGoogleMapOptions = GoogleMapOptions.createFromAttributes(paramActivity, paramAttributeSet);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", localGoogleMapOptions);
    this.zzaqH.onInflate(paramActivity, localBundle, paramBundle);
  }

  public void onLowMemory()
  {
    this.zzaqH.onLowMemory();
    super.onLowMemory();
  }

  public void onPause()
  {
    this.zzaqH.onPause();
    super.onPause();
  }

  public void onResume()
  {
    super.onResume();
    this.zzaqH.onResume();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (paramBundle != null)
      paramBundle.setClassLoader(SupportMapFragment.class.getClassLoader());
    super.onSaveInstanceState(paramBundle);
    this.zzaqH.onSaveInstanceState(paramBundle);
  }

  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }

  protected IMapFragmentDelegate zzqr()
  {
    this.zzaqH.zzqs();
    if (this.zzaqH.zzlg() == null)
      return null;
    return ((zza)this.zzaqH.zzlg()).zzqr();
  }

  static class zza
    implements MapLifecycleDelegate
  {
    private final Fragment zzPt;
    private final IMapFragmentDelegate zzapX;

    public zza(Fragment paramFragment, IMapFragmentDelegate paramIMapFragmentDelegate)
    {
      this.zzapX = ((IMapFragmentDelegate)com.google.android.gms.common.internal.zzx.zzl(paramIMapFragmentDelegate));
      this.zzPt = ((Fragment)com.google.android.gms.common.internal.zzx.zzl(paramFragment));
    }

    public void getMapAsync(final OnMapReadyCallback paramOnMapReadyCallback)
    {
      try
      {
        this.zzapX.getMapAsync(new zzm.zza()
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
      if (paramBundle == null);
      try
      {
        paramBundle = new Bundle();
        Bundle localBundle = this.zzPt.getArguments();
        if ((localBundle != null) && (localBundle.containsKey("MapOptions")))
          zzw.zza(paramBundle, "MapOptions", localBundle.getParcelable("MapOptions"));
        this.zzapX.onCreate(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      try
      {
        zzd localzzd = this.zzapX.onCreateView(zze.zzn(paramLayoutInflater), zze.zzn(paramViewGroup), paramBundle);
        return (View)zze.zzf(localzzd);
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroy()
    {
      try
      {
        this.zzapX.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroyView()
    {
      try
      {
        this.zzapX.onDestroyView();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      GoogleMapOptions localGoogleMapOptions = (GoogleMapOptions)paramBundle1.getParcelable("MapOptions");
      try
      {
        this.zzapX.onInflate(zze.zzn(paramActivity), localGoogleMapOptions, paramBundle2);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onLowMemory()
    {
      try
      {
        this.zzapX.onLowMemory();
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
        this.zzapX.onPause();
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
        this.zzapX.onResume();
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
        this.zzapX.onSaveInstanceState(paramBundle);
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

    public IMapFragmentDelegate zzqr()
    {
      return this.zzapX;
    }
  }

  static class zzb extends zza<SupportMapFragment.zza>
  {
    private final Fragment zzPt;
    protected zzf<SupportMapFragment.zza> zzaqa;
    private final List<OnMapReadyCallback> zzaqb = new ArrayList();
    private Activity zzoi;

    zzb(Fragment paramFragment)
    {
      this.zzPt = paramFragment;
    }

    private void setActivity(Activity paramActivity)
    {
      this.zzoi = paramActivity;
      zzqs();
    }

    public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
    {
      if (zzlg() != null)
      {
        ((SupportMapFragment.zza)zzlg()).getMapAsync(paramOnMapReadyCallback);
        return;
      }
      this.zzaqb.add(paramOnMapReadyCallback);
    }

    protected void zza(zzf<SupportMapFragment.zza> paramzzf)
    {
      this.zzaqa = paramzzf;
      zzqs();
    }

    public void zzqs()
    {
      if ((this.zzoi != null) && (this.zzaqa != null) && (zzlg() == null));
      try
      {
        MapsInitializer.initialize(this.zzoi);
        IMapFragmentDelegate localIMapFragmentDelegate = com.google.android.gms.maps.internal.zzx.zzac(this.zzoi).zzj(zze.zzn(this.zzoi));
        this.zzaqa.zza(new SupportMapFragment.zza(this.zzPt, localIMapFragmentDelegate));
        Iterator localIterator = this.zzaqb.iterator();
        while (localIterator.hasNext())
        {
          OnMapReadyCallback localOnMapReadyCallback = (OnMapReadyCallback)localIterator.next();
          ((SupportMapFragment.zza)zzlg()).getMapAsync(localOnMapReadyCallback);
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