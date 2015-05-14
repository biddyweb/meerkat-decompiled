package com.twitter.sdk.android.core.internal.oauth;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.internal.TwitterApi;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.network.HttpRequest.Base64;
import io.fabric.sdk.android.services.network.UrlUtils;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RestAdapter;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.Header;
import retrofit.http.Headers;
import retrofit.http.POST;

public class OAuth2Service extends OAuthService
{
  OAuth2Api api = (OAuth2Api)getApiAdapter().create(OAuth2Api.class);

  public OAuth2Service(TwitterCore paramTwitterCore, SSLSocketFactory paramSSLSocketFactory, TwitterApi paramTwitterApi)
  {
    super(paramTwitterCore, paramSSLSocketFactory, paramTwitterApi);
  }

  private String getAuthHeader()
  {
    TwitterAuthConfig localTwitterAuthConfig = getTwitterCore().getAuthConfig();
    return "Basic " + HttpRequest.Base64.encode(new StringBuilder().append(UrlUtils.percentEncode(localTwitterAuthConfig.getConsumerKey())).append(":").append(UrlUtils.percentEncode(localTwitterAuthConfig.getConsumerSecret())).toString());
  }

  public static String getAuthorizationHeader(OAuth2Token paramOAuth2Token)
  {
    return "Bearer " + paramOAuth2Token.getAccessToken();
  }

  public void requestAppAuthToken(Callback<OAuth2Token> paramCallback)
  {
    this.api.getAppAuthToken(getAuthHeader(), "client_credentials", paramCallback);
  }

  public void requestGuestOrAppAuthToken(final Callback<OAuth2Token> paramCallback)
  {
    requestAppAuthToken(new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("Twitter", "Failed to get app auth token", paramAnonymousTwitterException);
        if (paramCallback != null)
          paramCallback.failure(paramAnonymousTwitterException);
      }

      public void success(Result<OAuth2Token> paramAnonymousResult)
      {
        final OAuth2Token localOAuth2Token = (OAuth2Token)paramAnonymousResult.data;
        Callback local1 = new Callback()
        {
          public void failure(TwitterException paramAnonymous2TwitterException)
          {
            Fabric.getLogger().e("Twitter", "Your app may be rate limited. Please talk to us regarding upgrading your consumer key.", paramAnonymous2TwitterException);
            OAuth2Service.1.this.val$callback.success(new Result(localOAuth2Token, null));
          }

          public void success(Result<GuestTokenResponse> paramAnonymous2Result)
          {
            GuestAuthToken localGuestAuthToken = new GuestAuthToken(localOAuth2Token.getTokenType(), localOAuth2Token.getAccessToken(), ((GuestTokenResponse)paramAnonymous2Result.data).guestToken);
            OAuth2Service.1.this.val$callback.success(new Result(localGuestAuthToken, null));
          }
        };
        OAuth2Service.this.requestGuestToken(local1, localOAuth2Token);
      }
    });
  }

  public void requestGuestToken(Callback<GuestTokenResponse> paramCallback, OAuth2Token paramOAuth2Token)
  {
    this.api.getGuestToken(getAuthorizationHeader(paramOAuth2Token), paramCallback);
  }

  static abstract interface OAuth2Api
  {
    @FormUrlEncoded
    @Headers({"Content-Type: application/x-www-form-urlencoded;charset=UTF-8"})
    @POST("/oauth2/token")
    public abstract void getAppAuthToken(@Header("Authorization") String paramString1, @Field("grant_type") String paramString2, Callback<OAuth2Token> paramCallback);

    @POST("/1.1/guest/activate.json")
    public abstract void getGuestToken(@Header("Authorization") String paramString, Callback<GuestTokenResponse> paramCallback);
  }
}