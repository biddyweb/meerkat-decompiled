package com.twitter.sdk.android.tweetcomposer;

import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.services.concurrency.DependsOn;

@DependsOn({"Lcom/twitter/sdk/android/core/TwitterCore;"})
public class TweetComposer extends Kit<Boolean>
{
  private static final String MIME_TYPE_JPEG = "image/jpeg";
  private static final String MIME_TYPE_PLAIN_TEXT = "text/plain";
  private static final String TWITTER_PACKAGE_NAME = "com.twitter.android";
  private static final String WEB_INTENT = "https://twitter.com/intent/tweet?text=%s&url=%s";

  protected Boolean doInBackground()
  {
    return Boolean.valueOf(true);
  }

  public String getIdentifier()
  {
    return "com.twitter.sdk.android:tweet-composer";
  }

  public String getVersion()
  {
    return "0.7.3.33";
  }
}