package com.twitter.cobalt.metrics;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.SystemClock;
import android.util.Log;

public abstract class ManagedMetric extends Metric
{
  private static final String DURATION = "duration";
  private static final String LAST_REPORT = "last_report";
  private static final String MEASURING = "measuring";
  private static final String READY = "ready";
  private static final String START_TIME = "starttime";
  private static final String TAG = "MetricsManager";
  protected final long mCreationTime;
  protected final String mId;
  protected boolean mIsDestroyed;
  private boolean mIsMeasuring;
  boolean mIsPersisted;
  boolean mIsReady;
  protected long mLastReport;
  private final MetricListener mListener;

  ManagedMetric(String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener)
  {
    this(paramString1, paramLevel, paramString2, paramMetricListener, false);
  }

  public ManagedMetric(String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener, boolean paramBoolean)
  {
    super(paramString1, paramLevel);
    this.mTag = getClass().getSimpleName();
    this.mId = paramString2;
    this.mCreationTime = SystemClock.elapsedRealtime();
    this.mListener = paramMetricListener;
    this.mIsPersisted = paramBoolean;
    this.mIsDestroyed = false;
    if ((paramBoolean) && (paramMetricListener != null))
      initFromPersistedData(paramMetricListener.restore());
  }

  protected static String generateDefaultId(String paramString1, String paramString2)
  {
    return paramString1 + paramString2;
  }

  protected void addPersistentMetric(SharedPreferences.Editor paramEditor)
  {
    paramEditor.putLong(getDataKey("starttime"), this.mStartTime);
    paramEditor.putBoolean(getDataKey("measuring"), this.mIsMeasuring);
    paramEditor.putLong(getDataKey("duration"), this.mDuration);
    paramEditor.putBoolean(getDataKey("ready"), this.mIsReady);
    paramEditor.putLong(getDataKey("last_report"), this.mLastReport);
  }

  public final void destroyMetric()
  {
    try
    {
      onDestroyMetric();
      discard();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected final void discard()
  {
    this.mIsDestroyed = true;
    if (this.mListener != null)
      this.mListener.discard(this);
  }

  protected String getDataKey(String paramString)
  {
    return this.mId + "_" + paramString;
  }

  protected void initFromPersistedData(SharedPreferences paramSharedPreferences)
  {
    this.mStartTime = paramSharedPreferences.getLong(getDataKey("starttime"), 0L);
    this.mIsMeasuring = paramSharedPreferences.getBoolean(getDataKey("measuring"), false);
    this.mDuration = paramSharedPreferences.getLong(getDataKey("duration"), 0L);
    this.mIsReady = paramSharedPreferences.getBoolean(getDataKey("ready"), false);
    this.mLastReport = paramSharedPreferences.getLong(getDataKey("last_report"), 0L);
  }

  public final boolean isDestroyed()
  {
    return this.mIsDestroyed;
  }

  public final boolean isMeasuring()
  {
    return this.mIsMeasuring;
  }

  protected final boolean isReady()
  {
    return this.mIsReady;
  }

  protected final void makeAvailable()
  {
    if (this.mListener != null)
    {
      this.mLastReport = System.currentTimeMillis();
      this.mListener.available(this);
    }
  }

  protected void onDestroyMetric()
  {
  }

  protected void onReset()
  {
  }

  protected void onStartMeasuring()
  {
  }

  protected void onStopMeasuring()
  {
  }

  protected final void persist()
  {
    if (this.mListener != null)
      this.mListener.persist(this);
  }

  protected void removePersistentMetric(SharedPreferences.Editor paramEditor)
  {
    paramEditor.remove(getDataKey("starttime"));
    paramEditor.remove(getDataKey("measuring"));
    paramEditor.remove(getDataKey("duration"));
    paramEditor.remove(getDataKey("ready"));
    paramEditor.remove(getDataKey("last_report"));
  }

  protected final void reset()
  {
    if (this.mIsMeasuring);
    for (this.mStartTime = System.currentTimeMillis(); ; this.mStartTime = 0L)
    {
      this.mDuration = 0L;
      this.mIsReady = false;
      onReset();
      return;
    }
  }

  protected final void setReady(boolean paramBoolean)
  {
    this.mIsReady = paramBoolean;
  }

  protected boolean shouldRestartOnStart()
  {
    return true;
  }

  public void startMeasuring()
  {
    try
    {
      if (this.mIsDestroyed)
        Log.e("MetricsManager", "attempting to start a metric which has already been destroyed");
      if (!this.mIsDestroyed)
      {
        if (!this.mIsMeasuring)
          break label43;
        boolean bool = shouldRestartOnStart();
        if (bool)
          break label43;
      }
      while (true)
      {
        return;
        label43: this.mIsMeasuring = true;
        this.mStartTime = System.currentTimeMillis();
        onStartMeasuring();
      }
    }
    finally
    {
    }
  }

  public final void stopMeasuring()
  {
    try
    {
      boolean bool = this.mIsMeasuring;
      if (!bool);
      while (true)
      {
        return;
        this.mDuration += System.currentTimeMillis() - this.mStartTime;
        onStopMeasuring();
        this.mIsMeasuring = false;
      }
    }
    finally
    {
    }
  }
}