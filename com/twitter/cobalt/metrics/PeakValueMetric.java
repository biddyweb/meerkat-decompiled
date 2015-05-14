package com.twitter.cobalt.metrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.annotation.NonNull;

public class PeakValueMetric extends PeriodicMetric
{
  private static final String PEAK_KEY = "peak";
  private static final String TAG = "PeakValueMetric";
  protected long mPeak;

  public PeakValueMetric(Context paramContext, String paramString1, Metric.Level paramLevel, String paramString2, MetricListener paramMetricListener, boolean paramBoolean, int paramInt)
  {
    super(paramContext, paramString1, paramLevel, paramString2, paramMetricListener, paramBoolean, paramInt);
  }

  public static PeakValueMetric getManaged(String paramString, Metric.Level paramLevel, @NonNull MetricsManager paramMetricsManager, boolean paramBoolean, int paramInt)
  {
    ManagedMetric localManagedMetric = paramMetricsManager.getMetric(generateDefaultId("PeakValueMetric", paramString));
    if (localManagedMetric == null)
      localManagedMetric = paramMetricsManager.trackMetric(new PeakValueMetric(paramMetricsManager.getContext(), paramString, paramLevel, generateDefaultId("PeakValueMetric", paramString), paramMetricsManager, paramBoolean, paramInt));
    return (PeakValueMetric)localManagedMetric;
  }

  protected void addPersistentMetric(SharedPreferences.Editor paramEditor)
  {
    try
    {
      super.addPersistentMetric(paramEditor);
      paramEditor.putLong(getDataKey("peak"), this.mPeak);
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
        if (paramLong > this.mPeak)
        {
          this.mPeak = paramLong;
          setReady(true);
          persist();
        }
      }
    }
    finally
    {
    }
  }

  public Long getEventValue()
  {
    try
    {
      Long localLong = Long.valueOf(this.mPeak);
      return localLong;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected void initFromPersistedData(SharedPreferences paramSharedPreferences)
  {
    this.mPeak = paramSharedPreferences.getLong(getDataKey("peak"), 0L);
    super.initFromPersistedData(paramSharedPreferences);
  }

  protected void onReset()
  {
    try
    {
      super.onReset();
      this.mPeak = 0L;
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
    paramEditor.remove(getDataKey("peak"));
  }
}