package com.twitter.sdk.android.tweetui.internal;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.Search;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.services.SearchService;
import java.util.List;

public class SearchTimeline
  implements Timeline<Tweet>
{
  private final String query;
  private final SearchService searchService;

  public SearchTimeline(String paramString, SearchService paramSearchService)
  {
    this.query = paramString;
    this.searchService = paramSearchService;
  }

  private Callback<Search> getSearchCallback(final Callback<List<Tweet>> paramCallback)
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        if (paramCallback != null)
          paramCallback.failure(paramAnonymousTwitterException);
      }

      public void success(Result<Search> paramAnonymousResult)
      {
        List localList = ((Search)paramAnonymousResult.data).tweets;
        if (paramCallback != null)
          paramCallback.success(new Result(localList, paramAnonymousResult.response));
      }
    };
  }

  public void newer(Integer paramInteger, Long paramLong, Callback<List<Tweet>> paramCallback)
  {
    Callback localCallback = getSearchCallback(paramCallback);
    this.searchService.tweets(this.query, null, null, null, null, paramInteger, null, paramLong, null, Boolean.valueOf(true), localCallback);
  }

  public void older(Integer paramInteger, Long paramLong, Callback<List<Tweet>> paramCallback)
  {
    Callback localCallback = getSearchCallback(paramCallback);
    this.searchService.tweets(this.query, null, null, null, null, paramInteger, null, null, paramLong, Boolean.valueOf(true), localCallback);
  }
}