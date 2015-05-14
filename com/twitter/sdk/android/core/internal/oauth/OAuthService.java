package com.twitter.sdk.android.core.internal.oauth;

import com.twitter.sdk.android.core.DefaultClient;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.TwitterApi;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RequestInterceptor;
import retrofit.RequestInterceptor.RequestFacade;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;

abstract class OAuthService
{
  private static final String CLIENT_NAME = "TwitterAndroidSDK";
  private final TwitterApi api;
  private final RestAdapter apiAdapter;
  private final SSLSocketFactory sslSocketFactory;
  private final TwitterCore twitterCore;
  private final String userAgent;

  public OAuthService(TwitterCore paramTwitterCore, SSLSocketFactory paramSSLSocketFactory, TwitterApi paramTwitterApi)
  {
    this.twitterCore = paramTwitterCore;
    this.sslSocketFactory = paramSSLSocketFactory;
    this.api = paramTwitterApi;
    this.userAgent = TwitterApi.buildUserAgent("TwitterAndroidSDK", paramTwitterCore.getVersion());
    this.apiAdapter = new RestAdapter.Builder().setEndpoint(getApi().getBaseHostUrl()).setClient(new DefaultClient(this.sslSocketFactory)).setRequestInterceptor(new RequestInterceptor()
    {
      public void intercept(RequestInterceptor.RequestFacade paramAnonymousRequestFacade)
      {
        paramAnonymousRequestFacade.addHeader("User-Agent", OAuthService.this.getUserAgent());
      }
    }).build();
  }

  protected TwitterApi getApi()
  {
    return this.api;
  }

  protected RestAdapter getApiAdapter()
  {
    return this.apiAdapter;
  }

  protected SSLSocketFactory getSSLSocketFactory()
  {
    return this.sslSocketFactory;
  }

  protected TwitterCore getTwitterCore()
  {
    return this.twitterCore;
  }

  protected String getUserAgent()
  {
    return this.userAgent;
  }
}