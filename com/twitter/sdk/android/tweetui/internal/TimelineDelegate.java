package com.twitter.sdk.android.tweetui.internal;

import android.database.DataSetObservable;
import android.database.DataSetObserver;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.Tweet;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

class TimelineDelegate<T extends Tweet>
{
  static final int CHUNK_SIZE = 40;
  static final long MAX_ITEMS = 200L;
  private static final String TAG = "TimelineDelegate";
  final LinkedList<T> itemList;
  private DataSetObservable listAdapterObservable;
  private Timeline<T> timeline;

  public TimelineDelegate(Timeline<T> paramTimeline)
  {
    this(paramTimeline, null, null);
  }

  TimelineDelegate(Timeline<T> paramTimeline, DataSetObservable paramDataSetObservable, LinkedList<T> paramLinkedList)
  {
    if (paramTimeline == null)
      throw new IllegalArgumentException("Timeline must not be null");
    this.timeline = paramTimeline;
    this.listAdapterObservable = paramDataSetObservable;
    if (this.listAdapterObservable == null)
      this.listAdapterObservable = new DataSetObservable();
    if (paramLinkedList == null)
    {
      this.itemList = new LinkedList();
      return;
    }
    this.itemList = paramLinkedList;
  }

  private void loadOlder(Long paramLong)
  {
    this.timeline.older(Integer.valueOf(40), paramLong, new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
      }

      public void success(Result<List<T>> paramAnonymousResult)
      {
        TimelineDelegate.this.itemList.addAll((Collection)paramAnonymousResult.data);
        TimelineDelegate.this.notifyDataSetChanged();
      }
    });
  }

  public int getCount()
  {
    return this.itemList.size();
  }

  public T getItem(int paramInt)
  {
    if (shouldLoadOlder(paramInt))
      loadOlder(Long.valueOf(getItemId(paramInt)));
    return (Tweet)this.itemList.get(paramInt);
  }

  public long getItemId(int paramInt)
  {
    return ((Tweet)this.itemList.get(paramInt)).id;
  }

  public void init()
  {
    loadOlder(null);
  }

  public void notifyDataSetChanged()
  {
    this.listAdapterObservable.notifyChanged();
  }

  public void notifyDataSetInvalidated()
  {
    this.listAdapterObservable.notifyInvalidated();
  }

  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.listAdapterObservable.registerObserver(paramDataSetObserver);
  }

  boolean shouldLoadOlder(int paramInt)
  {
    return (paramInt >= -1 + this.itemList.size()) && (this.itemList.size() < 160L);
  }

  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    this.listAdapterObservable.unregisterObserver(paramDataSetObserver);
  }
}