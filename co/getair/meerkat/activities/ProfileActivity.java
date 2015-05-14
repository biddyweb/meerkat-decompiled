package co.getair.meerkat.activities;

import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ProfileActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class ProfileActivity extends InstabugActivity
{
  ProfileActivityFacade facade;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968609);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    ProfileActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    ProfileActivityFacade.removeCore(getClass().getName());
    this.facade = ProfileActivityFacade.getInst(this);
    this.facade.startup();
  }
}