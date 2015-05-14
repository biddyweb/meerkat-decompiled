package com.twitter.cobalt.metrics;

import android.content.SharedPreferences;

public abstract interface MetricListener
{
  public abstract void available(ManagedMetric paramManagedMetric);

  public abstract void discard(ManagedMetric paramManagedMetric);

  public abstract void persist(ManagedMetric paramManagedMetric);

  public abstract SharedPreferences restore();
}