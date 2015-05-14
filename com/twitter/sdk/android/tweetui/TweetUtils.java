package com.twitter.sdk.android.tweetui;

import android.net.Uri;
import android.text.TextUtils;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.models.User;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.util.List;
import java.util.Locale;

public final class TweetUtils
{
  static final String LOAD_TWEET_DEBUG = "loadTweet failure for Tweet Id %d.";
  private static final String PERMALINK_FORMAT = "https://twitter.com/%s/status/%d";
  private static final String TAG = "TweetUi";
  private static final String UNKNOWN_SCREEN_NAME = "twitter_unknown";

  static Uri getPermalink(String paramString, long paramLong)
  {
    if (paramLong <= 0L)
      return null;
    Locale localLocale2;
    Object[] arrayOfObject2;
    if (TextUtils.isEmpty(paramString))
    {
      localLocale2 = Locale.US;
      arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = "twitter_unknown";
      arrayOfObject2[1] = Long.valueOf(paramLong);
    }
    Locale localLocale1;
    Object[] arrayOfObject1;
    for (String str = String.format(localLocale2, "https://twitter.com/%s/status/%d", arrayOfObject2); ; str = String.format(localLocale1, "https://twitter.com/%s/status/%d", arrayOfObject1))
    {
      return Uri.parse(str);
      localLocale1 = Locale.US;
      arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = paramString;
      arrayOfObject1[1] = Long.valueOf(paramLong);
    }
  }

  static boolean isTweetResolvable(Tweet paramTweet)
  {
    return (paramTweet != null) && (paramTweet.id > 0L) && (paramTweet.user != null) && (!TextUtils.isEmpty(paramTweet.user.screenName));
  }

  public static void loadTweet(long paramLong, LoadCallback<Tweet> paramLoadCallback)
  {
    TweetUi.getInstance().getTweetRepository().loadTweet(paramLong, new LoggingCallback(paramLong, paramLoadCallback, Fabric.getLogger()));
  }

  public static void loadTweets(List<Long> paramList, LoadCallback<List<Tweet>> paramLoadCallback)
  {
    TweetUi.getInstance().getTweetRepository().loadTweets(paramList, paramLoadCallback);
  }

  static class LoggingCallback
    implements LoadCallback<Tweet>
  {
    private final LoadCallback<Tweet> cb;
    private final Logger logger;
    private final long tweetId;

    LoggingCallback(long paramLong, LoadCallback<Tweet> paramLoadCallback, Logger paramLogger)
    {
      this.tweetId = paramLong;
      this.cb = paramLoadCallback;
      this.logger = paramLogger;
    }

    public void failure(TwitterException paramTwitterException)
    {
      Logger localLogger = this.logger;
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Long.valueOf(this.tweetId);
      localLogger.d("TweetUi", String.format("loadTweet failure for Tweet Id %d.", arrayOfObject));
      if (this.cb != null)
        this.cb.failure(paramTwitterException);
    }

    public void success(Tweet paramTweet)
    {
      if (this.cb != null)
        this.cb.success(paramTweet);
    }
  }
}