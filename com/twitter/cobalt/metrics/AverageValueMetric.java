package com.twitter.cobalt.metrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.annotation.NonNull;

public class AverageValueMetric extends PeriodicMetric
{
  private static final String COUNT_KEY = "count";
  private static final String TAG = "AverageValueMetric";
  private static final String TOTAL_KEY = "total";
  protected int mCount;
  protected long mTotal;

  public AverageValueMetric(Context paramContext, String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener, boolean paramBoolean, int paramInt)
  {
    super(paramContext, paramString1, paramLevel, paramString2, paramMetricListener, paramBoolean, paramInt);
  }

  public static AverageValueMetric getManaged(String paramString, Metric.Level paramLevel, @NonNull MetricsManager paramMetricsManager, boolean paramBoolean, int paramInt)
  {
    ManagedMetric localManagedMetric = paramMetricsManager.getMetric(generateDefaultId("AverageValueMetric", paramString));
    if (localManagedMetric == null)
      localManagedMetric = paramMetricsManager.trackMetric(new AverageValueMetric(paramMetricsManager.getContext(), paramString, paramLevel, generateDefaultId("AverageValueMetric", paramString), paramMetricsManager, paramBoolean, paramInt));
    return (AverageValueMetric)localManagedMetric;
  }

  protected void addPersistentMetric(SharedPreferences.Editor paramEditor)
  {
    try
    {
      super.addPersistentMetric(paramEditor);
      paramEditor.putLong(getDataKey("total"), this.mTotal);
      paramEditor.putInt(getDataKey("count"), this.mCount);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void addValue(long paramLong)
  {
    try
    {
      boolean bool = isMeasuring();
      if (!bool);
      while (true)
      {
        return;
        this.mTotal = (paramLong + this.mTotal);
        this.mCount = (1 + this.mCount);
        setReady(true);
        persist();
      }
    }
    finally
    {
    }
  }

  public Long getEventValue()
  {
    if (this.mCount == 0)
      return Long.valueOf(0L);
    return Long.valueOf(this.mTotal / this.mCount);
  }

  protected void initFromPersistedData(SharedPreferences paramSharedPreferences)
  {
    this.mTotal = paramSharedPreferences.getLong(getDataKey("total"), 0L);
    this.mCount = paramSharedPreferences.getInt(getDataKey("count"), 0);
    super.initFromPersistedData(paramSharedPreferences);
  }

  protected void onReset()
  {
    try
    {
      super.onReset();
      this.mTotal = 0L;
      this.mCount = 0;
      persist();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected void removePersistentMetric(SharedPreferences.Editor paramEditor)
  {
    super.removePersistentMetric(paramEditor);
    paramEditor.remove(getDataKey("total"));
    paramEditor.remove(getDataKey("count"));
  }
}