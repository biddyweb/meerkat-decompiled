package co.getair.meerkat.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.PhoneActivationCodeActivityFacade;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class PhoneActivationCodeActivity extends FragmentActivity
{
  public static final String PHONE_NUMBER_BUNDLE_KEY = "phoneNumberBundleKey";
  PhoneActivationCodeActivityFacade facade;
  private String phoneNumber;

  public String getPhoneNumber()
  {
    return this.phoneNumber;
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968607);
    this.phoneNumber = getIntent().getStringExtra("phoneNumberBundleKey");
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    PhoneActivationCodeActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    PhoneActivationCodeActivityFacade.removeCore(getClass().getName());
    this.facade = PhoneActivationCodeActivityFacade.getInst(this);
    this.facade.startup();
  }
}