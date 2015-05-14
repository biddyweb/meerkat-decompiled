package com.twitter.sdk.android.core.internal.oauth;

import android.net.Uri;
import android.net.Uri.Builder;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.internal.TwitterApi;
import io.fabric.sdk.android.services.network.HttpMethod;
import io.fabric.sdk.android.services.network.UrlUtils;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.TreeMap;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RestAdapter;
import retrofit.client.Response;
import retrofit.http.Header;
import retrofit.http.POST;
import retrofit.http.Query;

public class OAuth1aService extends OAuthService
{
  private static final String CALLBACK_URL = "twittersdk://callback";
  private static final String PARAM_SCREEN_NAME = "screen_name";
  private static final String PARAM_USER_ID = "user_id";
  private static final String RESOURCE_OAUTH = "oauth";
  OAuthApi api = (OAuthApi)getApiAdapter().create(OAuthApi.class);

  public OAuth1aService(TwitterCore paramTwitterCore, SSLSocketFactory paramSSLSocketFactory, TwitterApi paramTwitterApi)
  {
    super(paramTwitterCore, paramSSLSocketFactory, paramTwitterApi);
  }

  public static String getAuthorizationHeader(TwitterAuthConfig paramTwitterAuthConfig, TwitterAuthToken paramTwitterAuthToken, String paramString1, String paramString2, String paramString3, Map<String, String> paramMap)
  {
    return new OAuth1aParameters(paramTwitterAuthConfig, paramTwitterAuthToken, paramString1, paramString2, paramString3, paramMap).getAuthorizationHeader();
  }

  public static OAuthResponse parseAuthResponse(String paramString)
  {
    TreeMap localTreeMap = UrlUtils.getQueryParams(paramString, false);
    String str1 = (String)localTreeMap.get("oauth_token");
    String str2 = (String)localTreeMap.get("oauth_token_secret");
    String str3 = (String)localTreeMap.get("screen_name");
    if (localTreeMap.containsKey("user_id"));
    for (long l = Long.parseLong((String)localTreeMap.get("user_id")); (str1 == null) || (str2 == null); l = 0L)
      return null;
    return new OAuthResponse(new TwitterAuthToken(str1, str2), str3, l);
  }

  public static void signRequest(TwitterAuthConfig paramTwitterAuthConfig, TwitterAuthToken paramTwitterAuthToken, HttpURLConnection paramHttpURLConnection, Map<String, String> paramMap)
  {
    paramHttpURLConnection.setRequestProperty("Authorization", getAuthorizationHeader(paramTwitterAuthConfig, paramTwitterAuthToken, null, HttpMethod.valueOf(paramHttpURLConnection.getRequestMethod()).name(), paramHttpURLConnection.getURL().toString(), paramMap));
  }

  public String buildCallbackUrl(TwitterAuthConfig paramTwitterAuthConfig)
  {
    return Uri.parse("twittersdk://callback").buildUpon().appendQueryParameter("version", getTwitterCore().getVersion()).appendQueryParameter("app", paramTwitterAuthConfig.getConsumerKey()).build().toString();
  }

  String getAccessTokenUrl()
  {
    return getApi().getBaseHostUrl() + "/oauth/access_token";
  }

  public String getAuthorizeUrl(TwitterAuthToken paramTwitterAuthToken)
  {
    return getApi().buildUponBaseHostUrl(new String[] { "oauth", "authorize" }).appendQueryParameter("oauth_token", paramTwitterAuthToken.token).build().toString();
  }

  Callback<Response> getCallbackWrapper(final Callback<OAuthResponse> paramCallback)
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        paramCallback.failure(paramAnonymousTwitterException);
      }

      // ERROR //
      public void success(com.twitter.sdk.android.core.Result<Response> paramAnonymousResult)
      {
        // Byte code:
        //   0: new 33\011java/lang/StringBuilder
        //   3: dup
        //   4: invokespecial 34\011java/lang/StringBuilder:<init>\011()V
        //   7: astore_2
        //   8: new 36\011java/io/BufferedReader
        //   11: dup
        //   12: new 38\011java/io/InputStreamReader
        //   15: dup
        //   16: aload_1
        //   17: getfield 44\011com/twitter/sdk/android/core/Result:data\011Ljava/lang/Object;
        //   20: checkcast 46\011retrofit/client/Response
        //   23: invokevirtual 50\011retrofit/client/Response:getBody\011()Lretrofit/mime/TypedInput;
        //   26: invokeinterface 56 1 0
        //   31: invokespecial 59\011java/io/InputStreamReader:<init>\011(Ljava/io/InputStream;)V
        //   34: invokespecial 62\011java/io/BufferedReader:<init>\011(Ljava/io/Reader;)V
        //   37: astore_3
        //   38: aload_3
        //   39: invokevirtual 66\011java/io/BufferedReader:readLine\011()Ljava/lang/String;
        //   42: astore 7
        //   44: aload 7
        //   46: ifnull +55 -> 101
        //   49: aload_2
        //   50: aload 7
        //   52: invokevirtual 70\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   55: pop
        //   56: goto -18 -> 38
        //   59: astore 4
        //   61: aload_3
        //   62: astore 5
        //   64: aload 5
        //   66: ifnull +8 -> 74
        //   69: aload 5
        //   71: invokevirtual 73\011java/io/BufferedReader:close\011()V
        //   74: aload 4
        //   76: athrow
        //   77: astore 6
        //   79: aload_0
        //   80: getfield 20\011com/twitter/sdk/android/core/internal/oauth/OAuth1aService$1:val$callback\011Lcom/twitter/sdk/android/core/Callback;
        //   83: new 75\011com/twitter/sdk/android/core/TwitterAuthException
        //   86: dup
        //   87: aload 6
        //   89: invokevirtual 78\011java/io/IOException:getMessage\011()Ljava/lang/String;
        //   92: aload 6
        //   94: invokespecial 81\011com/twitter/sdk/android/core/TwitterAuthException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
        //   97: invokevirtual 27\011com/twitter/sdk/android/core/Callback:failure\011(Lcom/twitter/sdk/android/core/TwitterException;)V
        //   100: return
        //   101: aload_3
        //   102: ifnull +7 -> 109
        //   105: aload_3
        //   106: invokevirtual 73\011java/io/BufferedReader:close\011()V
        //   109: aload_2
        //   110: invokevirtual 84\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   113: astore 9
        //   115: aload 9
        //   117: invokestatic 88\011com/twitter/sdk/android/core/internal/oauth/OAuth1aService:parseAuthResponse\011(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;
        //   120: astore 10
        //   122: aload 10
        //   124: ifnonnull +40 -> 164
        //   127: aload_0
        //   128: getfield 20\011com/twitter/sdk/android/core/internal/oauth/OAuth1aService$1:val$callback\011Lcom/twitter/sdk/android/core/Callback;
        //   131: new 75\011com/twitter/sdk/android/core/TwitterAuthException
        //   134: dup
        //   135: new 33\011java/lang/StringBuilder
        //   138: dup
        //   139: invokespecial 34\011java/lang/StringBuilder:<init>\011()V
        //   142: ldc 90
        //   144: invokevirtual 70\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   147: aload 9
        //   149: invokevirtual 70\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   152: invokevirtual 84\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   155: invokespecial 93\011com/twitter/sdk/android/core/TwitterAuthException:<init>\011(Ljava/lang/String;)V
        //   158: invokevirtual 27\011com/twitter/sdk/android/core/Callback:failure\011(Lcom/twitter/sdk/android/core/TwitterException;)V
        //   161: goto +36 -> 197
        //   164: aload_0
        //   165: getfield 20\011com/twitter/sdk/android/core/internal/oauth/OAuth1aService$1:val$callback\011Lcom/twitter/sdk/android/core/Callback;
        //   168: new 40\011com/twitter/sdk/android/core/Result
        //   171: dup
        //   172: aload 10
        //   174: aconst_null
        //   175: invokespecial 96\011com/twitter/sdk/android/core/Result:<init>\011(Ljava/lang/Object;Lretrofit/client/Response;)V
        //   178: invokevirtual 98\011com/twitter/sdk/android/core/Callback:success\011(Lcom/twitter/sdk/android/core/Result;)V
        //   181: goto +16 -> 197
        //   184: astore 6
        //   186: goto -107 -> 79
        //   189: astore 4
        //   191: aconst_null
        //   192: astore 5
        //   194: goto -130 -> 64
        //   197: return
        //
        // Exception table:
        //   from\011to\011target\011type
        //   38\01144\01159\011finally
        //   49\01156\01159\011finally
        //   69\01174\01177\011java/io/IOException
        //   74\01177\01177\011java/io/IOException
        //   105\011109\011184\011java/io/IOException
        //   109\011122\011184\011java/io/IOException
        //   127\011161\011184\011java/io/IOException
        //   164\011181\011184\011java/io/IOException
        //   8\01138\011189\011finally
      }
    };
  }

  String getTempTokenUrl()
  {
    return getApi().getBaseHostUrl() + "/oauth/request_token";
  }

  public void requestAccessToken(Callback<OAuthResponse> paramCallback, TwitterAuthToken paramTwitterAuthToken, String paramString)
  {
    String str1 = getAccessTokenUrl();
    String str2 = getAuthorizationHeader(getTwitterCore().getAuthConfig(), paramTwitterAuthToken, null, "POST", str1, null);
    this.api.getAccessToken(str2, paramString, getCallbackWrapper(paramCallback));
  }

  public void requestTempToken(Callback<OAuthResponse> paramCallback)
  {
    TwitterAuthConfig localTwitterAuthConfig = getTwitterCore().getAuthConfig();
    String str = getTempTokenUrl();
    this.api.getTempToken(getAuthorizationHeader(localTwitterAuthConfig, null, buildCallbackUrl(localTwitterAuthConfig), "POST", str, null), getCallbackWrapper(paramCallback));
  }

  static abstract interface OAuthApi
  {
    @POST("/oauth/access_token")
    public abstract void getAccessToken(@Header("Authorization") String paramString1, @Query("oauth_verifier") String paramString2, Callback<Response> paramCallback);

    @POST("/oauth/request_token")
    public abstract void getTempToken(@Header("Authorization") String paramString, Callback<Response> paramCallback);
  }
}