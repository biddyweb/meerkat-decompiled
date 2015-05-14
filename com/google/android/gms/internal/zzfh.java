package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;

@zzgi
public final class zzfh extends zzfr.zza
  implements ServiceConnection
{
  private Context mContext;
  zzfc zzuY;
  private String zzvf;
  private zzfg zzvj;
  private boolean zzvp = false;
  private int zzvq;
  private Intent zzvr;

  public zzfh(Context paramContext, String paramString, boolean paramBoolean, int paramInt, Intent paramIntent, zzfg paramzzfg)
  {
    this.zzvf = paramString;
    this.zzvq = paramInt;
    this.zzvr = paramIntent;
    this.zzvp = paramBoolean;
    this.mContext = paramContext;
    this.zzvj = paramzzfg;
  }

  public void finishPurchase()
  {
    int i = zzab.zzaU().zzd(this.zzvr);
    if ((this.zzvq != -1) || (i != 0))
      return;
    this.zzuY = new zzfc(this.mContext);
    Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
    localIntent.setPackage("com.android.vending");
    zzlo.zzka().zza(this.mContext, localIntent, this, 1);
  }

  public String getProductId()
  {
    return this.zzvf;
  }

  public Intent getPurchaseData()
  {
    return this.zzvr;
  }

  public int getResultCode()
  {
    return this.zzvq;
  }

  public boolean isVerified()
  {
    return this.zzvp;
  }

  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    zzhx.zzaa("In-app billing service connected.");
    this.zzuY.zzx(paramIBinder);
    String str1 = zzab.zzaU().zze(this.zzvr);
    String str2 = zzab.zzaU().zzM(str1);
    if (str2 == null)
      return;
    if (this.zzuY.zzg(this.mContext.getPackageName(), str2) == 0)
      zzfi.zzm(this.mContext).zza(this.zzvj);
    zzlo.zzka().zza(this.mContext, this);
    this.zzuY.destroy();
  }

  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    zzhx.zzaa("In-app billing service disconnected.");
    this.zzuY.destroy();
  }
}