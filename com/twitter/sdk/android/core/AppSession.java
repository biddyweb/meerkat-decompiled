package com.twitter.sdk.android.core;

import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.twitter.sdk.android.core.internal.oauth.GuestAuthToken;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.persistence.SerializationStrategy;

public class AppSession extends Session<OAuth2Token>
{
  AppSession(GuestAuthToken paramGuestAuthToken)
  {
    super(paramGuestAuthToken, 0L);
  }

  AppSession(OAuth2Token paramOAuth2Token)
  {
    super(paramOAuth2Token, 0L);
  }

  static class Serializer
    implements SerializationStrategy<AppSession>
  {
    private final Gson gson = new GsonBuilder().registerTypeAdapter(OAuth2Token.class, new AuthTokenAdapter()).create();

    public AppSession deserialize(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
        try
        {
          AppSession localAppSession = (AppSession)this.gson.fromJson(paramString, AppSession.class);
          return localAppSession;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Twitter", "Failed to deserialize session " + localException.getMessage());
        }
      return null;
    }

    public String serialize(AppSession paramAppSession)
    {
      if ((paramAppSession != null) && (paramAppSession.getAuthToken() != null))
        try
        {
          String str = this.gson.toJson(paramAppSession);
          return str;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Twitter", "Failed to serialize session " + localException.getMessage());
        }
      return "";
    }
  }
}