package com.twitter.sdk.android.core;

import java.util.Iterator;
import java.util.List;
import retrofit.client.Header;

class TwitterRateLimit
{
  private static final String LIMIT_KEY = "x-rate-limit-limit";
  private static final String REMAINING_KEY = "x-rate-limit-remaining";
  private static final String RESET_KEY = "x-rate-limit-reset";
  private int limit;
  private int remainingRequest;
  private long reset;
  private final long timeStamp;

  TwitterRateLimit(List<Header> paramList)
  {
    if (paramList == null)
      throw new IllegalArgumentException("headers must not be null");
    this.timeStamp = System.currentTimeMillis();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      Header localHeader = (Header)localIterator.next();
      if ("x-rate-limit-limit".equals(localHeader.getName()))
        this.limit = Integer.valueOf(localHeader.getValue()).intValue();
      else if ("x-rate-limit-remaining".equals(localHeader.getName()))
        this.remainingRequest = Integer.valueOf(localHeader.getValue()).intValue();
      else if ("x-rate-limit-reset".equals(localHeader.getName()))
        this.reset = Long.valueOf(localHeader.getValue()).longValue();
    }
  }

  public int getLimit()
  {
    return this.limit;
  }

  public int getRemaining()
  {
    return this.remainingRequest;
  }

  public long getRemainingTime()
  {
    if (this.reset > this.timeStamp)
      return 0L;
    return this.reset - this.timeStamp;
  }

  public long getRequestedTime()
  {
    return this.timeStamp;
  }

  public long getReset()
  {
    return this.reset;
  }
}