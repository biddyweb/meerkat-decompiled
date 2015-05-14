package com.twitter.sdk.android.core.internal.oauth;

import com.twitter.sdk.android.core.TwitterAuthConfig;
import java.util.Map;

public abstract interface AuthHeaders
{
  public static final String HEADER_AUTHORIZATION = "Authorization";

  public abstract Map<String, String> getAuthHeaders(TwitterAuthConfig paramTwitterAuthConfig, String paramString1, String paramString2, Map<String, String> paramMap);
}