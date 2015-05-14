package com.google.android.gms.wallet.fragment;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.RemoteException;
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
import com.google.android.gms.dynamic.zzb;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.dynamic.zzf;
import com.google.android.gms.internal.zzwb;
import com.google.android.gms.internal.zzwc.zza;
import com.google.android.gms.internal.zzwj;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;

public final class WalletFragment extends Fragment
{
  private boolean mCreated = false;
  private final Fragment zzXZ = this;
  private MaskedWallet zzaEA;
  private Boolean zzaEB;
  private zzb zzaEG;
  private final zzb zzaEH = zzb.zza(this);
  private final zzc zzaEI = new zzc(null);
  private zza zzaEJ = new zza(this);
  private WalletFragmentOptions zzaEx;
  private WalletFragmentInitParams zzaEy;
  private MaskedWalletRequest zzaEz;

  public static WalletFragment newInstance(WalletFragmentOptions paramWalletFragmentOptions)
  {
    WalletFragment localWalletFragment = new WalletFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("extraWalletFragmentOptions", paramWalletFragmentOptions);
    localWalletFragment.zzXZ.setArguments(localBundle);
    return localWalletFragment;
  }

  public int getState()
  {
    if (this.zzaEG != null)
      return zzb.zza(this.zzaEG);
    return 0;
  }

  public void initialize(WalletFragmentInitParams paramWalletFragmentInitParams)
  {
    if (this.zzaEG != null)
    {
      zzb.zza(this.zzaEG, paramWalletFragmentInitParams);
      this.zzaEy = null;
    }
    do
    {
      return;
      if (this.zzaEy != null)
        break;
      this.zzaEy = paramWalletFragmentInitParams;
      if (this.zzaEz != null)
        Log.w("WalletFragment", "updateMaskedWalletRequest() was called before initialize()");
    }
    while (this.zzaEA == null);
    Log.w("WalletFragment", "updateMaskedWallet() was called before initialize()");
    return;
    Log.w("WalletFragment", "initialize(WalletFragmentInitParams) was called more than once. Ignoring.");
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (this.zzaEG != null)
      zzb.zza(this.zzaEG, paramInt1, paramInt2, paramIntent);
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
          Log.w("WalletFragment", "initialize(WalletFragmentInitParams) was called more than once.Ignoring.");
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
      this.zzaEI.onCreate(paramBundle);
      return;
      if (this.zzXZ.getArguments() != null)
      {
        WalletFragmentOptions localWalletFragmentOptions = (WalletFragmentOptions)this.zzXZ.getArguments().getParcelable("extraWalletFragmentOptions");
        if (localWalletFragmentOptions != null)
        {
          localWalletFragmentOptions.zzao(this.zzXZ.getActivity());
          this.zzaEx = localWalletFragmentOptions;
        }
      }
    }
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return this.zzaEI.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
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
    this.zzaEI.onInflate(paramActivity, localBundle, paramBundle);
  }

  public void onPause()
  {
    super.onPause();
    this.zzaEI.onPause();
  }

  public void onResume()
  {
    super.onResume();
    this.zzaEI.onResume();
    FragmentManager localFragmentManager = this.zzXZ.getActivity().getFragmentManager();
    Fragment localFragment = localFragmentManager.findFragmentByTag("GooglePlayServicesErrorDialog");
    if (localFragment != null)
    {
      localFragmentManager.beginTransaction().remove(localFragment).commit();
      GooglePlayServicesUtil.showErrorDialogFragment(GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.zzXZ.getActivity()), this.zzXZ.getActivity(), -1);
    }
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.setClassLoader(WalletFragmentOptions.class.getClassLoader());
    this.zzaEI.onSaveInstanceState(paramBundle);
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
    this.zzaEI.onStart();
  }

  public void onStop()
  {
    super.onStop();
    this.zzaEI.onStop();
  }

  public void setEnabled(boolean paramBoolean)
  {
    if (this.zzaEG != null)
    {
      zzb.zza(this.zzaEG, paramBoolean);
      this.zzaEB = null;
      return;
    }
    this.zzaEB = Boolean.valueOf(paramBoolean);
  }

  public void setOnStateChangedListener(OnStateChangedListener paramOnStateChangedListener)
  {
    this.zzaEJ.zza(paramOnStateChangedListener);
  }

  public void updateMaskedWallet(MaskedWallet paramMaskedWallet)
  {
    if (this.zzaEG != null)
    {
      zzb.zza(this.zzaEG, paramMaskedWallet);
      this.zzaEA = null;
      return;
    }
    this.zzaEA = paramMaskedWallet;
  }

  public void updateMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
  {
    if (this.zzaEG != null)
    {
      zzb.zza(this.zzaEG, paramMaskedWalletRequest);
      this.zzaEz = null;
      return;
    }
    this.zzaEz = paramMaskedWalletRequest;
  }

  public static abstract interface OnStateChangedListener
  {
    public abstract void onStateChanged(WalletFragment paramWalletFragment, int paramInt1, int paramInt2, Bundle paramBundle);
  }

  static class zza extends zzwc.zza
  {
    private WalletFragment.OnStateChangedListener zzaEK;
    private final WalletFragment zzaEL;

    zza(WalletFragment paramWalletFragment)
    {
      this.zzaEL = paramWalletFragment;
    }

    public void zza(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      if (this.zzaEK != null)
        this.zzaEK.onStateChanged(this.zzaEL, paramInt1, paramInt2, paramBundle);
    }

    public void zza(WalletFragment.OnStateChangedListener paramOnStateChangedListener)
    {
      this.zzaEK = paramOnStateChangedListener;
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

  private class zzc extends zza<WalletFragment.zzb>
    implements View.OnClickListener
  {
    private zzc()
    {
    }

    public void onClick(View paramView)
    {
      Activity localActivity = WalletFragment.zza(WalletFragment.this).getActivity();
      GooglePlayServicesUtil.showErrorDialogFragment(GooglePlayServicesUtil.isGooglePlayServicesAvailable(localActivity), localActivity, -1);
    }

    protected void zza(FrameLayout paramFrameLayout)
    {
      Button localButton = new Button(WalletFragment.zza(WalletFragment.this).getActivity());
      localButton.setText(R.string.wallet_buy_button_place_holder);
      int i = -1;
      int j = -2;
      if (WalletFragment.zze(WalletFragment.this) != null)
      {
        WalletFragmentStyle localWalletFragmentStyle = WalletFragment.zze(WalletFragment.this).getFragmentStyle();
        if (localWalletFragmentStyle != null)
        {
          DisplayMetrics localDisplayMetrics = WalletFragment.zza(WalletFragment.this).getResources().getDisplayMetrics();
          i = localWalletFragmentStyle.zza("buyButtonWidth", localDisplayMetrics, i);
          j = localWalletFragmentStyle.zza("buyButtonHeight", localDisplayMetrics, j);
        }
      }
      localButton.setLayoutParams(new ViewGroup.LayoutParams(i, j));
      localButton.setOnClickListener(this);
      paramFrameLayout.addView(localButton);
    }

    protected void zza(zzf<WalletFragment.zzb> paramzzf)
    {
      Activity localActivity = WalletFragment.zza(WalletFragment.this).getActivity();
      if ((WalletFragment.zzb(WalletFragment.this) == null) && (WalletFragment.zzc(WalletFragment.this)) && (localActivity != null));
      try
      {
        zzwb localzzwb = zzwj.zza(localActivity, WalletFragment.zzd(WalletFragment.this), WalletFragment.zze(WalletFragment.this), WalletFragment.zzf(WalletFragment.this));
        WalletFragment.zza(WalletFragment.this, new WalletFragment.zzb(localzzwb, null));
        WalletFragment.zza(WalletFragment.this, null);
        paramzzf.zza(WalletFragment.zzb(WalletFragment.this));
        if (WalletFragment.zzg(WalletFragment.this) != null)
        {
          WalletFragment.zzb.zza(WalletFragment.zzb(WalletFragment.this), WalletFragment.zzg(WalletFragment.this));
          WalletFragment.zza(WalletFragment.this, null);
        }
        if (WalletFragment.zzh(WalletFragment.this) != null)
        {
          WalletFragment.zzb.zza(WalletFragment.zzb(WalletFragment.this), WalletFragment.zzh(WalletFragment.this));
          WalletFragment.zza(WalletFragment.this, null);
        }
        if (WalletFragment.zzi(WalletFragment.this) != null)
        {
          WalletFragment.zzb.zza(WalletFragment.zzb(WalletFragment.this), WalletFragment.zzi(WalletFragment.this));
          WalletFragment.zza(WalletFragment.this, null);
        }
        if (WalletFragment.zzj(WalletFragment.this) != null)
        {
          WalletFragment.zzb.zza(WalletFragment.zzb(WalletFragment.this), WalletFragment.zzj(WalletFragment.this).booleanValue());
          WalletFragment.zza(WalletFragment.this, null);
        }
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
      }
    }
  }
}