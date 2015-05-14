package com.digits.sdk.android;

import android.os.Bundle;
import android.os.ResultReceiver;
import com.twitter.sdk.android.core.SessionManager;

class LoginResultReceiver extends ResultReceiver
{
  static final String KEY_ERROR = "login_error";
  static final int RESULT_ERROR = 400;
  static final int RESULT_OK = 200;
  final AuthCallback callback;
  final SessionManager<DigitsSession> sessionManager;

  LoginResultReceiver(AuthCallback paramAuthCallback, SessionManager<DigitsSession> paramSessionManager)
  {
    super(null);
    this.callback = paramAuthCallback;
    this.sessionManager = paramSessionManager;
  }

  public void onReceiveResult(int paramInt, Bundle paramBundle)
  {
    if (this.callback != null)
    {
      if (paramInt != 200)
        break label42;
      this.callback.success((DigitsSession)this.sessionManager.getActiveSession(), paramBundle.getString("phone_number"));
    }
    label42: 
    while (paramInt != 400)
      return;
    this.callback.failure(new DigitsException(paramBundle.getString("login_error")));
  }
}