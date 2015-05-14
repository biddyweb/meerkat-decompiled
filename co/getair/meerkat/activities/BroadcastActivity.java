package co.getair.meerkat.activities;

import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.BroadcastActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class BroadcastActivity extends InstabugActivity
{
  public static final String GoLiveExtraParamsKey = "goLiveParams";
  BroadcastActivityFacade facade;
  private boolean onCreate = true;

  public void onBackPressed()
  {
    this.facade.sendNotification("broadcastActivityPaused", null, null);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968602);
    startUp();
  }

  protected void onDestroy()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onDestroy();
    this.facade.clearFacade();
    BroadcastActivityFacade.removeCore(getClass().getName());
  }

  protected void onPause()
  {
    super.onPause();
    finish();
  }

  protected void onResume()
  {
    super.onResume();
    if (!this.onCreate)
    {
      this.facade.sendNotification("broadcastActivityResumed", null, null);
      return;
    }
    this.onCreate = false;
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    this.facade.sendNotification("end", null, null);
    super.onStop();
  }

  public void startUp()
  {
    BroadcastActivityFacade.removeCore(getClass().getName());
    this.facade = BroadcastActivityFacade.getInst(this);
    this.facade.startup();
  }
}