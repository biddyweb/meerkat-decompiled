package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.TwitterException;

public abstract interface LoadCallback<T>
{
  public abstract void failure(TwitterException paramTwitterException);

  public abstract void success(T paramT);
}