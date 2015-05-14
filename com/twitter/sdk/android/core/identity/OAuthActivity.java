package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.ProgressBar;
import com.twitter.sdk.android.core.R.id;
import com.twitter.sdk.android.core.R.layout;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthException;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.TwitterApi;
import com.twitter.sdk.android.core.internal.oauth.OAuth1aService;

public class OAuthActivity extends Activity
  implements OAuthController.Listener
{
  static final String EXTRA_AUTH_CONFIG = "auth_config";
  private static final String STATE_PROGRESS = "progress";
  OAuthController oAuthController;
  private ProgressBar spinner;
  private WebView webView;

  public void onBackPressed()
  {
    this.oAuthController.handleAuthError(0, new TwitterAuthException("Authorization failed, request was canceled."));
  }

  public void onComplete(int paramInt, Intent paramIntent)
  {
    setResult(paramInt, paramIntent);
    finish();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.tw__activity_oauth);
    this.spinner = ((ProgressBar)findViewById(R.id.tw__spinner));
    this.webView = ((WebView)findViewById(R.id.tw__web_view));
    boolean bool;
    ProgressBar localProgressBar;
    if (paramBundle != null)
    {
      bool = paramBundle.getBoolean("progress", false);
      localProgressBar = this.spinner;
      if (!bool)
        break label141;
    }
    label141: for (int i = 0; ; i = 8)
    {
      localProgressBar.setVisibility(i);
      TwitterCore localTwitterCore = TwitterCore.getInstance();
      this.oAuthController = new OAuthController(this.spinner, this.webView, (TwitterAuthConfig)getIntent().getParcelableExtra("auth_config"), new OAuth1aService(localTwitterCore, localTwitterCore.getSSLSocketFactory(), new TwitterApi()), this);
      this.oAuthController.startAuth();
      return;
      bool = true;
      break;
    }
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    if (this.spinner.getVisibility() == 0)
      paramBundle.putBoolean("progress", true);
    super.onSaveInstanceState(paramBundle);
  }
}