package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.Intent;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthException;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterSession;

public abstract class AuthHandler
{
  static final String EXTRA_AUTH_ERROR = "auth_error";
  static final String EXTRA_SCREEN_NAME = "screen_name";
  static final String EXTRA_TOKEN = "tk";
  static final String EXTRA_TOKEN_SECRET = "ts";
  static final String EXTRA_USER_ID = "user_id";
  static final int RESULT_CODE_ERROR = 1;
  private final Callback<TwitterSession> callback;
  private final TwitterAuthConfig config;
  protected final int requestCode;

  AuthHandler(TwitterAuthConfig paramTwitterAuthConfig, Callback<TwitterSession> paramCallback, int paramInt)
  {
    this.config = paramTwitterAuthConfig;
    this.callback = paramCallback;
    this.requestCode = paramInt;
  }

  public abstract boolean authorize(Activity paramActivity);

  TwitterAuthConfig getAuthConfig()
  {
    return this.config;
  }

  Callback<TwitterSession> getCallback()
  {
    return this.callback;
  }

  public boolean handleOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (this.requestCode != paramInt1)
      return false;
    Callback localCallback = getCallback();
    if (localCallback != null)
    {
      if (paramInt2 != -1)
        break label89;
      String str1 = paramIntent.getStringExtra("tk");
      String str2 = paramIntent.getStringExtra("ts");
      String str3 = paramIntent.getStringExtra("screen_name");
      long l = paramIntent.getLongExtra("user_id", 0L);
      localCallback.success(new TwitterSession(new TwitterAuthToken(str1, str2), l, str3), null);
    }
    while (true)
    {
      return true;
      label89: if ((paramIntent != null) && (paramIntent.hasExtra("auth_error")))
        localCallback.failure((TwitterAuthException)paramIntent.getSerializableExtra("auth_error"));
      else
        localCallback.failure(new TwitterAuthException("Authorize failed."));
    }
  }
}