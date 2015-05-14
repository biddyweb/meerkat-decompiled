package co.getair.meerkat.activities;

import android.content.Intent;
import android.os.Bundle;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.CommentsActivityFacade;
import com.instabug.wrapper.support.activity.InstabugActivity;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class CommentsActivity extends InstabugActivity
{
  public static final String COMMENTS_URL_BUNDLE_KEY = "commentsUrlBundleKey";
  private String commentsUrl;
  CommentsActivityFacade facade;

  public String getCommentsUrl()
  {
    return this.commentsUrl;
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130968603);
    this.commentsUrl = getIntent().getStringExtra("commentsUrlBundleKey");
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    CommentsActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void startUp()
  {
    CommentsActivityFacade.removeCore(getClass().getName());
    this.facade = CommentsActivityFacade.getInst(this);
    this.facade.startup();
  }
}