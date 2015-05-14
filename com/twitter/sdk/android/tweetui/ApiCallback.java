package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterApiException;
import com.twitter.sdk.android.core.TwitterException;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

abstract class ApiCallback<T> extends Callback<T>
{
  private static final String API_CALL_ERROR = "API call failure.";
  private static final String TAG = "TweetUi";
  protected final LoadCallback<T> cb;

  ApiCallback(LoadCallback<T> paramLoadCallback)
  {
    this.cb = paramLoadCallback;
  }

  public void failure(TwitterException paramTwitterException)
  {
    TwitterApiException localTwitterApiException = (TwitterApiException)paramTwitterException;
    int i = localTwitterApiException.getErrorCode();
    Fabric.getLogger().e("TweetUi", "API call failure.", localTwitterApiException);
    if ((i == 89) || (i == 239))
      TweetUi.getInstance().clearAppSession(0L);
    if (this.cb != null)
      this.cb.failure(paramTwitterException);
  }

  public abstract void success(Result<T> paramResult);
}