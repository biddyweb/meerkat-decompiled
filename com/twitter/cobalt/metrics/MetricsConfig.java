package com.twitter.cobalt.metrics;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public class MetricsConfig
{
  private static final long DAY_MILLIS = 86400000L;
  private static final int DEFAULT_REPORTING_INTERVAL_LONG = 86400000;
  private static final int DEFAULT_REPORTING_INTERVAL_REGULAR = 3600000;
  private static final int DEFAULT_REPORTING_INTERVAL_SHORT = 600000;
  private static final int DEFAULT_SAMPLING_RATE_DEBUG = 100;
  private static final int DEFAULT_SAMPLING_RATE_HIGH = 10000;
  private static final int DEFAULT_SAMPLING_RATE_LOW = 100;
  private static final long HOUR_MILLIS = 3600000L;
  private static final Object LOCK = new Object();
  private static final long MINUTE_MILLIS = 60000L;
  private static final long SECOND_MILLIS = 1000L;
  private static ArrayList<WeakReference<MetricConfigListener>> sListeners = new ArrayList();
  private static Values sValues = new Values(100, 100, 10000, 600000, 3600000, 86400000);

  public static void addListener(MetricConfigListener paramMetricConfigListener)
  {
    synchronized (sListeners)
    {
      sListeners.add(new WeakReference(paramMetricConfigListener));
      return;
    }
  }

  public static Values getValues()
  {
    synchronized (LOCK)
    {
      Values localValues = sValues;
      return localValues;
    }
  }

  public static void removeListener(MetricConfigListener paramMetricConfigListener)
  {
    synchronized (sListeners)
    {
      Iterator localIterator = sListeners.iterator();
      while (localIterator.hasNext())
      {
        MetricConfigListener localMetricConfigListener = (MetricConfigListener)((WeakReference)localIterator.next()).get();
        if ((localMetricConfigListener == paramMetricConfigListener) || (localMetricConfigListener == null))
          localIterator.remove();
      }
    }
  }

  public static void setValues(Values paramValues)
  {
    while (true)
    {
      MetricConfigListener localMetricConfigListener;
      synchronized (LOCK)
      {
        if (sValues.equals(paramValues))
          return;
        sValues = paramValues;
        synchronized (sListeners)
        {
          Iterator localIterator = sListeners.iterator();
          if (!localIterator.hasNext())
            break;
          localMetricConfigListener = (MetricConfigListener)((WeakReference)localIterator.next()).get();
          if (localMetricConfigListener == null)
            localIterator.remove();
        }
      }
      localMetricConfigListener.onConfigChanged();
    }
  }

  public static abstract interface MetricConfigListener
  {
    public abstract void onConfigChanged();
  }

  public static class Values
  {
    public final int intervalLong;
    public final int intervalRegular;
    public final int intervalShort;
    public final int samplingRateDebug;
    public final int samplingRateHigh;
    public final int samplingRateLow;

    public Values(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
    {
      this.samplingRateDebug = paramInt1;
      this.samplingRateLow = paramInt2;
      this.samplingRateHigh = paramInt3;
      this.intervalShort = paramInt4;
      this.intervalRegular = paramInt5;
      this.intervalLong = paramInt6;
    }

    public boolean equals(Object paramObject)
    {
      if ((paramObject == null) || (getClass() != paramObject.getClass()));
      Values localValues;
      do
      {
        return false;
        localValues = (Values)paramObject;
      }
      while ((this.samplingRateDebug != localValues.samplingRateDebug) || (this.samplingRateLow != localValues.samplingRateLow) || (this.samplingRateHigh != localValues.samplingRateHigh) || (this.intervalShort != localValues.intervalShort) || (this.intervalRegular != localValues.intervalRegular) || (this.intervalLong != localValues.intervalLong));
      return true;
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (31 * (31 * this.samplingRateDebug + this.samplingRateLow) + this.samplingRateHigh) + this.intervalShort) + this.intervalRegular) + this.intervalLong;
    }
  }
}