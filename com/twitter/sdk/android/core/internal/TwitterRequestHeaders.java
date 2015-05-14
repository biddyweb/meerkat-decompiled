package com.twitter.sdk.android.core.internal;

import android.text.TextUtils;
import com.twitter.sdk.android.core.AuthToken;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class TwitterRequestHeaders
{
  public static final String HEADER_USER_AGENT = "User-Agent";
  private final TwitterAuthConfig authConfig;
  private final String method;
  private final Map<String, String> postParams;
  private final Session session;
  private final String url;
  private final String userAgent;

  public TwitterRequestHeaders(String paramString1, String paramString2, TwitterAuthConfig paramTwitterAuthConfig, Session paramSession, String paramString3, Map<String, String> paramMap)
  {
    this.method = paramString1;
    this.url = paramString2;
    this.authConfig = paramTwitterAuthConfig;
    this.session = paramSession;
    this.userAgent = paramString3;
    this.postParams = paramMap;
  }

  public Map<String, String> getAuthHeaders()
  {
    if ((this.session != null) && (this.session.getAuthToken() != null))
      return this.session.getAuthToken().getAuthHeaders(this.authConfig, getMethod(), this.url, getPostParams());
    return Collections.emptyMap();
  }

  protected Map<String, String> getExtraHeaders()
  {
    return Collections.emptyMap();
  }

  public final Map<String, String> getHeaders()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.putAll(getExtraHeaders());
    if (!TextUtils.isEmpty(this.userAgent))
      localHashMap.put("User-Agent", this.userAgent);
    localHashMap.putAll(getAuthHeaders());
    return localHashMap;
  }

  protected String getMethod()
  {
    return this.method;
  }

  protected Map<String, String> getPostParams()
  {
    return this.postParams;
  }
}