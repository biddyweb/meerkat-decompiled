package com.twitter.sdk.android.tweetui;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.twitter.sdk.android.core.models.Tweet;
import java.util.ArrayList;
import java.util.List;

public class TweetViewAdapter<T extends BaseTweetView> extends BaseAdapter
{
  protected final Context context;
  protected List<Tweet> tweets;

  public TweetViewAdapter(Context paramContext)
  {
    this.context = paramContext;
    this.tweets = new ArrayList();
  }

  public TweetViewAdapter(Context paramContext, List<Tweet> paramList)
  {
    this.context = paramContext;
    this.tweets = paramList;
  }

  public int getCount()
  {
    if (this.tweets == null)
      return 0;
    return this.tweets.size();
  }

  public Tweet getItem(int paramInt)
  {
    return (Tweet)this.tweets.get(paramInt);
  }

  public long getItemId(int paramInt)
  {
    return paramInt;
  }

  public T getTweetView(Context paramContext, Tweet paramTweet)
  {
    return new CompactTweetView(paramContext, paramTweet);
  }

  public List<Tweet> getTweets()
  {
    return this.tweets;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Tweet localTweet = getItem(paramInt);
    if (paramView == null)
      return getTweetView(this.context, localTweet);
    ((BaseTweetView)paramView).setTweet(localTweet);
    return paramView;
  }

  public void setTweets(List<Tweet> paramList)
  {
    if (paramList == null);
    for (this.tweets = new ArrayList(); ; this.tweets = paramList)
    {
      notifyDataSetChanged();
      return;
    }
  }
}