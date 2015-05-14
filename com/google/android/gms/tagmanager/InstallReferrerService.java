package com.google.android.gms.tagmanager;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import com.google.android.gms.analytics.CampaignTrackingService;

public final class InstallReferrerService extends IntentService
{
  CampaignTrackingService zzayQ;
  Context zzayR;

  public InstallReferrerService()
  {
    super("InstallReferrerService");
  }

  public InstallReferrerService(String paramString)
  {
    super(paramString);
  }

  private void zzc(Context paramContext, Intent paramIntent)
  {
    if (this.zzayQ == null)
      this.zzayQ = new CampaignTrackingService();
    this.zzayQ.zza(paramContext, paramIntent);
  }

  protected void onHandleIntent(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("referrer");
    if (this.zzayR != null);
    for (Context localContext = this.zzayR; ; localContext = getApplicationContext())
    {
      zzaw.zzh(localContext, str);
      zzc(localContext, paramIntent);
      return;
    }
  }
}