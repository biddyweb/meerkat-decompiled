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
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.IStreetViewPanoramaViewDelegate;
import com.google.android.gms.maps.internal.StreetViewLifecycleDelegate;
import com.google.android.gms.maps.internal.zzc;
import com.google.android.gms.maps.internal.zzu.zza;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class StreetViewPanoramaView extends FrameLayout
{
  private final zzb zzaqC;
  private StreetViewPanorama zzaqq;

  public StreetViewPanoramaView(Context paramContext)
  {
    super(paramContext);
    this.zzaqC = new zzb(this, paramContext, null);
  }

  public StreetViewPanoramaView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.zzaqC = new zzb(this, paramContext, null);
  }

  public StreetViewPanoramaView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.zzaqC = new zzb(this, paramContext, null);
  }

  public StreetViewPanoramaView(Context paramContext, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
  {
    super(paramContext);
    this.zzaqC = new zzb(this, paramContext, paramStreetViewPanoramaOptions);
  }

  @Deprecated
  public final StreetViewPanorama getStreetViewPanorama()
  {
    if (this.zzaqq != null)
      return this.zzaqq;
    this.zzaqC.zzqs();
    if (this.zzaqC.zzlg() == null)
      return null;
    try
    {
      this.zzaqq = new StreetViewPanorama(((zza)this.zzaqC.zzlg()).zzqz().getStreetViewPanorama());
      return this.zzaqq;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
  {
    com.google.android.gms.common.internal.zzx.zzbd("getStreetViewPanoramaAsync() must be called on the main thread");
    this.zzaqC.getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
  }

  public final void onCreate(Bundle paramBundle)
  {
    this.zzaqC.onCreate(paramBundle);
    if (this.zzaqC.zzlg() == null)
      zza.zzb(this);
  }

  public final void onDestroy()
  {
    this.zzaqC.onDestroy();
  }

  public final void onLowMemory()
  {
    this.zzaqC.onLowMemory();
  }

  public final void onPause()
  {
    this.zzaqC.onPause();
  }

  public final void onResume()
  {
    this.zzaqC.onResume();
  }

  public final void onSaveInstanceState(Bundle paramBundle)
  {
    this.zzaqC.onSaveInstanceState(paramBundle);
  }

  static class zza
    implements StreetViewLifecycleDelegate
  {
    private final IStreetViewPanoramaViewDelegate zzaqD;
    private View zzaqE;
    private final ViewGroup zzaqd;

    public zza(ViewGroup paramViewGroup, IStreetViewPanoramaViewDelegate paramIStreetViewPanoramaViewDelegate)
    {
      this.zzaqD = ((IStreetViewPanoramaViewDelegate)com.google.android.gms.common.internal.zzx.zzl(paramIStreetViewPanoramaViewDelegate));
      this.zzaqd = ((ViewGroup)com.google.android.gms.common.internal.zzx.zzl(paramViewGroup));
    }

    public void getStreetViewPanoramaAsync(final OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      try
      {
        this.zzaqD.getStreetViewPanoramaAsync(new zzu.zza()
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
      try
      {
        this.zzaqD.onCreate(paramBundle);
        this.zzaqE = ((View)zze.zzf(this.zzaqD.getView()));
        this.zzaqd.removeAllViews();
        this.zzaqd.addView(this.zzaqE);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on StreetViewPanoramaViewDelegate");
    }

    public void onDestroy()
    {
      try
      {
        this.zzaqD.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on StreetViewPanoramaViewDelegate");
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on StreetViewPanoramaViewDelegate");
    }

    public void onLowMemory()
    {
      try
      {
        this.zzaqD.onLowMemory();
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
        this.zzaqD.onPause();
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
        this.zzaqD.onResume();
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
        this.zzaqD.onSaveInstanceState(paramBundle);
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

    public IStreetViewPanoramaViewDelegate zzqz()
    {
      return this.zzaqD;
    }
  }

  static class zzb extends zza<StreetViewPanoramaView.zza>
  {
    private final Context mContext;
    private final StreetViewPanoramaOptions zzaqG;
    protected zzf<StreetViewPanoramaView.zza> zzaqa;
    private final ViewGroup zzaqh;
    private final List<OnStreetViewPanoramaReadyCallback> zzaqu = new ArrayList();

    zzb(ViewGroup paramViewGroup, Context paramContext, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
    {
      this.zzaqh = paramViewGroup;
      this.mContext = paramContext;
      this.zzaqG = paramStreetViewPanoramaOptions;
    }

    public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      if (zzlg() != null)
      {
        ((StreetViewPanoramaView.zza)zzlg()).getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
        return;
      }
      this.zzaqu.add(paramOnStreetViewPanoramaReadyCallback);
    }

    protected void zza(zzf<StreetViewPanoramaView.zza> paramzzf)
    {
      this.zzaqa = paramzzf;
      zzqs();
    }

    public void zzqs()
    {
      if ((this.zzaqa != null) && (zzlg() == null));
      try
      {
        IStreetViewPanoramaViewDelegate localIStreetViewPanoramaViewDelegate = com.google.android.gms.maps.internal.zzx.zzac(this.mContext).zza(zze.zzn(this.mContext), this.zzaqG);
        this.zzaqa.zza(new StreetViewPanoramaView.zza(this.zzaqh, localIStreetViewPanoramaViewDelegate));
        Iterator localIterator = this.zzaqu.iterator();
        while (localIterator.hasNext())
        {
          OnStreetViewPanoramaReadyCallback localOnStreetViewPanoramaReadyCallback = (OnStreetViewPanoramaReadyCallback)localIterator.next();
          ((StreetViewPanoramaView.zza)zzlg()).getStreetViewPanoramaAsync(localOnStreetViewPanoramaReadyCallback);
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