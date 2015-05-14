package com.google.android.gms.internal;

import android.accounts.Account;
import android.app.Activity;
import android.app.PendingIntent;
import android.app.PendingIntent.CanceledException;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.identity.intents.UserAddressRequest;

public class zzoq extends zzk<zzos>
{
  private final int mTheme;
  private final String zzHg;
  private zza zzalt;
  private Activity zzoi;

  public zzoq(Activity paramActivity, Looper paramLooper, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString, int paramInt)
  {
    super(paramActivity, paramLooper, 12, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzHg = paramString;
    this.zzoi = paramActivity;
    this.mTheme = paramInt;
  }

  public void disconnect()
  {
    super.disconnect();
    if (this.zzalt != null)
    {
      zza.zza(this.zzalt, null);
      this.zzalt = null;
    }
  }

  public void zza(UserAddressRequest paramUserAddressRequest, int paramInt)
  {
    zzpn();
    this.zzalt = new zza(paramInt, this.zzoi);
    try
    {
      Bundle localBundle1 = new Bundle();
      localBundle1.putString("com.google.android.gms.identity.intents.EXTRA_CALLING_PACKAGE_NAME", getContext().getPackageName());
      if (!TextUtils.isEmpty(this.zzHg))
        localBundle1.putParcelable("com.google.android.gms.identity.intents.EXTRA_ACCOUNT", new Account(this.zzHg, "com.google"));
      localBundle1.putInt("com.google.android.gms.identity.intents.EXTRA_THEME", this.mTheme);
      zzpm().zza(this.zzalt, paramUserAddressRequest, localBundle1);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("AddressClientImpl", "Exception requesting user address", localRemoteException);
      Bundle localBundle2 = new Bundle();
      localBundle2.putInt("com.google.android.gms.identity.intents.EXTRA_ERROR_CODE", 555);
      this.zzalt.zzi(1, localBundle2);
    }
  }

  protected zzos zzbd(IBinder paramIBinder)
  {
    return zzos.zza.zzbf(paramIBinder);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.identity.service.BIND";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.identity.intents.internal.IAddressService";
  }

  protected zzos zzpm()
    throws DeadObjectException
  {
    return (zzos)super.zzjb();
  }

  protected void zzpn()
  {
    super.zzfc();
  }

  public static final class zza extends zzor.zza
  {
    private final int zzPu;
    private Activity zzoi;

    public zza(int paramInt, Activity paramActivity)
    {
      this.zzPu = paramInt;
      this.zzoi = paramActivity;
    }

    private void setActivity(Activity paramActivity)
    {
      this.zzoi = paramActivity;
    }

    public void zzi(int paramInt, Bundle paramBundle)
    {
      PendingIntent localPendingIntent1;
      if (paramInt == 1)
      {
        Intent localIntent = new Intent();
        localIntent.putExtras(paramBundle);
        localPendingIntent1 = this.zzoi.createPendingResult(this.zzPu, localIntent, 1073741824);
        if (localPendingIntent1 != null);
      }
      while (true)
      {
        return;
        try
        {
          localPendingIntent1.send(1);
          return;
        }
        catch (PendingIntent.CanceledException localCanceledException1)
        {
          Log.w("AddressClientImpl", "Exception settng pending result", localCanceledException1);
          return;
        }
        PendingIntent localPendingIntent2 = null;
        if (paramBundle != null)
          localPendingIntent2 = (PendingIntent)paramBundle.getParcelable("com.google.android.gms.identity.intents.EXTRA_PENDING_INTENT");
        ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent2);
        if (localConnectionResult.hasResolution())
          try
          {
            localConnectionResult.startResolutionForResult(this.zzoi, this.zzPu);
            return;
          }
          catch (IntentSender.SendIntentException localSendIntentException)
          {
            Log.w("AddressClientImpl", "Exception starting pending intent", localSendIntentException);
            return;
          }
        try
        {
          PendingIntent localPendingIntent3 = this.zzoi.createPendingResult(this.zzPu, new Intent(), 1073741824);
          if (localPendingIntent3 != null)
          {
            localPendingIntent3.send(1);
            return;
          }
        }
        catch (PendingIntent.CanceledException localCanceledException2)
        {
          Log.w("AddressClientImpl", "Exception setting pending result", localCanceledException2);
        }
      }
    }
  }
}