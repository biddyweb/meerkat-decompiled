package com.google.android.gms.wallet.fragment;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.FrameLayout;
import com.google.android.gms.R.string;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.dynamic.zza;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzf;
import com.google.android.gms.dynamic.zzh;
import com.google.android.gms.internal.zzwb;
import com.google.android.gms.internal.zzwc.zza;
import com.google.android.gms.internal.zzwj;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;

public final class SupportWalletFragment extends Fragment
{
  private boolean mCreated = false;
  private final Fragment zzPt = this;
  private MaskedWallet zzaEA;
  private Boolean zzaEB;
  private zzb zzaEt;
  private final zzh zzaEu = zzh.zza(this);
  private final zzc zzaEv = new zzc(null);
  private zza zzaEw = new zza(this);
  private WalletFragmentOptions zzaEx;
  private WalletFragmentInitParams zzaEy;
  private MaskedWalletRequest zzaEz;

  public static SupportWalletFragment newInstance(WalletFragmentOptions paramWalletFragmentOptions)
  {
    SupportWalletFragment localSupportWalletFragment = new SupportWalletFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("extraWalletFragmentOptions", paramWalletFragmentOptions);
    localSupportWalletFragment.zzPt.setArguments(localBundle);
    return localSupportWalletFragment;
  }

  public int getState()
  {
    if (this.zzaEt != null)
      return zzb.zza(this.zzaEt);
    return 0;
  }

  public void initialize(WalletFragmentInitParams paramWalletFragmentInitParams)
  {
    if (this.zzaEt != null)
    {
      zzb.zza(this.zzaEt, paramWalletFragmentInitParams);
      this.zzaEy = null;
    }
    do
    {
      return;
      if (this.zzaEy != null)
        break;
      this.zzaEy = paramWalletFragmentInitParams;
      if (this.zzaEz != null)
        Log.w("SupportWalletFragment", "updateMaskedWalletRequest() was called before initialize()");
    }
    while (this.zzaEA == null);
    Log.w("SupportWalletFragment", "updateMaskedWallet() was called before initialize()");
    return;
    Log.w("SupportWalletFragment", "initialize(WalletFragmentInitParams) was called more than once. Ignoring.");
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (this.zzaEt != null)
      zzb.zza(this.zzaEt, paramInt1, paramInt2, paramIntent);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (paramBundle != null)
    {
      paramBundle.setClassLoader(WalletFragmentOptions.class.getClassLoader());
      WalletFragmentInitParams localWalletFragmentInitParams = (WalletFragmentInitParams)paramBundle.getParcelable("walletFragmentInitParams");
      if (localWalletFragmentInitParams != null)
      {
        if (this.zzaEy != null)
          Log.w("SupportWalletFragment", "initialize(WalletFragmentInitParams) was called more than once.Ignoring.");
        this.zzaEy = localWalletFragmentInitParams;
      }
      if (this.zzaEz == null)
        this.zzaEz = ((MaskedWalletRequest)paramBundle.getParcelable("maskedWalletRequest"));
      if (this.zzaEA == null)
        this.zzaEA = ((MaskedWallet)paramBundle.getParcelable("maskedWallet"));
      if (paramBundle.containsKey("walletFragmentOptions"))
        this.zzaEx = ((WalletFragmentOptions)paramBundle.getParcelable("walletFragmentOptions"));
      if (paramBundle.containsKey("enabled"))
        this.zzaEB = Boolean.valueOf(paramBundle.getBoolean("enabled"));
    }
    while (true)
    {
      this.mCreated = true;
      this.zzaEv.onCreate(paramBundle);
      return;
      if (this.zzPt.getArguments() != null)
      {
        WalletFragmentOptions localWalletFragmentOptions = (WalletFragmentOptions)this.zzPt.getArguments().getParcelable("extraWalletFragmentOptions");
        if (localWalletFragmentOptions != null)
        {
          localWalletFragmentOptions.zzao(this.zzPt.getActivity());
          this.zzaEx = localWalletFragmentOptions;
        }
      }
    }
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return this.zzaEv.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }

  public void onDestroy()
  {
    super.onDestroy();
    this.mCreated = false;
  }

  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    if (this.zzaEx == null)
      this.zzaEx = WalletFragmentOptions.zza(paramActivity, paramAttributeSet);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("attrKeyWalletFragmentOptions", this.zzaEx);
    this.zzaEv.onInflate(paramActivity, localBundle, paramBundle);
  }

  public void onPause()
  {
    super.onPause();
    this.zzaEv.onPause();
  }

  public void onResume()
  {
    super.onResume();
    this.zzaEv.onResume();
    FragmentManager localFragmentManager = this.zzPt.getActivity().getSupportFragmentManager();
    Fragment localFragment = localFragmentManager.findFragmentByTag("GooglePlayServicesErrorDialog");
    if (localFragment != null)
    {
      localFragmentManager.beginTransaction().remove(localFragment).commit();
      GooglePlayServicesUtil.showErrorDialogFragment(GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.zzPt.getActivity()), this.zzPt.getActivity(), -1);
    }
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.setClassLoader(WalletFragmentOptions.class.getClassLoader());
    this.zzaEv.onSaveInstanceState(paramBundle);
    if (this.zzaEy != null)
    {
      paramBundle.putParcelable("walletFragmentInitParams", this.zzaEy);
      this.zzaEy = null;
    }
    if (this.zzaEz != null)
    {
      paramBundle.putParcelable("maskedWalletRequest", this.zzaEz);
      this.zzaEz = null;
    }
    if (this.zzaEA != null)
    {
      paramBundle.putParcelable("maskedWallet", this.zzaEA);
      this.zzaEA = null;
    }
    if (this.zzaEx != null)
    {
      paramBundle.putParcelable("walletFragmentOptions", this.zzaEx);
      this.zzaEx = null;
    }
    if (this.zzaEB != null)
    {
      paramBundle.putBoolean("enabled", this.zzaEB.booleanValue());
      this.zzaEB = null;
    }
  }

  public void onStart()
  {
    super.onStart();
    this.zzaEv.onStart();
  }

  public void onStop()
  {
    super.onStop();
    this.zzaEv.onStop();
  }

  public void setEnabled(boolean paramBoolean)
  {
    if (this.zzaEt != null)
    {
      zzb.zza(this.zzaEt, paramBoolean);
      this.zzaEB = null;
      return;
    }
    this.zzaEB = Boolean.valueOf(paramBoolean);
  }

  public void setOnStateChangedListener(OnStateChangedListener paramOnStateChangedListener)
  {
    this.zzaEw.zza(paramOnStateChangedListener);
  }

  public void updateMaskedWallet(MaskedWallet paramMaskedWallet)
  {
    if (this.zzaEt != null)
    {
      zzb.zza(this.zzaEt, paramMaskedWallet);
      this.zzaEA = null;
      return;
    }
    this.zzaEA = paramMaskedWallet;
  }

  public void updateMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
  {
    if (this.zzaEt != null)
    {
      zzb.zza(this.zzaEt, paramMaskedWalletRequest);
      this.zzaEz = null;
      return;
    }
    this.zzaEz = paramMaskedWalletRequest;
  }

  public static abstract interface OnStateChangedListener
  {
    public abstract void onStateChanged(SupportWalletFragment paramSupportWalletFragment, int paramInt1, int paramInt2, Bundle paramBundle);
  }

  static class zza extends zzwc.zza
  {
    private SupportWalletFragment.OnStateChangedListener zzaEC;
    private final SupportWalletFragment zzaED;

    zza(SupportWalletFragment paramSupportWalletFragment)
    {
      this.zzaED = paramSupportWalletFragment;
    }

    public void zza(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      if (this.zzaEC != null)
        this.zzaEC.onStateChanged(this.zzaED, paramInt1, paramInt2, paramBundle);
    }

    public void zza(SupportWalletFragment.OnStateChangedListener paramOnStateChangedListener)
    {
      this.zzaEC = paramOnStateChangedListener;
    }
  }

  private static class zzb
    implements LifecycleDelegate
  {
    private final zzwb zzaEE;

    private zzb(zzwb paramzzwb)
    {
      this.zzaEE = paramzzwb;
    }

    private int getState()
    {
      try
      {
        int i = this.zzaEE.getState();
        return i;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    private void initialize(WalletFragmentInitParams paramWalletFragmentInitParams)
    {
      try
      {
        this.zzaEE.initialize(paramWalletFragmentInitParams);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    private void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
    {
      try
      {
        this.zzaEE.onActivityResult(paramInt1, paramInt2, paramIntent);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    private void setEnabled(boolean paramBoolean)
    {
      try
      {
        this.zzaEE.setEnabled(paramBoolean);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    private void updateMaskedWallet(MaskedWallet paramMaskedWallet)
    {
      try
      {
        this.zzaEE.updateMaskedWallet(paramMaskedWallet);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    private void updateMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
    {
      try
      {
        this.zzaEE.updateMaskedWalletRequest(paramMaskedWalletRequest);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onCreate(Bundle paramBundle)
    {
      try
      {
        this.zzaEE.onCreate(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      try
      {
        View localView = (View)zze.zzf(this.zzaEE.onCreateView(zze.zzn(paramLayoutInflater), zze.zzn(paramViewGroup), paramBundle));
        return localView;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onDestroy()
    {
    }

    public void onDestroyView()
    {
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      WalletFragmentOptions localWalletFragmentOptions = (WalletFragmentOptions)paramBundle1.getParcelable("extraWalletFragmentOptions");
      try
      {
        this.zzaEE.zza(zze.zzn(paramActivity), localWalletFragmentOptions, paramBundle2);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onLowMemory()
    {
    }

    public void onPause()
    {
      try
      {
        this.zzaEE.onPause();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onResume()
    {
      try
      {
        this.zzaEE.onResume();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onSaveInstanceState(Bundle paramBundle)
    {
      try
      {
        this.zzaEE.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onStart()
    {
      try
      {
        this.zzaEE.onStart();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }

    public void onStop()
    {
      try
      {
        this.zzaEE.onStop();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeException(localRemoteException);
      }
    }
  }

  private class zzc extends zza<SupportWalletFragment.zzb>
    implements View.OnClickListener
  {
    private zzc()
    {
    }

    public void onClick(View paramView)
    {
      FragmentActivity localFragmentActivity = SupportWalletFragment.zza(SupportWalletFragment.this).getActivity();
      GooglePlayServicesUtil.showErrorDialogFragment(GooglePlayServicesUtil.isGooglePlayServicesAvailable(localFragmentActivity), localFragmentActivity, -1);
    }

    protected void zza(FrameLayout paramFrameLayout)
    {
      Button localButton = new Button(SupportWalletFragment.zza(SupportWalletFragment.this).getActivity());
      localButton.setText(R.string.wallet_buy_button_place_holder);
      int i = -1;
      int j = -2;
      if (SupportWalletFragment.zze(SupportWalletFragment.this) != null)
      {
        WalletFragmentStyle localWalletFragmentStyle = SupportWalletFragment.zze(SupportWalletFragment.this).getFragmentStyle();
        if (localWalletFragmentStyle != null)
        {
          DisplayMetrics localDisplayMetrics = SupportWalletFragment.zza(SupportWalletFragment.this).getResources().getDisplayMetrics();
          i = localWalletFragmentStyle.zza("buyButtonWidth", localDisplayMetrics, i);
          j = localWalletFragmentStyle.zza("buyButtonHeight", localDisplayMetrics, j);
        }
      }
      localButton.setLayoutParams(new ViewGroup.LayoutParams(i, j));
      localButton.setOnClickListener(this);
      paramFrameLayout.addView(localButton);
    }

    protected void zza(zzf<SupportWalletFragment.zzb> paramzzf)
    {
      FragmentActivity localFragmentActivity = SupportWalletFragment.zza(SupportWalletFragment.this).getActivity();
      if ((SupportWalletFragment.zzb(SupportWalletFragment.this) == null) && (SupportWalletFragment.zzc(SupportWalletFragment.this)) && (localFragmentActivity != null));
      try
      {
        zzwb localzzwb = zzwj.zza(localFragmentActivity, SupportWalletFragment.zzd(SupportWalletFragment.this), SupportWalletFragment.zze(SupportWalletFragment.this), SupportWalletFragment.zzf(SupportWalletFragment.this));
        SupportWalletFragment.zza(SupportWalletFragment.this, new SupportWalletFragment.zzb(localzzwb, null));
        SupportWalletFragment.zza(SupportWalletFragment.this, null);
        paramzzf.zza(SupportWalletFragment.zzb(SupportWalletFragment.this));
        if (SupportWalletFragment.zzg(SupportWalletFragment.this) != null)
        {
          SupportWalletFragment.zzb.zza(SupportWalletFragment.zzb(SupportWalletFragment.this), SupportWalletFragment.zzg(SupportWalletFragment.this));
          SupportWalletFragment.zza(SupportWalletFragment.this, null);
        }
        if (SupportWalletFragment.zzh(SupportWalletFragment.this) != null)
        {
          SupportWalletFragment.zzb.zza(SupportWalletFragment.zzb(SupportWalletFragment.this), SupportWalletFragment.zzh(SupportWalletFragment.this));
          SupportWalletFragment.zza(SupportWalletFragment.this, null);
        }
        if (SupportWalletFragment.zzi(SupportWalletFragment.this) != null)
        {
          SupportWalletFragment.zzb.zza(SupportWalletFragment.zzb(SupportWalletFragment.this), SupportWalletFragment.zzi(SupportWalletFragment.this));
          SupportWalletFragment.zza(SupportWalletFragment.this, null);
        }
        if (SupportWalletFragment.zzj(SupportWalletFragment.this) != null)
        {
          SupportWalletFragment.zzb.zza(SupportWalletFragment.zzb(SupportWalletFragment.this), SupportWalletFragment.zzj(SupportWalletFragment.this).booleanValue());
          SupportWalletFragment.zza(SupportWalletFragment.this, null);
        }
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
      }
    }
  }
}