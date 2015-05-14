package co.getair.meerkat.activities;

import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.OnActivityResultParams;
import co.getair.meerkat.facades.HomeActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import com.twitter.sdk.android.core.identity.TwitterLoginButton;

public class HomeActivity extends InstabugActivity
{
  private HomeActivityFacade facade;
  private TwitterLoginButton twitterLoginButton;

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    OnActivityResultParams localOnActivityResultParams = new OnActivityResultParams(paramInt1, paramInt2, paramIntent);
    this.facade.sendNotification("eventTwitterLoginDone", localOnActivityResultParams, null);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968605);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    HomeActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  protected void startUp()
  {
    HomeActivityFacade.removeCore(getClass().getName());
    this.facade = HomeActivityFacade.getInst(this);
    this.facade.startup();
  }
}