package com.digits.sdk.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.TwitterApi;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Service;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace.Builder;
import retrofit.client.Response;

public class DigitsClient
{
  public static final String EXTRA_FALLBACK_REASON = "fallback_reason";
  public static final String EXTRA_PHONE = "phone_number";
  public static final String EXTRA_REQUEST_ID = "request_id";
  public static final String EXTRA_RESULT_RECEIVER = "receiver";
  public static final String EXTRA_USER_ID = "user_id";
  private static final String SCRIBE_ACTION = "impression";
  private static final String SCRIBE_CLIENT = "android";
  private static final String SCRIBE_COMPONENT = "";
  private static final String SCRIBE_ELEMENT = "";
  private static final String SCRIBE_PAGE = "digits";
  private static final String SCRIBE_SECTION = "";
  public static final String THIRD_PARTY_CONFIRMATION_CODE = "third_party_confirmation_code";
  private final OAuth2Service authService;
  private final Digits digits;
  protected DigitsAPIProvider digitsAPIProvider;
  private final SessionManager<DigitsSession> sessionManager;
  private final TwitterCore twitterCore;

  DigitsClient()
  {
    this(Digits.getInstance(), TwitterCore.getInstance(), Digits.getSessionManager(), new OAuth2Service(TwitterCore.getInstance(), TwitterCore.getInstance().getSSLSocketFactory(), new TwitterApi()), null);
  }

  DigitsClient(Digits paramDigits, TwitterCore paramTwitterCore, SessionManager<DigitsSession> paramSessionManager, OAuth2Service paramOAuth2Service, DigitsAPIProvider paramDigitsAPIProvider)
  {
    if (paramTwitterCore == null)
      throw new IllegalArgumentException("twitter must not be null");
    if (paramDigits == null)
      throw new IllegalArgumentException("digits must not be null");
    if (paramSessionManager == null)
      throw new IllegalArgumentException("sessionManager must not be null");
    if (paramOAuth2Service == null)
      throw new IllegalArgumentException("authService must not be null");
    this.twitterCore = paramTwitterCore;
    this.digits = paramDigits;
    this.sessionManager = paramSessionManager;
    this.authService = paramOAuth2Service;
    this.digitsAPIProvider = paramDigitsAPIProvider;
  }

  private void scribeImpression()
  {
    EventNamespace localEventNamespace = new EventNamespace.Builder().setClient("android").setPage("digits").setSection("").setComponent("").setElement("").setAction("impression").builder();
    this.digits.scribe(new EventNamespace[] { localEventNamespace });
  }

  private DigitsSession setSession(Result<OAuth2Token> paramResult)
  {
    DigitsSession localDigitsSession = new DigitsSession((OAuth2Token)paramResult.data);
    this.sessionManager.setSession(0L, localDigitsSession);
    return localDigitsSession;
  }

  private void startPhoneNumberActivity(AuthCallback paramAuthCallback, Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, this.digits.getActivityClassManager().getPhoneNumberActivity());
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("receiver", new LoginResultReceiver(paramAuthCallback, this.sessionManager));
    localIntent.putExtras(localBundle);
    localIntent.setFlags(268435456);
    paramContext.startActivity(localIntent);
  }

  protected void authDevice(String paramString, Callback<AuthResponse> paramCallback)
  {
    this.digitsAPIProvider.getSdkService().auth(paramString, paramCallback);
  }

  protected void createAccount(String paramString1, String paramString2, Callback<DigitsUser> paramCallback)
  {
    this.digitsAPIProvider.getSdkService().account(paramString2, paramString1, paramCallback);
  }

  protected void loginDevice(String paramString1, long paramLong, String paramString2, Callback<DigitsSessionResponse> paramCallback)
  {
    this.digitsAPIProvider.getSdkService().login(paramString1, paramLong, paramString2, paramCallback);
  }

  protected void registerDevice(Context paramContext, DigitsController paramDigitsController, String paramString, Callback<Response> paramCallback)
  {
    this.authService.requestGuestOrAppAuthToken(new DigitsClient.1(this, paramContext, paramDigitsController, paramString, paramCallback));
  }

  protected void startSignUp(AuthCallback paramAuthCallback)
  {
    startSignUp(paramAuthCallback, this.twitterCore.getContext());
  }

  void startSignUp(AuthCallback paramAuthCallback, Context paramContext)
  {
    scribeImpression();
    DigitsSession localDigitsSession = (DigitsSession)this.sessionManager.getActiveSession();
    if ((localDigitsSession != null) && (!localDigitsSession.isLoggedOutUser()))
    {
      paramAuthCallback.success(localDigitsSession, null);
      return;
    }
    startPhoneNumberActivity(paramAuthCallback, paramContext);
  }

  protected void verifyPin(String paramString1, long paramLong, String paramString2, Callback<DigitsSessionResponse> paramCallback)
  {
    this.digitsAPIProvider.getSdkService().verifyPin(paramString1, paramLong, paramString2, paramCallback);
  }
}