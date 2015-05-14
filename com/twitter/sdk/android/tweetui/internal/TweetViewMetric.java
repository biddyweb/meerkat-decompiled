package com.twitter.sdk.android.tweetui.internal;

import com.twitter.cobalt.metrics.Metric;
import com.twitter.cobalt.metrics.Metric.Level;
import com.twitter.cobalt.metrics.MetricsManager;
import com.twitter.cobalt.metrics.TimingMetric;
import io.fabric.sdk.android.services.common.CommonUtils;

public class TweetViewMetric
{
  static final Metric.Level METRIC_LEVEL = Metric.LEVEL_DEBUG;
  public static final String METRIC_TAG = "TweetTimingMetric";
  static final String RENDER_METRIC_NAME = "tweetview:render";
  private static final String TAG = "TweetViewMetric";
  MetricsManager metricsManager;
  TimingMetric renderMetric;

  public TweetViewMetric(MetricsManager paramMetricsManager)
  {
    if (paramMetricsManager == null)
      throw new IllegalArgumentException("MetricsManager may not be null");
    this.metricsManager = paramMetricsManager;
  }

  void destroyAll()
  {
    if (this.renderMetric != null)
      this.renderMetric.destroyMetric();
  }

  public void finishRender()
  {
    if (this.renderMetric == null)
    {
      CommonUtils.logOrThrowIllegalStateException("TweetViewMetric", "Must call start() before finishRender()");
      return;
    }
    this.renderMetric.stopMeasuring();
  }

  public void start()
  {
    this.renderMetric = new TimingMetric("tweetview:render", METRIC_LEVEL, "tweetview:render", this.metricsManager);
    this.renderMetric.setTag("TweetTimingMetric");
    this.renderMetric.startMeasuring();
  }
}