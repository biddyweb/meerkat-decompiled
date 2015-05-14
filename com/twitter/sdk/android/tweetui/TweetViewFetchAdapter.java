package com.twitter.sdk.android.tweetui;

import android.content.Context;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.Tweet;
import java.util.List;

public class TweetViewFetchAdapter<T extends BaseTweetView> extends TweetViewAdapter<T>
{
  public TweetViewFetchAdapter(Context paramContext)
  {
    super(paramContext);
  }

  public TweetViewFetchAdapter(Context paramContext, List<Long> paramList)
  {
    this(paramContext, paramList, null);
  }

  public TweetViewFetchAdapter(Context paramContext, List<Long> paramList, LoadCallback<List<Tweet>> paramLoadCallback)
  {
    super(paramContext);
    setTweetIds(paramList, paramLoadCallback);
  }

  public void setTweetIds(List<Long> paramList)
  {
    setTweetIds(paramList, null);
  }

  public void setTweetIds(List<Long> paramList, final LoadCallback<List<Tweet>> paramLoadCallback)
  {
    LoadCallback local1 = new LoadCallback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        if (paramLoadCallback != null)
          paramLoadCallback.failure(paramAnonymousTwitterException);
      }

      public void success(List<Tweet> paramAnonymousList)
      {
        TweetViewFetchAdapter.this.setTweets(paramAnonymousList);
        if (paramLoadCallback != null)
          paramLoadCallback.success(paramAnonymousList);
      }
    };
    TweetUi.getInstance().getTweetRepository().loadTweets(paramList, local1);
  }
}