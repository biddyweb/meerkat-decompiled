package com.twitter.sdk.android.core;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.twitter.sdk.android.core.internal.oauth.OAuth1aService;
import java.net.HttpURLConnection;
import java.util.Map;

public class TwitterAuthConfig
  implements Parcelable
{
  public static final Parcelable.Creator<TwitterAuthConfig> CREATOR = new Parcelable.Creator()
  {
    public TwitterAuthConfig createFromParcel(Parcel paramAnonymousParcel)
    {
      return new TwitterAuthConfig(paramAnonymousParcel, null);
    }

    public TwitterAuthConfig[] newArray(int paramAnonymousInt)
    {
      return new TwitterAuthConfig[paramAnonymousInt];
    }
  };
  public static final int DEFAULT_AUTH_REQUEST_CODE = 140;
  private final String consumerKey;
  private final String consumerSecret;

  private TwitterAuthConfig(Parcel paramParcel)
  {
    this.consumerKey = paramParcel.readString();
    this.consumerSecret = paramParcel.readString();
  }

  public TwitterAuthConfig(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException("TwitterAuthConfig must not be created with null consumer key or secret.");
    this.consumerKey = sanitizeAttribute(paramString1);
    this.consumerSecret = sanitizeAttribute(paramString2);
  }

  static String sanitizeAttribute(String paramString)
  {
    if (paramString != null)
      return paramString.trim();
    return null;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getConsumerKey()
  {
    return this.consumerKey;
  }

  public String getConsumerSecret()
  {
    return this.consumerSecret;
  }

  public int getRequestCode()
  {
    return 140;
  }

  public void signRequest(TwitterAuthToken paramTwitterAuthToken, HttpURLConnection paramHttpURLConnection)
  {
    OAuth1aService.signRequest(this, paramTwitterAuthToken, paramHttpURLConnection, null);
  }

  public void signRequest(TwitterAuthToken paramTwitterAuthToken, HttpURLConnection paramHttpURLConnection, Map<String, String> paramMap)
  {
    OAuth1aService.signRequest(this, paramTwitterAuthToken, paramHttpURLConnection, paramMap);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.consumerKey);
    paramParcel.writeString(this.consumerSecret);
  }
}