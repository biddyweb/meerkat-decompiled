package com.twitter.sdk.android.tweetui;

import android.os.Handler;
import java.util.concurrent.ExecutorService;

abstract class Repository
{
  protected final ExecutorService executorService;
  protected final Handler mainHandler;
  protected final AuthRequestQueue queue;
  protected final TweetUi tweetUiKit;

  public Repository(TweetUi paramTweetUi, ExecutorService paramExecutorService, Handler paramHandler, AuthRequestQueue paramAuthRequestQueue)
  {
    this.tweetUiKit = paramTweetUi;
    this.executorService = paramExecutorService;
    this.mainHandler = paramHandler;
    this.queue = paramAuthRequestQueue;
  }
}