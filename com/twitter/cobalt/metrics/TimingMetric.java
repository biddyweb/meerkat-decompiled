package com.twitter.cobalt.metrics;

import android.os.SystemClock;

public class TimingMetric extends ManagedMetric
{
  private static final String TAG = "TimingMetric";

  public TimingMetric(String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener)
  {
    super(paramString1, paramLevel, paramString2, paramMetricListener);
  }

  public static TimingMetric getManaged(String paramString, MetricsManager paramMetricsManager, long paramLong, Metric.Level paramLevel)
  {
    return getManaged(paramString, paramMetricsManager, paramLong, paramLevel, generateDefaultId("TimingMetric", paramString));
  }

  public static TimingMetric getManaged(String paramString1, MetricsManager paramMetricsManager, long paramLong, Metric.Level paramLevel, String paramString2)
  {
    ManagedMetric localManagedMetric = paramMetricsManager.getMetric(paramString2);
    if (localManagedMetric == null)
    {
      localManagedMetric = paramMetricsManager.trackMetric(new TimingMetric(paramString1, paramLevel, paramString2, paramMetricsManager));
      localManagedMetric.setOwnerId(paramLong);
    }
    return (TimingMetric)localManagedMetric;
  }

  public static TimingMetric getManaged(String paramString, MetricsManager paramMetricsManager, Metric.Level paramLevel)
  {
    return getManaged(paramString, paramMetricsManager, 0L, paramLevel, generateDefaultId("TimingMetric", paramString));
  }

  protected void onReset()
  {
    discard();
  }

  protected void onStartMeasuring()
  {
    this.mStartTime = SystemClock.elapsedRealtime();
    setReady(false);
  }

  protected void onStopMeasuring()
  {
    this.mDuration = (SystemClock.elapsedRealtime() - this.mStartTime);
    setReady(true);
    makeAvailable();
    discard();
  }
}