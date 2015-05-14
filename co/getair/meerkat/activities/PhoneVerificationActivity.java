package co.getair.meerkat.activities;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.PhoneVerificationActivityFacade;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class PhoneVerificationActivity extends FragmentActivity
{
  PhoneVerificationActivityFacade facade;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968608);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    PhoneVerificationActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    PhoneVerificationActivityFacade.removeCore(getClass().getName());
    this.facade = PhoneVerificationActivityFacade.getInst(this);
    this.facade.startup();
  }
}