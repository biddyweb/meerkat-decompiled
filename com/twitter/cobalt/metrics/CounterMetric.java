package com.twitter.cobalt.metrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.util.concurrent.atomic.AtomicLong;

public class CounterMetric extends PeriodicMetric
{
  private static final String TAG = "CounterMetric";
  private static final String USAGE_KEY = "usage";
  private AtomicLong mCounter;

  public CounterMetric(Context paramContext, String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener, int paramInt)
  {
    super(paramContext, paramString1, paramLevel, paramString2, paramMetricListener, true, paramInt);
    if (this.mCounter == null)
      this.mCounter = new AtomicLong(0L);
  }

  private void add(long paramLong)
  {
    if (!isMeasuring())
      return;
    this.mCounter.addAndGet(paramLong);
    persist();
  }

  public static CounterMetric getManaged(String paramString, MetricsManager paramMetricsManager, long paramLong, Metric.Level paramLevel, int paramInt)
  {
    return getManaged(paramString, paramMetricsManager, paramLong, paramLevel, paramInt, generateDefaultId("CounterMetric", paramString));
  }

  public static CounterMetric getManaged(String paramString1, MetricsManager paramMetricsManager, long paramLong, Metric.Level paramLevel, int paramInt, String paramString2)
  {
    ManagedMetric localManagedMetric = paramMetricsManager.getMetric(paramString2);
    if (localManagedMetric == null)
    {
      localManagedMetric = paramMetricsManager.trackMetric(new CounterMetric(paramMetricsManager.getContext(), paramString1, paramLevel, paramString2, paramMetricsManager, paramInt));
      localManagedMetric.setOwnerId(paramLong);
    }
    return (CounterMetric)localManagedMetric;
  }

  protected void addPersistentMetric(SharedPreferences.Editor paramEditor)
  {
    super.addPersistentMetric(paramEditor);
    paramEditor.putLong(getDataKey("usage"), this.mCounter.get());
  }

  public void decrement()
  {
    add(-1L);
  }

  public void decrementBy(long paramLong)
  {
    add(-paramLong);
  }

  public Long getEventValue()
  {
    return Long.valueOf(this.mCounter.get());
  }

  public void increment()
  {
    add(1L);
  }

  public void incrementBy(long paramLong)
  {
    add(paramLong);
  }

  protected void initFromPersistedData(SharedPreferences paramSharedPreferences)
  {
    if (this.mCounter == null)
      this.mCounter = new AtomicLong(paramSharedPreferences.getLong(getDataKey("usage"), 0L));
    while (true)
    {
      super.initFromPersistedData(paramSharedPreferences);
      return;
      this.mCounter.set(paramSharedPreferences.getLong(getDataKey("usage"), 0L));
    }
  }

  protected void onReset()
  {
    this.mCounter.set(0L);
    if (isMeasuring())
      setReady(true);
    persist();
  }

  public void onStartMeasuring()
  {
    setReady(true);
  }

  protected void removePersistentMetric(SharedPreferences.Editor paramEditor)
  {
    super.removePersistentMetric(paramEditor);
    paramEditor.remove(getDataKey("usage"));
  }
}