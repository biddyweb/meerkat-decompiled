package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.AppSession;
import com.twitter.sdk.android.core.AuthToken;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.tweetui.internal.ActiveSessionProvider;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;

class AuthRequestQueue
{
  private final ActiveSessionProvider activeSessionProvider;
  final AtomicBoolean awaitingSession;
  final Queue<Callback<TwitterApiClient>> queue;
  private final TwitterCore twitterCore;

  AuthRequestQueue(TwitterCore paramTwitterCore, ActiveSessionProvider paramActiveSessionProvider)
  {
    this.twitterCore = paramTwitterCore;
    this.activeSessionProvider = paramActiveSessionProvider;
    this.queue = new ConcurrentLinkedQueue();
    this.awaitingSession = new AtomicBoolean(true);
  }

  protected boolean addRequest(Callback<TwitterApiClient> paramCallback)
  {
    boolean bool = true;
    if (paramCallback == null)
      bool = false;
    while (true)
    {
      return bool;
      try
      {
        if (this.awaitingSession.get())
          break label90;
        Session localSession = getValidSession();
        if (localSession != null)
        {
          paramCallback.success(new Result(this.twitterCore.getApiClient(localSession), null));
          continue;
        }
      }
      finally
      {
      }
      this.queue.add(paramCallback);
      this.awaitingSession.set(true);
      requestAuth();
      continue;
      label90: this.queue.add(paramCallback);
    }
  }

  void flushQueueOnError(TwitterException paramTwitterException)
  {
    try
    {
      this.awaitingSession.set(false);
      while (!this.queue.isEmpty())
        ((Callback)this.queue.poll()).failure(paramTwitterException);
    }
    finally
    {
    }
  }

  void flushQueueOnSuccess(TwitterApiClient paramTwitterApiClient)
  {
    try
    {
      this.awaitingSession.set(false);
      while (!this.queue.isEmpty())
        ((Callback)this.queue.poll()).success(new Result(paramTwitterApiClient, null));
    }
    finally
    {
    }
  }

  Callback<AppSession> getAppAuthTokenCallback()
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        AuthRequestQueue.this.flushQueueOnError(paramAnonymousTwitterException);
      }

      public void success(Result<AppSession> paramAnonymousResult)
      {
        AuthRequestQueue.this.flushQueueOnSuccess(AuthRequestQueue.this.twitterCore.getApiClient((Session)paramAnonymousResult.data));
      }
    };
  }

  Session getValidSession()
  {
    Session localSession = this.activeSessionProvider.getActiveSession();
    if ((localSession != null) && (localSession.getAuthToken() != null) && (!localSession.getAuthToken().isExpired()))
      return localSession;
    return null;
  }

  void requestAuth()
  {
    this.twitterCore.logInGuest(getAppAuthTokenCallback());
  }

  void sessionRestored(Session paramSession)
  {
    if (paramSession != null);
    while (true)
    {
      try
      {
        flushQueueOnSuccess(this.twitterCore.getApiClient(paramSession));
        return;
        if (this.queue.size() > 0)
        {
          requestAuth();
          continue;
        }
      }
      finally
      {
      }
      this.awaitingSession.set(false);
    }
  }
}