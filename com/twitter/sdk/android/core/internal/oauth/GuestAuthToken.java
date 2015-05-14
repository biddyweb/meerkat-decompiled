package com.twitter.sdk.android.core.internal.oauth;

import com.google.gson.annotations.SerializedName;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import java.util.Map;

public class GuestAuthToken extends OAuth2Token
{
  private static final long EXPIRES_IN_MS = 10800000L;
  public static final String HEADER_GUEST_TOKEN = "x-guest-token";

  @SerializedName("guest_token")
  private final String guestToken;

  public GuestAuthToken(String paramString1, String paramString2, String paramString3)
  {
    super(paramString1, paramString2);
    this.guestToken = paramString3;
  }

  public GuestAuthToken(String paramString1, String paramString2, String paramString3, long paramLong)
  {
    super(paramString1, paramString2, paramLong);
    this.guestToken = paramString3;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    GuestAuthToken localGuestAuthToken;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      if (!super.equals(paramObject))
        return false;
      localGuestAuthToken = (GuestAuthToken)paramObject;
      if (this.guestToken == null)
        break;
    }
    while (this.guestToken.equals(localGuestAuthToken.guestToken));
    while (true)
    {
      return false;
      if (localGuestAuthToken.guestToken == null)
        break;
    }
  }

  public Map<String, String> getAuthHeaders(TwitterAuthConfig paramTwitterAuthConfig, String paramString1, String paramString2, Map<String, String> paramMap)
  {
    Map localMap = super.getAuthHeaders(paramTwitterAuthConfig, paramString1, paramString2, paramMap);
    localMap.put("x-guest-token", getGuestToken());
    return localMap;
  }

  public String getGuestToken()
  {
    return this.guestToken;
  }

  public int hashCode()
  {
    int i = 31 * super.hashCode();
    if (this.guestToken != null);
    for (int j = this.guestToken.hashCode(); ; j = 0)
      return i + j;
  }

  public boolean isExpired()
  {
    return System.currentTimeMillis() >= 10800000L + this.createdAt;
  }
}