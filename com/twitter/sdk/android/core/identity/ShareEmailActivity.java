package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.view.View;
import android.widget.TextView;
import com.twitter.sdk.android.core.R.id;
import com.twitter.sdk.android.core.R.layout;
import com.twitter.sdk.android.core.R.string;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterSession;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

public class ShareEmailActivity extends Activity
{
  static final String EXTRA_RESULT_RECEIVER = "result_receiver";
  static final String EXTRA_SESSION_ID = "session_id";
  ShareEmailController controller;
  private TwitterSession session;

  private ResultReceiver getResultReceiver(Intent paramIntent)
  {
    ResultReceiver localResultReceiver = (ResultReceiver)paramIntent.getParcelableExtra("result_receiver");
    if (localResultReceiver == null)
      throw new IllegalArgumentException("ResultReceiver must not be null. This activity should not be started directly.");
    return localResultReceiver;
  }

  private TwitterSession getSession(Intent paramIntent)
  {
    long l = paramIntent.getLongExtra("session_id", -1L);
    TwitterSession localTwitterSession = (TwitterSession)TwitterCore.getInstance().getSessionManager().getSession(l);
    if (localTwitterSession == null)
      throw new IllegalArgumentException("No TwitterSession for id:" + l);
    return localTwitterSession;
  }

  public void onBackPressed()
  {
    this.controller.cancelRequest();
    super.onBackPressed();
  }

  public void onClickAllow(View paramView)
  {
    this.controller.executeRequest();
    finish();
  }

  public void onClickNotNow(View paramView)
  {
    this.controller.cancelRequest();
    finish();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.tw__activity_share_email);
    try
    {
      Intent localIntent = getIntent();
      ResultReceiver localResultReceiver = getResultReceiver(localIntent);
      this.session = getSession(localIntent);
      this.controller = new ShareEmailController(new ShareEmailClient(this.session), localResultReceiver);
      setUpShareEmailDesc(this, (TextView)findViewById(R.id.tw__share_email_desc));
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      Fabric.getLogger().e("Twitter", "Failed to create ShareEmailActivity.", localIllegalArgumentException);
      finish();
    }
  }

  void setUpShareEmailDesc(Context paramContext, TextView paramTextView)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    Resources localResources = getResources();
    int i = R.string.tw__share_email_desc;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = localPackageManager.getApplicationLabel(paramContext.getApplicationInfo());
    arrayOfObject[1] = this.session.getUserName();
    paramTextView.setText(localResources.getString(i, arrayOfObject));
  }
}