package co.getair.meerkat.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.utilities.MLog;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class WatchActivity extends InstabugActivity
{
  public static final String EXTRA_BROADCAST_ID = "broadcastId";
  public static final String EXTRA_STREAM_ID = "streamId";
  private WatchActivityFacade facade;
  private boolean started = false;
  public String streamId = null;

  public static Intent createIntent(Context paramContext, String paramString)
  {
    return new Intent(paramContext, WatchActivity.class).putExtra("broadcastId", paramString);
  }

  private String getStreamIdFromIntent(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("broadcastId");
    if (str == null)
      str = paramIntent.getStringExtra("streamId");
    return str;
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt2 == -1)
    {
      this.streamId = getStreamIdFromIntent(paramIntent);
      MLog.d("WatchActivity", this.streamId);
      startApp();
      return;
    }
    finish();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968612);
    try
    {
      this.streamId = getStreamIdFromIntent(getIntent());
      MLog.d("WatchActivity", this.streamId);
      startApp();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      finish();
    }
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.started = false;
    this.facade.clearFacade();
    WatchActivityFacade.removeCore(getClass().getName());
  }

  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    try
    {
      this.streamId = getStreamIdFromIntent(paramIntent);
      MLog.d("WatchActivity", this.streamId);
      startApp();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      finish();
    }
  }

  protected void onRestart()
  {
    super.onRestart();
    startApp();
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    this.facade.sendNotification("end", null, null);
    this.started = false;
    super.onStop();
  }

  protected void startApp()
  {
    if (!this.started)
    {
      this.started = true;
      WatchActivityFacade.removeCore(getClass().getName());
      this.facade = WatchActivityFacade.getInst(this);
      this.facade.startup();
    }
  }
}