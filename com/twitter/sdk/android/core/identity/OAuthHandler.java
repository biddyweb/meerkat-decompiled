package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.Intent;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterSession;

class OAuthHandler extends AuthHandler
{
  public OAuthHandler(TwitterAuthConfig paramTwitterAuthConfig, Callback<TwitterSession> paramCallback, int paramInt)
  {
    super(paramTwitterAuthConfig, paramCallback, paramInt);
  }

  public boolean authorize(Activity paramActivity)
  {
    paramActivity.startActivityForResult(newIntent(paramActivity), this.requestCode);
    return true;
  }

  Intent newIntent(Activity paramActivity)
  {
    Intent localIntent = new Intent(paramActivity, OAuthActivity.class);
    localIntent.putExtra("auth_config", getAuthConfig());
    return localIntent;
  }
}