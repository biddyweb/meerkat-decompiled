package com.twitter.sdk.android.core;

import com.twitter.sdk.android.core.internal.oauth.OAuth2Service;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;

class GuestAuthClient
{
  private final OAuth2Service service;

  GuestAuthClient(OAuth2Service paramOAuth2Service)
  {
    if (paramOAuth2Service == null)
      throw new IllegalArgumentException("OAuth2Service must not be null");
    this.service = paramOAuth2Service;
  }

  void authorize(SessionManager<AppSession> paramSessionManager, Callback<AppSession> paramCallback)
  {
    if (paramSessionManager == null)
      throw new IllegalArgumentException("SessionManager must not be null");
    this.service.requestGuestOrAppAuthToken(new CallbackWrapper(paramSessionManager, paramCallback));
  }

  class CallbackWrapper extends Callback<OAuth2Token>
  {
    private final SessionManager<AppSession> appSessionManager;
    private final Callback<AppSession> callback;

    CallbackWrapper(Callback<AppSession> arg2)
    {
      Object localObject1;
      this.appSessionManager = localObject1;
      Object localObject2;
      this.callback = localObject2;
    }

    public void failure(TwitterException paramTwitterException)
    {
      if (this.callback != null)
        this.callback.failure(paramTwitterException);
    }

    public void success(Result<OAuth2Token> paramResult)
    {
      AppSession localAppSession = new AppSession((OAuth2Token)paramResult.data);
      this.appSessionManager.setSession(localAppSession.getId(), localAppSession);
      if (this.callback != null)
        this.callback.success(new Result(localAppSession, paramResult.response));
    }
  }
}