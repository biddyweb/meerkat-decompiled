package com.twitter.sdk.android.tweetui;

import android.os.Handler;
import android.support.v4.util.LruCache;
import android.text.TextUtils;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.services.StatusesService;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.util.List;
import java.util.concurrent.ExecutorService;

class TweetRepository extends Repository
{
  private static final String AUTH_ERROR = "Auth could not be obtained.";
  private static final int DEFAULT_CACHE_SIZE = 20;
  private static final String TAG = "TweetUi";
  final LruCache<Long, FormattedTweetText> formatCache = new LruCache(20);
  final LruCache<Long, Tweet> tweetCache = new LruCache(20);

  TweetRepository(TweetUi paramTweetUi, ExecutorService paramExecutorService, Handler paramHandler, AuthRequestQueue paramAuthRequestQueue)
  {
    super(paramTweetUi, paramExecutorService, paramHandler, paramAuthRequestQueue);
  }

  private void deliverTweet(final Tweet paramTweet, final LoadCallback<Tweet> paramLoadCallback)
  {
    if (paramLoadCallback == null)
      return;
    this.mainHandler.post(new Runnable()
    {
      public void run()
      {
        paramLoadCallback.success(paramTweet);
      }
    });
  }

  FormattedTweetText formatTweetText(Tweet paramTweet)
  {
    FormattedTweetText localFormattedTweetText1;
    if (paramTweet == null)
      localFormattedTweetText1 = null;
    do
    {
      return localFormattedTweetText1;
      localFormattedTweetText1 = (FormattedTweetText)this.formatCache.get(Long.valueOf(paramTweet.id));
    }
    while (localFormattedTweetText1 != null);
    FormattedTweetText localFormattedTweetText2 = TweetTextUtils.formatTweetText(paramTweet);
    if ((localFormattedTweetText2 != null) && (!TextUtils.isEmpty(localFormattedTweetText2.text)))
      this.formatCache.put(Long.valueOf(paramTweet.id), localFormattedTweetText2);
    return localFormattedTweetText2;
  }

  void loadTweet(final long paramLong, LoadCallback<Tweet> paramLoadCallback)
  {
    Tweet localTweet = (Tweet)this.tweetCache.get(Long.valueOf(paramLong));
    if (localTweet != null)
    {
      deliverTweet(localTweet, paramLoadCallback);
      return;
    }
    this.queue.addRequest(new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("TweetUi", "Auth could not be obtained.", paramAnonymousTwitterException);
        if (this.val$cb != null)
          this.val$cb.failure(paramAnonymousTwitterException);
      }

      public void success(Result<TwitterApiClient> paramAnonymousResult)
      {
        ((TwitterApiClient)paramAnonymousResult.data).getStatusesService().show(Long.valueOf(paramLong), null, null, null, new TweetRepository.TweetApiCallback(TweetRepository.this, this.val$cb));
      }
    });
  }

  void loadTweets(final List<Long> paramList, final LoadCallback<List<Tweet>> paramLoadCallback)
  {
    this.queue.addRequest(new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("TweetUi", "Auth could not be obtained.", paramAnonymousTwitterException);
        if (paramLoadCallback != null)
          paramLoadCallback.failure(paramAnonymousTwitterException);
      }

      public void success(Result<TwitterApiClient> paramAnonymousResult)
      {
        String str = TextUtils.join(",", paramList);
        ((TwitterApiClient)paramAnonymousResult.data).getStatusesService().lookup(str, null, null, null, new TweetRepository.TweetsApiCallback(TweetRepository.this, paramList, paramLoadCallback));
      }
    });
  }

  protected void updateCache(Tweet paramTweet)
  {
    this.tweetCache.put(Long.valueOf(paramTweet.id), paramTweet);
  }

  class TweetApiCallback extends ApiCallback<Tweet>
  {
    TweetApiCallback()
    {
      super();
    }

    public void success(Result<Tweet> paramResult)
    {
      Tweet localTweet = (Tweet)paramResult.data;
      TweetRepository.this.updateCache(localTweet);
      if (this.cb != null)
        this.cb.success(localTweet);
    }
  }

  class TweetsApiCallback extends ApiCallback<List<Tweet>>
  {
    List<Long> tweetIds;

    TweetsApiCallback(LoadCallback<List<Tweet>> arg2)
    {
      super();
      Object localObject;
      this.tweetIds = localObject;
    }

    public void success(Result<List<Tweet>> paramResult)
    {
      if (this.cb != null)
      {
        List localList = Utils.orderTweets(this.tweetIds, (List)paramResult.data);
        this.cb.success(localList);
      }
    }
  }
}