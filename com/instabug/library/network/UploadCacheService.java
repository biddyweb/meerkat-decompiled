package com.instabug.library.network;

import android.app.IntentService;
import android.content.Intent;
import com.instabug.library.Instabug.a;
import com.instabug.library.internal.device.a;
import com.instabug.library.internal.storage.s;
import com.instabug.library.network.toolbox.b;

public class UploadCacheService extends IntentService
{
  private s a;

  public UploadCacheService()
  {
    super("worker");
  }

  public void onCreate()
  {
    super.onCreate();
  }

  protected void onHandleIntent(Intent paramIntent)
  {
    Instabug.a.a("Instabug UploadCacheService");
    a locala = new a(getApplicationContext());
    if (locala.i());
    try
    {
      b.a(getApplicationContext(), new f(this, paramIntent, locala));
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      Instabug.a.a("Error checking cached reports", localException);
    }
  }
}