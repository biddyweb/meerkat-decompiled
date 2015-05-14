package co.getair.meerkat.activities;

import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.UserlistActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class UserListActivity extends InstabugActivity
{
  public static final String LIST_SHOW_SCORE_BUNDLE_KEY = "listShowScoreBundleKey";
  public static final String LIST_SOURCE_BUNDLE_KEY = "listSourceBundleKey";
  public static final String LIST_TITLE_BUNDLE_KEY = "listTitleBundleKey";
  UserlistActivityFacade facade;
  private boolean listShowScore;
  private String listSource;
  private String listTitle;

  public String getListSource()
  {
    return this.listSource;
  }

  public String getListTitle()
  {
    return this.listTitle;
  }

  public boolean getShowScore()
  {
    return this.listShowScore;
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968611);
    Intent localIntent = getIntent();
    this.listSource = localIntent.getStringExtra("listSourceBundleKey");
    this.listTitle = localIntent.getStringExtra("listTitleBundleKey");
    this.listShowScore = localIntent.getBooleanExtra("listShowScoreBundleKey", false);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    UserlistActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    UserlistActivityFacade.removeCore(getClass().getName());
    this.facade = UserlistActivityFacade.getInst(this);
    this.facade.startup();
  }
}