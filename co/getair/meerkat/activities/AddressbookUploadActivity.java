package co.getair.meerkat.activities;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.AddressbookUploadFacade;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class AddressbookUploadActivity extends FragmentActivity
{
  AddressbookUploadFacade facade;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968601);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    AddressbookUploadFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    AddressbookUploadFacade.removeCore(getClass().getName());
    this.facade = AddressbookUploadFacade.getInst(this);
    this.facade.startup();
  }
}