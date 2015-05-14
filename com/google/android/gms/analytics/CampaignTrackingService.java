package com.google.android.gms.analytics;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class CampaignTrackingService extends IntentService
{
  public CampaignTrackingService()
  {
    super("CampaignIntentService");
  }

  public CampaignTrackingService(String paramString)
  {
    super(paramString);
  }

  public void onHandleIntent(Intent paramIntent)
  {
    zza(this, paramIntent);
  }

  public void zza(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("referrer");
    if (str == null)
    {
      zzae.zzZ("Campaign data not found.");
      return;
    }
    try
    {
      FileOutputStream localFileOutputStream = paramContext.openFileOutput("gaInstallData", 0);
      localFileOutputStream.write(str.getBytes());
      localFileOutputStream.close();
      zzae.zzab("Stored campaign information.");
      return;
    }
    catch (IOException localIOException)
    {
      zzae.zzZ("Error storing install campaign.");
    }
  }
}