package com.twitter.sdk.android.core.internal.oauth;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.twitter.sdk.android.core.AuthToken;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import java.util.HashMap;
import java.util.Map;

public class OAuth2Token extends AuthToken
  implements Parcelable
{
  public static final Parcelable.Creator<OAuth2Token> CREATOR = new Parcelable.Creator()
  {
    public OAuth2Token createFromParcel(Parcel paramAnonymousParcel)
    {
      return new OAuth2Token(paramAnonymousParcel, null);
    }

    public OAuth2Token[] newArray(int paramAnonymousInt)
    {
      return new OAuth2Token[paramAnonymousInt];
    }
  };
  public static final String TOKEN_TYPE_BEARER = "bearer";

  @SerializedName("access_token")
  private final String accessToken;

  @SerializedName("token_type")
  private final String tokenType;

  private OAuth2Token(Parcel paramParcel)
  {
    this.tokenType = paramParcel.readString();
    this.accessToken = paramParcel.readString();
  }

  public OAuth2Token(String paramString1, String paramString2)
  {
    this.tokenType = paramString1;
    this.accessToken = paramString2;
  }

  public OAuth2Token(String paramString1, String paramString2, long paramLong)
  {
    super(paramLong);
    this.tokenType = paramString1;
    this.accessToken = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    OAuth2Token localOAuth2Token;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localOAuth2Token = (OAuth2Token)paramObject;
      if (this.accessToken != null)
      {
        if (this.accessToken.equals(localOAuth2Token.accessToken));
      }
      else
        while (localOAuth2Token.accessToken != null)
          return false;
      if (this.tokenType == null)
        break;
    }
    while (this.tokenType.equals(localOAuth2Token.tokenType));
    while (true)
    {
      return false;
      if (localOAuth2Token.tokenType == null)
        break;
    }
  }

  public String getAccessToken()
  {
    return this.accessToken;
  }

  public Map<String, String> getAuthHeaders(TwitterAuthConfig paramTwitterAuthConfig, String paramString1, String paramString2, Map<String, String> paramMap)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("Authorization", OAuth2Service.getAuthorizationHeader(this));
    return localHashMap;
  }

  public String getTokenType()
  {
    return this.tokenType;
  }

  public int hashCode()
  {
    if (this.tokenType != null);
    for (int i = this.tokenType.hashCode(); ; i = 0)
    {
      int j = i * 31;
      String str = this.accessToken;
      int k = 0;
      if (str != null)
        k = this.accessToken.hashCode();
      return j + k;
    }
  }

  public boolean isExpired()
  {
    return false;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.tokenType);
    paramParcel.writeString(this.accessToken);
  }
}