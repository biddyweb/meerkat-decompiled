package com.google.android.gms.ads.purchase;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.zzfp;
import com.google.android.gms.internal.zzfu;
import com.google.android.gms.internal.zzhx;

public class InAppPurchaseActivity extends Activity
{
  public static final String CLASS_NAME = "com.google.android.gms.ads.purchase.InAppPurchaseActivity";
  public static final String SIMPLE_CLASS_NAME = "InAppPurchaseActivity";
  private zzfp zzAx;

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    try
    {
      if (this.zzAx != null)
        this.zzAx.onActivityResult(paramInt1, paramInt2, paramIntent);
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzd("Could not forward onActivityResult to in-app purchase manager:", localRemoteException);
    }
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.zzAx = zzfu.zze(this);
    if (this.zzAx == null)
    {
      zzhx.zzac("Could not create in-app purchase manager.");
      finish();
      return;
    }
    try
    {
      this.zzAx.onCreate();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward onCreate to in-app purchase manager:", localRemoteException);
      finish();
    }
  }

  protected void onDestroy()
  {
    try
    {
      if (this.zzAx != null)
        this.zzAx.onDestroy();
      super.onDestroy();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzd("Could not forward onDestroy to in-app purchase manager:", localRemoteException);
    }
  }
}