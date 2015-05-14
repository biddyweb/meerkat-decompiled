package com.twitter.cobalt.metrics;

import android.content.Context;
import android.os.Handler;

public abstract class PeriodicMetric extends ManagedMetric
  implements MetricsConfig.MetricConfigListener
{
  public static final int LONG_INTERVAL = 3;
  private static final int MAX_NUMBER_OF_INACTIVE_INTERVALS = 7;
  public static final int REGULAR_INTERVAL = 2;
  public static final int SHORT_INTERVAL = 1;
  private Handler mHandler;
  private Runnable mReportRunnable = new Runnable()
  {
    public void run()
    {
      if (PeriodicMetric.this.isReady())
        PeriodicMetric.this.makeAvailable();
      PeriodicMetric.this.mHandler.postDelayed(this, PeriodicMetric.this.getReportInterval());
    }
  };
  private int mReportingInterval;

  public PeriodicMetric(Context paramContext, String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener, boolean paramBoolean, int paramInt)
  {
    super(paramString1, paramLevel, paramString2, paramMetricListener, paramBoolean);
    this.mHandler = new Handler(paramContext.getMainLooper());
    this.mReportingInterval = paramInt;
    if ((this.mReportingInterval < 1) || (this.mReportingInterval > 3))
      throw new IllegalStateException("Invalid reporting interval, please see PeriodicMetric for valid intervals.");
    MetricsConfig.addListener(this);
    restartReporting();
  }

  protected void cancelReporting()
  {
    this.mHandler.removeCallbacks(this.mReportRunnable);
  }

  public long getDuration()
  {
    if (!isMeasuring())
      return this.mDuration;
    return this.mDuration + System.currentTimeMillis() - this.mStartTime;
  }

  protected int getReportInterval()
  {
    switch (this.mReportingInterval)
    {
    default:
      return MetricsConfig.getValues().intervalLong;
    case 1:
      return MetricsConfig.getValues().intervalShort;
    case 2:
    }
    return MetricsConfig.getValues().intervalRegular;
  }

  public void onConfigChanged()
  {
    restartReporting();
  }

  protected void onDestroyMetric()
  {
    super.onDestroyMetric();
    cancelReporting();
  }

  protected void restartReporting()
  {
    cancelReporting();
    if (this.mIsDestroyed)
      return;
    long l1 = getReportInterval();
    long l2 = System.currentTimeMillis();
    if (this.mLastReport == 0L);
    long l4;
    for (long l3 = l2; ; l3 = this.mLastReport)
    {
      l4 = l3 + l1;
      if ((this.mLastReport <= l2) && (l2 - l4 < 7L * l1))
        break;
      this.mLastReport = 0L;
      reset();
      scheduleReporting(l1);
      return;
    }
    if (l4 > l2);
    for (long l5 = l4 - l2; ; l5 = l1 - (l2 - l4) % l1)
    {
      this.mStartTime = (l2 - (l1 - l5));
      scheduleReporting(l5);
      return;
      boolean bool = isMeasuring();
      if (bool)
        stopMeasuring();
      this.mDuration = l1;
      makeAvailable();
      if (bool)
        startMeasuring();
    }
  }

  protected void scheduleReporting(long paramLong)
  {
    this.mHandler.postDelayed(this.mReportRunnable, paramLong);
  }

  protected boolean shouldRestartOnStart()
  {
    return false;
  }
}