package com.twitter.sdk.android.core;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.twitter.sdk.android.core.internal.oauth.OAuth1aService;
import java.util.HashMap;
import java.util.Map;

public class TwitterAuthToken extends AuthToken
  implements Parcelable
{
  public static final Parcelable.Creator<TwitterAuthToken> CREATOR = new Parcelable.Creator()
  {
    public TwitterAuthToken createFromParcel(Parcel paramAnonymousParcel)
    {
      return new TwitterAuthToken(paramAnonymousParcel, null);
    }

    public TwitterAuthToken[] newArray(int paramAnonymousInt)
    {
      return new TwitterAuthToken[paramAnonymousInt];
    }
  };

  @SerializedName("secret")
  public final String secret;

  @SerializedName("token")
  public final String token;

  private TwitterAuthToken(Parcel paramParcel)
  {
    this.token = paramParcel.readString();
    this.secret = paramParcel.readString();
  }

  public TwitterAuthToken(String paramString1, String paramString2)
  {
    this.token = paramString1;
    this.secret = paramString2;
  }

  TwitterAuthToken(String paramString1, String paramString2, long paramLong)
  {
    super(paramLong);
    this.token = paramString1;
    this.secret = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TwitterAuthToken localTwitterAuthToken;
    do
    {
      return true;
      if (!(paramObject instanceof TwitterAuthToken))
        return false;
      localTwitterAuthToken = (TwitterAuthToken)paramObject;
      if (this.secret != null)
      {
        if (this.secret.equals(localTwitterAuthToken.secret));
      }
      else
        while (localTwitterAuthToken.secret != null)
          return false;
      if (this.token == null)
        break;
    }
    while (this.token.equals(localTwitterAuthToken.token));
    while (true)
    {
      return false;
      if (localTwitterAuthToken.token == null)
        break;
    }
  }

  public Map<String, String> getAuthHeaders(TwitterAuthConfig paramTwitterAuthConfig, String paramString1, String paramString2, Map<String, String> paramMap)
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("Authorization", OAuth1aService.getAuthorizationHeader(paramTwitterAuthConfig, this, null, paramString1, paramString2, paramMap));
    return localHashMap;
  }

  public int hashCode()
  {
    if (this.token != null);
    for (int i = this.token.hashCode(); ; i = 0)
    {
      int j = i * 31;
      String str = this.secret;
      int k = 0;
      if (str != null)
        k = this.secret.hashCode();
      return j + k;
    }
  }

  public boolean isExpired()
  {
    return false;
  }

  public String toString()
  {
    return "token=" + this.token + ",secret=" + this.secret;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.token);
    paramParcel.writeString(this.secret);
  }
}