package com.google.android.gms.internal;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.content.ServiceConnection;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;

@zzgi
public class zzff extends zzfp.zza
  implements ServiceConnection
{
  private final Activity zzoi;
  private zzfc zzuY;
  zzfi zzuZ;
  private zzfl zzvb;
  private Context zzvh;
  private zzfn zzvi;
  private zzfg zzvj;
  private zzfk zzvk;
  private String zzvl = null;

  public zzff(Activity paramActivity)
  {
    this.zzoi = paramActivity;
    this.zzuZ = zzfi.zzm(this.zzoi.getApplicationContext());
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1001);
    try
    {
      int i = zzab.zzaU().zzd(paramIntent);
      if (paramInt2 == -1)
      {
        zzab.zzaU();
        if (i == 0)
        {
          boolean bool1 = this.zzvb.zza(this.zzvl, paramInt2, paramIntent);
          bool2 = false;
          if (!bool1);
        }
      }
      for (boolean bool2 = true; ; bool2 = false)
      {
        this.zzvi.recordPlayBillingResolution(i);
        this.zzoi.finish();
        zza(this.zzvi.getProductId(), bool2, paramInt2, paramIntent);
        return;
        this.zzuZ.zza(this.zzvj);
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzac("Fail to process purchase result.");
      this.zzoi.finish();
      return;
    }
    finally
    {
      this.zzvl = null;
    }
  }

  public void onCreate()
  {
    zzfb localzzfb = zzfb.zzc(this.zzoi.getIntent());
    this.zzvk = localzzfb.zzuU;
    this.zzvb = localzzfb.zzmg;
    this.zzvi = localzzfb.zzuS;
    this.zzuY = new zzfc(this.zzoi.getApplicationContext());
    this.zzvh = localzzfb.zzuT;
    if (this.zzoi.getResources().getConfiguration().orientation == 2)
      this.zzoi.setRequestedOrientation(zzab.zzaO().zzex());
    while (true)
    {
      Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
      localIntent.setPackage("com.android.vending");
      this.zzoi.bindService(localIntent, this, 1);
      return;
      this.zzoi.setRequestedOrientation(zzab.zzaO().zzey());
    }
  }

  public void onDestroy()
  {
    this.zzoi.unbindService(this);
    this.zzuY.destroy();
  }

  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    this.zzuY.zzx(paramIBinder);
    try
    {
      this.zzvl = this.zzvb.zzdB();
      Bundle localBundle = this.zzuY.zzb(this.zzoi.getPackageName(), this.zzvi.getProductId(), this.zzvl);
      PendingIntent localPendingIntent = (PendingIntent)localBundle.getParcelable("BUY_INTENT");
      if (localPendingIntent == null)
      {
        int i = zzab.zzaU().zzf(localBundle);
        this.zzvi.recordPlayBillingResolution(i);
        zza(this.zzvi.getProductId(), false, i, null);
        this.zzoi.finish();
        return;
      }
      this.zzvj = new zzfg(this.zzvi.getProductId(), this.zzvl);
      this.zzuZ.zzb(this.zzvj);
      this.zzoi.startIntentSenderForResult(localPendingIntent.getIntentSender(), 1001, new Intent(), Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Error when connecting in-app billing service", localRemoteException);
      this.zzoi.finish();
      return;
    }
    catch (IntentSender.SendIntentException localSendIntentException)
    {
      label191: break label191;
    }
  }

  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    zzhx.zzaa("In-app billing service disconnected.");
    this.zzuY.destroy();
  }

  protected void zza(String paramString, boolean paramBoolean, int paramInt, Intent paramIntent)
  {
    if (this.zzvk != null)
      this.zzvk.zza(paramString, paramBoolean, paramInt, paramIntent, this.zzvj);
  }
}