package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthException;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.internal.scribe.DefaultScribeClient;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace.Builder;
import com.twitter.sdk.android.core.internal.scribe.TwitterCoreScribeClientHolder;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

public class TwitterAuthClient
{
  private static final String SCRIBE_ACTION = "impression";
  private static final String SCRIBE_CLIENT = "android";
  private static final String SCRIBE_COMPONENT = "";
  private static final String SCRIBE_ELEMENT = "";
  private static final String SCRIBE_LOGIN_PAGE = "login";
  private static final String SCRIBE_SECTION = "";
  private static final String SCRIBE_SHARE_EMAIL_PAGE = "shareemail";
  private final TwitterAuthConfig authConfig;
  final AuthState authState;
  private final Context context;
  final SessionManager<TwitterSession> sessionManager;

  public TwitterAuthClient()
  {
    this(TwitterCore.getInstance().getContext(), TwitterCore.getInstance().getAuthConfig(), TwitterCore.getInstance().getSessionManager(), AuthStateLazyHolder.INSTANCE);
  }

  TwitterAuthClient(Context paramContext, TwitterAuthConfig paramTwitterAuthConfig, SessionManager<TwitterSession> paramSessionManager, AuthState paramAuthState)
  {
    this.authState = paramAuthState;
    this.context = paramContext;
    this.authConfig = paramTwitterAuthConfig;
    this.sessionManager = paramSessionManager;
  }

  private boolean authorizeUsingOAuth(Activity paramActivity, CallbackWrapper paramCallbackWrapper)
  {
    Fabric.getLogger().d("Twitter", "Using OAuth");
    return this.authState.beginAuthorize(paramActivity, new OAuthHandler(this.authConfig, paramCallbackWrapper, this.authConfig.getRequestCode()));
  }

  private boolean authorizeUsingSSO(Activity paramActivity, CallbackWrapper paramCallbackWrapper)
  {
    if (SSOAuthHandler.isAvailable(paramActivity))
    {
      Fabric.getLogger().d("Twitter", "Using SSO");
      return this.authState.beginAuthorize(paramActivity, new SSOAuthHandler(this.authConfig, paramCallbackWrapper, this.authConfig.getRequestCode()));
    }
    return false;
  }

  private void handleAuthorize(Activity paramActivity, Callback<TwitterSession> paramCallback)
  {
    scribeAuthorizeImpression();
    CallbackWrapper localCallbackWrapper = new CallbackWrapper(this.sessionManager, paramCallback);
    if ((!authorizeUsingSSO(paramActivity, localCallbackWrapper)) && (!authorizeUsingOAuth(paramActivity, localCallbackWrapper)))
      localCallbackWrapper.failure(new TwitterAuthException("Authorize failed."));
  }

  private void scribeAuthorizeImpression()
  {
    DefaultScribeClient localDefaultScribeClient = getScribeClient();
    if (localDefaultScribeClient == null)
      return;
    localDefaultScribeClient.scribeSyndicatedSdkImpressionEvents(new EventNamespace[] { new EventNamespace.Builder().setClient("android").setPage("login").setSection("").setComponent("").setElement("").setAction("impression").builder() });
  }

  private void scribeRequestEmail()
  {
    DefaultScribeClient localDefaultScribeClient = getScribeClient();
    if (localDefaultScribeClient == null)
      return;
    localDefaultScribeClient.scribeSyndicatedSdkImpressionEvents(new EventNamespace[] { new EventNamespace.Builder().setClient("android").setPage("shareemail").setSection("").setComponent("").setElement("").setAction("impression").builder() });
  }

  public void authorize(Activity paramActivity, Callback<TwitterSession> paramCallback)
  {
    if (paramActivity == null)
      throw new IllegalArgumentException("Activity must not be null.");
    if (paramCallback == null)
      throw new IllegalArgumentException("Callback must not be null.");
    if (paramActivity.isFinishing())
    {
      Fabric.getLogger().e("Twitter", "Cannot authorize, activity is finishing.", null);
      return;
    }
    handleAuthorize(paramActivity, paramCallback);
  }

  public int getRequestCode()
  {
    return this.authConfig.getRequestCode();
  }

  protected DefaultScribeClient getScribeClient()
  {
    return TwitterCoreScribeClientHolder.getScribeClient();
  }

  Intent newShareEmailIntent(TwitterSession paramTwitterSession, Callback<String> paramCallback)
  {
    return new Intent(this.context, ShareEmailActivity.class).setFlags(268435456).putExtra("session_id", paramTwitterSession.getId()).putExtra("result_receiver", new ShareEmailResultReceiver(paramCallback));
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fabric.getLogger().d("Twitter", "onActivityResult called with " + paramInt1 + " " + paramInt2);
    if (!this.authState.isAuthorizeInProgress())
      Fabric.getLogger().e("Twitter", "Authorize not in progress", null);
    AuthHandler localAuthHandler;
    do
    {
      return;
      localAuthHandler = this.authState.getAuthHandler();
    }
    while ((localAuthHandler == null) || (!localAuthHandler.handleOnActivityResult(paramInt1, paramInt2, paramIntent)));
    this.authState.endAuthorize();
  }

  public void requestEmail(TwitterSession paramTwitterSession, Callback<String> paramCallback)
  {
    if (paramTwitterSession == null)
      throw new IllegalArgumentException("Session must not be null.");
    if (paramCallback == null)
      throw new IllegalArgumentException("Callback must not be null.");
    scribeRequestEmail();
    this.context.startActivity(newShareEmailIntent(paramTwitterSession, paramCallback));
  }

  private static class AuthStateLazyHolder
  {
    private static final AuthState INSTANCE = new AuthState();
  }

  static class CallbackWrapper extends Callback<TwitterSession>
  {
    private final Callback<TwitterSession> callback;
    private final SessionManager<TwitterSession> sessionManager;

    public CallbackWrapper(SessionManager<TwitterSession> paramSessionManager, Callback<TwitterSession> paramCallback)
    {
      this.sessionManager = paramSessionManager;
      this.callback = paramCallback;
    }

    public void failure(TwitterException paramTwitterException)
    {
      Fabric.getLogger().e("Twitter", "Authorization completed with an error", paramTwitterException);
      this.callback.failure(paramTwitterException);
    }

    public void success(Result<TwitterSession> paramResult)
    {
      Fabric.getLogger().d("Twitter", "Authorization completed successfully");
      this.sessionManager.setActiveSession((Session)paramResult.data);
      this.callback.success(paramResult);
    }
  }
}