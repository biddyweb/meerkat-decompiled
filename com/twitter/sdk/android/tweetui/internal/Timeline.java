package com.twitter.sdk.android.tweetui.internal;

import com.twitter.sdk.android.core.Callback;
import java.util.List;

public abstract interface Timeline<T>
{
  public abstract void newer(Integer paramInteger, Long paramLong, Callback<List<T>> paramCallback);

  public abstract void older(Integer paramInteger, Long paramLong, Callback<List<T>> paramCallback);
}