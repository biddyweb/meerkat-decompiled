package com.twitter.cobalt.metrics;

public abstract interface MetricsReporter
{
  public abstract void report(Metric paramMetric);
}