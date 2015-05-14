package com.twitter.cobalt.metrics;

import android.text.TextUtils;
import android.util.Log;

public class ConsoleReporter
  implements MetricsReporter
{
  private static final int MAX_TAG_LENGTH = 23;

  protected String getLogString(Metric paramMetric)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Recorded metric ").append(paramMetric.getEventName()).append(" duration=").append(paramMetric.getDuration()).append(" ownerId=").append(paramMetric.getOwnerId());
    Long localLong = paramMetric.getEventValue();
    String str = paramMetric.getMetaData();
    if (localLong != null)
      localStringBuilder.append(" eventValue=").append(localLong);
    if (str != null)
      localStringBuilder.append(" metaData=").append(str);
    return localStringBuilder.toString();
  }

  public int hashCode()
  {
    return ConsoleReporter.class.getName().hashCode();
  }

  public void report(Metric paramMetric)
  {
    String str1 = paramMetric.getTag();
    String str2 = str1.substring(0, Math.min(str1.length(), 23));
    if (Log.isLoggable(str2, 3))
    {
      String str3 = getLogString(paramMetric);
      if (!TextUtils.isEmpty(str3))
        Log.d(str2, str3);
    }
  }
}