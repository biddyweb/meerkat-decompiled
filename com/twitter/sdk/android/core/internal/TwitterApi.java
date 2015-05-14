package com.twitter.sdk.android.core.internal;

import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build;
import android.os.Build.VERSION;

public class TwitterApi
{
  public static final String BASE_HOST = "api.twitter.com";
  public static final String BASE_HOST_URL = "https://api.twitter.com";
  private final String baseHostUrl;

  public TwitterApi()
  {
    this("https://api.twitter.com");
  }

  public TwitterApi(String paramString)
  {
    this.baseHostUrl = paramString;
  }

  public static String buildUserAgent(String paramString1, String paramString2)
  {
    return paramString1 + '/' + paramString2 + ' ' + Build.MODEL + '/' + Build.VERSION.RELEASE + " (" + Build.MANUFACTURER + ';' + Build.MODEL + ';' + Build.BRAND + ';' + Build.PRODUCT + ')';
  }

  public Uri.Builder buildUponBaseHostUrl(String[] paramArrayOfString)
  {
    Uri.Builder localBuilder = Uri.parse(getBaseHostUrl()).buildUpon();
    if (paramArrayOfString != null)
    {
      int i = paramArrayOfString.length;
      for (int j = 0; j < i; j++)
        localBuilder.appendPath(paramArrayOfString[j]);
    }
    return localBuilder;
  }

  public String getBaseHostUrl()
  {
    return this.baseHostUrl;
  }
}