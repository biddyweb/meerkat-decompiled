package co.getair.meerkat.activities;

import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.LandingActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class LandingActivity extends InstabugActivity
{
  LandingActivityFacade facade;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968605);
    startUp(getIntent());
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    LandingActivityFacade.removeCore(getClass().getName());
  }

  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    setIntent(paramIntent);
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  protected void startUp(Intent paramIntent)
  {
    LandingActivityFacade.removeCore(getClass().getName());
    this.facade = LandingActivityFacade.getInst(this);
    this.facade.startup(paramIntent);
  }
}