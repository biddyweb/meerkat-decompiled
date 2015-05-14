package com.google.android.gms.internal;

import android.accounts.Account;
import android.app.Activity;
import android.app.PendingIntent;
import android.app.PendingIntent.CanceledException;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.wallet.FullWallet;
import com.google.android.gms.wallet.FullWalletRequest;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;
import com.google.android.gms.wallet.NotifyTransactionStatusRequest;
import java.lang.ref.WeakReference;

public class zzwi extends zzk<zzwd>
{
  private final int mTheme;
  private final String zzHg;
  private final int zzaEo;
  private final Activity zzoi;

  public zzwi(Activity paramActivity, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, int paramInt1, String paramString, int paramInt2)
  {
    super(paramActivity, paramLooper, 4, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzoi = paramActivity;
    this.zzaEo = paramInt1;
    this.zzHg = paramString;
    this.mTheme = paramInt2;
  }

  public static Bundle zza(int paramInt1, String paramString1, String paramString2, int paramInt2)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("com.google.android.gms.wallet.EXTRA_ENVIRONMENT", paramInt1);
    localBundle.putString("androidPackageName", paramString1);
    if (!TextUtils.isEmpty(paramString2))
      localBundle.putParcelable("com.google.android.gms.wallet.EXTRA_BUYER_ACCOUNT", new Account(paramString2, "com.google"));
    localBundle.putInt("com.google.android.gms.wallet.EXTRA_THEME", paramInt2);
    return localBundle;
  }

  private Bundle zzuT()
  {
    return zza(this.zzaEo, this.zzoi.getPackageName(), this.zzHg, this.mTheme);
  }

  public void zza(FullWalletRequest paramFullWalletRequest, int paramInt)
  {
    zzb localzzb = new zzb(this.zzoi, paramInt);
    Bundle localBundle = zzuT();
    try
    {
      ((zzwd)zzjb()).zza(paramFullWalletRequest, localBundle, localzzb);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("WalletClientImpl", "RemoteException getting full wallet", localRemoteException);
      localzzb.zza(8, null, Bundle.EMPTY);
    }
  }

  public void zza(MaskedWalletRequest paramMaskedWalletRequest, int paramInt)
  {
    Bundle localBundle = zzuT();
    zzb localzzb = new zzb(this.zzoi, paramInt);
    try
    {
      ((zzwd)zzjb()).zza(paramMaskedWalletRequest, localBundle, localzzb);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("WalletClientImpl", "RemoteException getting masked wallet", localRemoteException);
      localzzb.zza(8, null, Bundle.EMPTY);
    }
  }

  public void zza(NotifyTransactionStatusRequest paramNotifyTransactionStatusRequest)
  {
    Bundle localBundle = zzuT();
    try
    {
      ((zzwd)zzjb()).zza(paramNotifyTransactionStatusRequest, localBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.wallet.service.BIND";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.wallet.internal.IOwService";
  }

  protected zzwd zzcN(IBinder paramIBinder)
  {
    return zzwd.zza.zzcJ(paramIBinder);
  }

  public void zze(String paramString1, String paramString2, int paramInt)
  {
    Bundle localBundle = zzuT();
    zzb localzzb = new zzb(this.zzoi, paramInt);
    try
    {
      ((zzwd)zzjb()).zza(paramString1, paramString2, localBundle, localzzb);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("WalletClientImpl", "RemoteException changing masked wallet", localRemoteException);
      localzzb.zza(8, null, Bundle.EMPTY);
    }
  }

  public void zzhG(int paramInt)
  {
    Bundle localBundle = zzuT();
    zzb localzzb = new zzb(this.zzoi, paramInt);
    try
    {
      ((zzwd)zzjb()).zza(localBundle, localzzb);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("WalletClientImpl", "RemoteException during checkForPreAuthorization", localRemoteException);
      localzzb.zza(8, false, Bundle.EMPTY);
    }
  }

  public void zzhH(int paramInt)
  {
    Bundle localBundle = zzuT();
    zzb localzzb = new zzb(this.zzoi, paramInt);
    try
    {
      ((zzwd)zzjb()).zzb(localBundle, localzzb);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("WalletClientImpl", "RemoteException during isNewUser", localRemoteException);
      localzzb.zzb(8, false, Bundle.EMPTY);
    }
  }

  private static class zza extends zzwg.zza
  {
    public void zza(int paramInt, FullWallet paramFullWallet, Bundle paramBundle)
    {
    }

    public void zza(int paramInt, MaskedWallet paramMaskedWallet, Bundle paramBundle)
    {
    }

    public void zza(int paramInt, boolean paramBoolean, Bundle paramBundle)
    {
    }

    public void zza(Status paramStatus, zzvz paramzzvz, Bundle paramBundle)
    {
    }

    public void zzb(int paramInt, boolean paramBoolean, Bundle paramBundle)
    {
    }

    public void zzk(int paramInt, Bundle paramBundle)
    {
    }
  }

  static final class zzb extends zzwi.zza
  {
    private final int zzPu;
    private final WeakReference<Activity> zzaEZ;

    public zzb(Activity paramActivity, int paramInt)
    {
      super();
      this.zzaEZ = new WeakReference(paramActivity);
      this.zzPu = paramInt;
    }

    public void zza(int paramInt, FullWallet paramFullWallet, Bundle paramBundle)
    {
      Activity localActivity = (Activity)this.zzaEZ.get();
      if (localActivity == null)
      {
        Log.d("WalletClientImpl", "Ignoring onFullWalletLoaded, Activity has gone");
        return;
      }
      PendingIntent localPendingIntent1 = null;
      if (paramBundle != null)
        localPendingIntent1 = (PendingIntent)paramBundle.getParcelable("com.google.android.gms.wallet.EXTRA_PENDING_INTENT");
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent1);
      if (localConnectionResult.hasResolution())
        try
        {
          localConnectionResult.startResolutionForResult(localActivity, this.zzPu);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          Log.w("WalletClientImpl", "Exception starting pending intent", localSendIntentException);
          return;
        }
      Intent localIntent = new Intent();
      int i;
      PendingIntent localPendingIntent2;
      if (localConnectionResult.isSuccess())
      {
        i = -1;
        localIntent.putExtra("com.google.android.gms.wallet.EXTRA_FULL_WALLET", paramFullWallet);
        localPendingIntent2 = localActivity.createPendingResult(this.zzPu, localIntent, 1073741824);
        if (localPendingIntent2 == null)
          Log.w("WalletClientImpl", "Null pending result returned for onFullWalletLoaded");
      }
      else
      {
        if (paramInt == 408);
        for (i = 0; ; i = 1)
        {
          localIntent.putExtra("com.google.android.gms.wallet.EXTRA_ERROR_CODE", paramInt);
          break;
        }
      }
      try
      {
        localPendingIntent2.send(i);
        return;
      }
      catch (PendingIntent.CanceledException localCanceledException)
      {
        Log.w("WalletClientImpl", "Exception setting pending result", localCanceledException);
      }
    }

    public void zza(int paramInt, MaskedWallet paramMaskedWallet, Bundle paramBundle)
    {
      Activity localActivity = (Activity)this.zzaEZ.get();
      if (localActivity == null)
      {
        Log.d("WalletClientImpl", "Ignoring onMaskedWalletLoaded, Activity has gone");
        return;
      }
      PendingIntent localPendingIntent1 = null;
      if (paramBundle != null)
        localPendingIntent1 = (PendingIntent)paramBundle.getParcelable("com.google.android.gms.wallet.EXTRA_PENDING_INTENT");
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent1);
      if (localConnectionResult.hasResolution())
        try
        {
          localConnectionResult.startResolutionForResult(localActivity, this.zzPu);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          Log.w("WalletClientImpl", "Exception starting pending intent", localSendIntentException);
          return;
        }
      Intent localIntent = new Intent();
      int i;
      PendingIntent localPendingIntent2;
      if (localConnectionResult.isSuccess())
      {
        i = -1;
        localIntent.putExtra("com.google.android.gms.wallet.EXTRA_MASKED_WALLET", paramMaskedWallet);
        localPendingIntent2 = localActivity.createPendingResult(this.zzPu, localIntent, 1073741824);
        if (localPendingIntent2 == null)
          Log.w("WalletClientImpl", "Null pending result returned for onMaskedWalletLoaded");
      }
      else
      {
        if (paramInt == 408);
        for (i = 0; ; i = 1)
        {
          localIntent.putExtra("com.google.android.gms.wallet.EXTRA_ERROR_CODE", paramInt);
          break;
        }
      }
      try
      {
        localPendingIntent2.send(i);
        return;
      }
      catch (PendingIntent.CanceledException localCanceledException)
      {
        Log.w("WalletClientImpl", "Exception setting pending result", localCanceledException);
      }
    }

    public void zza(int paramInt, boolean paramBoolean, Bundle paramBundle)
    {
      Activity localActivity = (Activity)this.zzaEZ.get();
      if (localActivity == null)
      {
        Log.d("WalletClientImpl", "Ignoring onPreAuthorizationDetermined, Activity has gone");
        return;
      }
      Intent localIntent = new Intent();
      localIntent.putExtra("com.google.android.gm.wallet.EXTRA_IS_USER_PREAUTHORIZED", paramBoolean);
      PendingIntent localPendingIntent = localActivity.createPendingResult(this.zzPu, localIntent, 1073741824);
      if (localPendingIntent == null)
      {
        Log.w("WalletClientImpl", "Null pending result returned for onPreAuthorizationDetermined");
        return;
      }
      try
      {
        localPendingIntent.send(-1);
        return;
      }
      catch (PendingIntent.CanceledException localCanceledException)
      {
        Log.w("WalletClientImpl", "Exception setting pending result", localCanceledException);
      }
    }

    public void zzb(int paramInt, boolean paramBoolean, Bundle paramBundle)
    {
      Activity localActivity = (Activity)this.zzaEZ.get();
      if (localActivity == null)
      {
        Log.d("WalletClientImpl", "Ignoring onIsNewUserDetermined, Activity has gone");
        return;
      }
      Intent localIntent = new Intent();
      localIntent.putExtra("com.google.android.gms.wallet.EXTRA_IS_NEW_USER", paramBoolean);
      PendingIntent localPendingIntent = localActivity.createPendingResult(this.zzPu, localIntent, 1073741824);
      if (localPendingIntent == null)
      {
        Log.w("WalletClientImpl", "Null pending result returned for onIsNewUserDetermined");
        return;
      }
      try
      {
        localPendingIntent.send(-1);
        return;
      }
      catch (PendingIntent.CanceledException localCanceledException)
      {
        Log.w("WalletClientImpl", "Exception setting pending result", localCanceledException);
      }
    }

    public void zzk(int paramInt, Bundle paramBundle)
    {
      zzx.zzb(paramBundle, "Bundle should not be null");
      Activity localActivity = (Activity)this.zzaEZ.get();
      if (localActivity == null)
      {
        Log.d("WalletClientImpl", "Ignoring onWalletObjectsCreated, Activity has gone");
        return;
      }
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, (PendingIntent)paramBundle.getParcelable("com.google.android.gms.wallet.EXTRA_PENDING_INTENT"));
      if (localConnectionResult.hasResolution())
        try
        {
          localConnectionResult.startResolutionForResult(localActivity, this.zzPu);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          Log.w("WalletClientImpl", "Exception starting pending intent", localSendIntentException);
          return;
        }
      Log.e("WalletClientImpl", "Create Wallet Objects confirmation UI will not be shown connection result: " + localConnectionResult);
      Intent localIntent = new Intent();
      localIntent.putExtra("com.google.android.gms.wallet.EXTRA_ERROR_CODE", 413);
      PendingIntent localPendingIntent = localActivity.createPendingResult(this.zzPu, localIntent, 1073741824);
      if (localPendingIntent == null)
      {
        Log.w("WalletClientImpl", "Null pending result returned for onWalletObjectsCreated");
        return;
      }
      try
      {
        localPendingIntent.send(1);
        return;
      }
      catch (PendingIntent.CanceledException localCanceledException)
      {
        Log.w("WalletClientImpl", "Exception setting pending result", localCanceledException);
      }
    }
  }
}