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
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.IStreetViewPanoramaFragmentDelegate;
import com.google.android.gms.maps.internal.StreetViewLifecycleDelegate;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.internal.zzu.zza;
import com.google.android.gms.maps.internal.zzw;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SupportStreetViewPanoramaFragment extends Fragment
{
  private final zzb zzaqJ = new zzb(this);
  private StreetViewPanorama zzaqq;

  public static SupportStreetViewPanoramaFragment newInstance()
  {
    return new SupportStreetViewPanoramaFragment();
  }

  public static SupportStreetViewPanoramaFragment newInstance(StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
  {
    SupportStreetViewPanoramaFragment localSupportStreetViewPanoramaFragment = new SupportStreetViewPanoramaFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("StreetViewPanoramaOptions", paramStreetViewPanoramaOptions);
    localSupportStreetViewPanoramaFragment.setArguments(localBundle);
    return localSupportStreetViewPanoramaFragment;
  }

  @Deprecated
  public final StreetViewPanorama getStreetViewPanorama()
  {
    IStreetViewPanoramaFragmentDelegate localIStreetViewPanoramaFragmentDelegate = zzqv();
    if (localIStreetViewPanoramaFragmentDelegate == null);
    while (true)
    {
      return null;
      try
      {
        IStreetViewPanoramaDelegate localIStreetViewPanoramaDelegate = localIStreetViewPanoramaFragmentDelegate.getStreetViewPanorama();
        if (localIStreetViewPanoramaDelegate == null)
          continue;
        if ((this.zzaqq == null) || (this.zzaqq.zzqu().asBinder() != localIStreetViewPanoramaDelegate.asBinder()))
          this.zzaqq = new StreetViewPanorama(localIStreetViewPanoramaDelegate);
        return this.zzaqq;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
  {
    com.google.android.gms.common.internal.zzx.zzbd("getStreetViewPanoramaAsync() must be called on the main thread");
    this.zzaqJ.getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    if (paramBundle != null)
      paramBundle.setClassLoader(SupportStreetViewPanoramaFragment.class.getClassLoader());
    super.onActivityCreated(paramBundle);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    zzb.zza(this.zzaqJ, paramActivity);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.zzaqJ.onCreate(paramBundle);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return this.zzaqJ.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }

  public void onDestroy()
  {
    this.zzaqJ.onDestroy();
    super.onDestroy();
  }

  public void onDestroyView()
  {
    this.zzaqJ.onDestroyView();
    super.onDestroyView();
  }

  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    zzb.zza(this.zzaqJ, paramActivity);
    Bundle localBundle = new Bundle();
    this.zzaqJ.onInflate(paramActivity, localBundle, paramBundle);
  }

  public void onLowMemory()
  {
    this.zzaqJ.onLowMemory();
    super.onLowMemory();
  }

  public void onPause()
  {
    this.zzaqJ.onPause();
    super.onPause();
  }

  public void onResume()
  {
    super.onResume();
    this.zzaqJ.onResume();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (paramBundle != null)
      paramBundle.setClassLoader(SupportStreetViewPanoramaFragment.class.getClassLoader());
    super.onSaveInstanceState(paramBundle);
    this.zzaqJ.onSaveInstanceState(paramBundle);
  }

  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }

  protected IStreetViewPanoramaFragmentDelegate zzqv()
  {
    this.zzaqJ.zzqs();
    if (this.zzaqJ.zzlg() == null)
      return null;
    return ((zza)this.zzaqJ.zzlg()).zzqv();
  }

  static class zza
    implements StreetViewLifecycleDelegate
  {
    private final Fragment zzPt;
    private final IStreetViewPanoramaFragmentDelegate zzaqr;

    public zza(Fragment paramFragment, IStreetViewPanoramaFragmentDelegate paramIStreetViewPanoramaFragmentDelegate)
    {
      this.zzaqr = ((IStreetViewPanoramaFragmentDelegate)com.google.android.gms.common.internal.zzx.zzl(paramIStreetViewPanoramaFragmentDelegate));
      this.zzPt = ((Fragment)com.google.android.gms.common.internal.zzx.zzl(paramFragment));
    }

    public void getStreetViewPanoramaAsync(final OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      try
      {
        this.zzaqr.getStreetViewPanoramaAsync(new zzu.zza()
        {
          public void zza(IStreetViewPanoramaDelegate paramAnonymousIStreetViewPanoramaDelegate)
            throws RemoteException
          {
            paramOnStreetViewPanoramaReadyCallback.onStreetViewPanoramaReady(new StreetViewPanorama(paramAnonymousIStreetViewPanoramaDelegate));
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
        if ((localBundle != null) && (localBundle.containsKey("StreetViewPanoramaOptions")))
          zzw.zza(paramBundle, "StreetViewPanoramaOptions", localBundle.getParcelable("StreetViewPanoramaOptions"));
        this.zzaqr.onCreate(paramBundle);
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
        zzd localzzd = this.zzaqr.onCreateView(zze.zzn(paramLayoutInflater), zze.zzn(paramViewGroup), paramBundle);
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
        this.zzaqr.onDestroy();
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
        this.zzaqr.onDestroyView();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      try
      {
        this.zzaqr.onInflate(zze.zzn(paramActivity), null, paramBundle2);
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
        this.zzaqr.onLowMemory();
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
        this.zzaqr.onPause();
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
        this.zzaqr.onResume();
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
        this.zzaqr.onSaveInstanceState(paramBundle);
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

    public IStreetViewPanoramaFragmentDelegate zzqv()
    {
      return this.zzaqr;
    }
  }

  static class zzb extends zza<SupportStreetViewPanoramaFragment.zza>
  {
    private final Fragment zzPt;
    protected zzf<SupportStreetViewPanoramaFragment.zza> zzaqa;
    private final List<OnStreetViewPanoramaReadyCallback> zzaqu = new ArrayList();
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

    public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      if (zzlg() != null)
      {
        ((SupportStreetViewPanoramaFragment.zza)zzlg()).getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
        return;
      }
      this.zzaqu.add(paramOnStreetViewPanoramaReadyCallback);
    }

    protected void zza(zzf<SupportStreetViewPanoramaFragment.zza> paramzzf)
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
        IStreetViewPanoramaFragmentDelegate localIStreetViewPanoramaFragmentDelegate = com.google.android.gms.maps.internal.zzx.zzac(this.zzoi).zzk(zze.zzn(this.zzoi));
        this.zzaqa.zza(new SupportStreetViewPanoramaFragment.zza(this.zzPt, localIStreetViewPanoramaFragmentDelegate));
        Iterator localIterator = this.zzaqu.iterator();
        while (localIterator.hasNext())
        {
          OnStreetViewPanoramaReadyCallback localOnStreetViewPanoramaReadyCallback = (OnStreetViewPanoramaReadyCallback)localIterator.next();
          ((SupportStreetViewPanoramaFragment.zza)zzlg()).getStreetViewPanoramaAsync(localOnStreetViewPanoramaReadyCallback);
        }
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
        this.zzaqu.clear();
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
      }
    }
  }
}