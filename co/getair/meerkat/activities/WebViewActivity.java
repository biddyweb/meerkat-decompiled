package co.getair.meerkat.activities;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.WebViewActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class WebViewActivity extends InstabugActivity
{
  public static final String EXTRA_TITLE = "title";
  public static final String EXTRA_URL = "url";
  private WebViewActivityFacade facade;

  public static Intent createIntent(Context paramContext, String paramString1, String paramString2)
  {
    return new Intent(paramContext, WebViewActivity.class).putExtra("url", paramString1).putExtra("title", paramString2);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968613);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    WebViewActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  protected void startUp()
  {
    WebViewActivityFacade.removeCore(getClass().getName());
    this.facade = WebViewActivityFacade.getInst(this);
    this.facade.startup();
  }
}