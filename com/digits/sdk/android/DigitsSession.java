package com.digits.sdk.android;

import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.twitter.sdk.android.core.AuthToken;
import com.twitter.sdk.android.core.AuthTokenAdapter;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.persistence.SerializationStrategy;
import java.util.Iterator;
import java.util.List;
import retrofit.client.Header;
import retrofit.client.Response;

public class DigitsSession extends Session<AuthToken>
{
  public static final long LOGGED_OUT_USER_ID = 0L;
  static final String SECRET_HEADER = "x-twitter-new-account-oauth-secret";
  static final String TOKEN_HEADER = "x-twitter-new-account-oauth-access-token";
  public static final long UNKNOWN_USER_ID = -1L;

  public DigitsSession(AuthToken paramAuthToken, long paramLong)
  {
    super(paramAuthToken, paramLong);
  }

  public DigitsSession(OAuth2Token paramOAuth2Token)
  {
    this(paramOAuth2Token, 0L);
  }

  static DigitsSession create(DigitsSessionResponse paramDigitsSessionResponse)
  {
    if (paramDigitsSessionResponse == null)
      throw new IllegalArgumentException("result must not be null");
    return new DigitsSession(new TwitterAuthToken(paramDigitsSessionResponse.token, paramDigitsSessionResponse.secret), paramDigitsSessionResponse.userId);
  }

  static DigitsSession create(Result<DigitsUser> paramResult)
  {
    if (paramResult == null)
      throw new IllegalArgumentException("result must not be null");
    if (paramResult.data == null)
      throw new IllegalArgumentException("result.data must not be null");
    if (paramResult.response == null)
      throw new IllegalArgumentException("result.response must not be null");
    List localList = paramResult.response.getHeaders();
    String str1 = "";
    String str2 = "";
    Iterator localIterator = localList.iterator();
    while (true)
    {
      Header localHeader;
      if (localIterator.hasNext())
      {
        localHeader = (Header)localIterator.next();
        if (!"x-twitter-new-account-oauth-access-token".equals(localHeader.getName()))
          break label152;
        str1 = localHeader.getValue();
      }
      while ((!TextUtils.isEmpty(str1)) && (!TextUtils.isEmpty(str2)))
      {
        return new DigitsSession(new TwitterAuthToken(str1, str2), ((DigitsUser)paramResult.data).id);
        label152: if ("x-twitter-new-account-oauth-secret".equals(localHeader.getName()))
          str2 = localHeader.getValue();
      }
    }
  }

  public static DigitsSession create(TwitterSession paramTwitterSession)
  {
    return new DigitsSession(paramTwitterSession.getAuthToken(), paramTwitterSession.getUserId());
  }

  public boolean isLoggedOutUser()
  {
    return getId() == 0L;
  }

  public static class Serializer
    implements SerializationStrategy<DigitsSession>
  {
    private static final String TAG = "Digits";
    private final Gson gson = new GsonBuilder().registerTypeAdapter(AuthToken.class, new AuthTokenAdapter()).create();

    public DigitsSession deserialize(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
        try
        {
          DigitsSession localDigitsSession = (DigitsSession)this.gson.fromJson(paramString, DigitsSession.class);
          return localDigitsSession;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Digits", localException.getMessage());
        }
      return null;
    }

    public String serialize(DigitsSession paramDigitsSession)
    {
      if ((paramDigitsSession != null) && (paramDigitsSession.getAuthToken() != null))
        try
        {
          String str = this.gson.toJson(paramDigitsSession);
          return str;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Digits", localException.getMessage());
        }
      return "";
    }
  }
}