package com.twitter.cobalt.metrics;

import android.os.SystemClock;

public class Metric
{
  public static final Level LEVEL_DEBUG = new Level()
  {
    public int getSampleRate()
    {
      return MetricsConfig.getValues().samplingRateDebug;
    }
  };
  public static final Level LEVEL_PROD_HIGH = new Level()
  {
    public int getSampleRate()
    {
      return MetricsConfig.getValues().samplingRateHigh;
    }
  };
  public static final Level LEVEL_PROD_LOW = new Level()
  {
    public int getSampleRate()
    {
      return MetricsConfig.getValues().samplingRateLow;
    }
  };
  protected long mDuration;
  protected String mEventName;
  protected Level mLevel;
  protected long mOwnerId;
  protected long mStartTime;
  protected String mTag;

  public Metric(String paramString, Level paramLevel)
  {
    this(paramString, paramLevel, 0L);
  }

  public Metric(String paramString, Level paramLevel, long paramLong)
  {
    this.mEventName = paramString;
    this.mLevel = paramLevel;
    this.mDuration = paramLong;
    this.mStartTime = 0L;
  }

  public long getDuration()
  {
    return this.mDuration;
  }

  public String getEventName()
  {
    return this.mEventName;
  }

  public Long getEventValue()
  {
    return null;
  }

  public Level getLevel()
  {
    return this.mLevel;
  }

  public String getMetaData()
  {
    return null;
  }

  public long getOwnerId()
  {
    return this.mOwnerId;
  }

  public String getTag()
  {
    return this.mTag;
  }

  public void setLevel(Level paramLevel)
  {
    this.mLevel = paramLevel;
  }

  public void setOwnerId(long paramLong)
  {
    this.mOwnerId = paramLong;
  }

  public void setTag(String paramString)
  {
    this.mTag = paramString;
  }

  public void startMeasuring()
  {
    try
    {
      this.mStartTime = SystemClock.elapsedRealtime();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void stopMeasuring()
  {
    try
    {
      this.mDuration = (SystemClock.elapsedRealtime() - this.mStartTime);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static class CustomLevel
    implements Metric.Level
  {
    private final int mSampleRate;

    public CustomLevel(int paramInt)
    {
      this.mSampleRate = paramInt;
    }

    public int getSampleRate()
    {
      return this.mSampleRate;
    }
  }

  public static abstract interface Level
  {
    public abstract int getSampleRate();
  }
}