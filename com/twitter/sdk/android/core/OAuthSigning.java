package com.twitter.sdk.android.core;

import com.twitter.sdk.android.core.internal.oauth.OAuth1aService;
import io.fabric.sdk.android.services.network.HttpMethod;
import java.util.HashMap;
import java.util.Map;

public class OAuthSigning
{
  static final String HEADER_AUTH_CREDENTIALS = "X-Verify-Credentials-Authorization";
  static final String HEADER_AUTH_SERVICE_PROVIDER = "X-Auth-Service-Provider";
  static final String VERIFY_CREDENTIALS_URL = "https://api.twitter.com/1.1/account/verify_credentials.json";
  private final TwitterAuthConfig authConfig;
  private final TwitterAuthToken authToken;

  public OAuthSigning(TwitterAuthConfig paramTwitterAuthConfig, TwitterAuthToken paramTwitterAuthToken)
  {
    if (paramTwitterAuthConfig == null)
      throw new IllegalArgumentException("authConfig must not be null");
    if (paramTwitterAuthToken == null)
      throw new IllegalArgumentException("authToken must not be null");
    this.authConfig = paramTwitterAuthConfig;
    this.authToken = paramTwitterAuthToken;
  }

  Map<String, String> getOAuthEchoHeaders(TwitterAuthConfig paramTwitterAuthConfig, TwitterAuthToken paramTwitterAuthToken, String paramString1, String paramString2, String paramString3, Map<String, String> paramMap)
  {
    HashMap localHashMap = new HashMap(2);
    localHashMap.put("X-Verify-Credentials-Authorization", OAuth1aService.getAuthorizationHeader(paramTwitterAuthConfig, paramTwitterAuthToken, paramString1, paramString2, paramString3, paramMap));
    localHashMap.put("X-Auth-Service-Provider", paramString3);
    return localHashMap;
  }

  public Map<String, String> getOAuthEchoHeaders(String paramString1, String paramString2, Map<String, String> paramMap)
  {
    return getOAuthEchoHeaders(this.authConfig, this.authToken, null, paramString1, paramString2, paramMap);
  }

  public Map<String, String> getOAuthEchoHeadersForVerifyCredentials()
  {
    return getOAuthEchoHeaders(this.authConfig, this.authToken, null, HttpMethod.GET.name(), "https://api.twitter.com/1.1/account/verify_credentials.json", null);
  }
}