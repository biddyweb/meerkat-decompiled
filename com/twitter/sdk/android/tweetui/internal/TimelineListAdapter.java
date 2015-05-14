package com.twitter.sdk.android.tweetui.internal;

import android.content.Context;
import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.tweetui.BaseTweetView;
import com.twitter.sdk.android.tweetui.CompactTweetView;

public class TimelineListAdapter<T extends Tweet> extends BaseAdapter
{
  private final Context context;
  private final TimelineDelegate<T> delegate;

  public TimelineListAdapter(Context paramContext, Timeline<T> paramTimeline)
  {
    this(paramContext, new TimelineDelegate(paramTimeline));
  }

  TimelineListAdapter(Context paramContext, TimelineDelegate<T> paramTimelineDelegate)
  {
    this.context = paramContext;
    this.delegate = paramTimelineDelegate;
    paramTimelineDelegate.init();
  }

  public int getCount()
  {
    return this.delegate.getCount();
  }

  public T getItem(int paramInt)
  {
    return this.delegate.getItem(paramInt);
  }

  public long getItemId(int paramInt)
  {
    return this.delegate.getItemId(paramInt);
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Tweet localTweet = getItem(paramInt);
    if (paramView == null)
      return new CompactTweetView(this.context, localTweet);
    ((BaseTweetView)paramView).setTweet(localTweet);
    return paramView;
  }

  public void notifyDataSetChanged()
  {
    this.delegate.notifyDataSetChanged();
  }

  public void notifyDataSetInvalidated()
  {
    this.delegate.notifyDataSetInvalidated();
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.delegate.registerDataSetObserver(paramDataSetObserver);
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.delegate.unregisterDataSetObserver(paramDataSetObserver);
  }
}