package co.getair.meerkat.activities;

import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.FeedActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class FeedActivity extends InstabugActivity
{
  FeedActivityFacade facade;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968604);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    FeedActivityFacade.removeCore(getClass().getName());
  }

  protected void onResume()
  {
    super.onResume();
    this.facade.sendNotification("eventFeedResumed");
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    FeedActivityFacade.removeCore(getClass().getName());
    this.facade = FeedActivityFacade.getInst(this);
    this.facade.startup();
  }
}