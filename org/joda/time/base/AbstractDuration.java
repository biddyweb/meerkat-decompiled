package org.joda.time.base;

import org.joda.convert.ToString;
import org.joda.time.Duration;
import org.joda.time.Period;
import org.joda.time.ReadableDuration;
import org.joda.time.format.FormatUtils;

public abstract class AbstractDuration
  implements ReadableDuration
{
  public int compareTo(ReadableDuration paramReadableDuration)
  {
    long l1 = getMillis();
    long l2 = paramReadableDuration.getMillis();
    if (l1 < l2)
      return -1;
    if (l1 > l2)
      return 1;
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ReadableDuration localReadableDuration;
    do
    {
      return true;
      if (!(paramObject instanceof ReadableDuration))
        return false;
      localReadableDuration = (ReadableDuration)paramObject;
    }
    while (getMillis() == localReadableDuration.getMillis());
    return false;
  }

  public int hashCode()
  {
    long l = getMillis();
    return (int)(l ^ l >>> 32);
  }

  public boolean isEqual(ReadableDuration paramReadableDuration)
  {
    if (paramReadableDuration == null)
      paramReadableDuration = Duration.ZERO;
    return compareTo(paramReadableDuration) == 0;
  }

  public boolean isLongerThan(ReadableDuration paramReadableDuration)
  {
    if (paramReadableDuration == null)
      paramReadableDuration = Duration.ZERO;
    return compareTo(paramReadableDuration) > 0;
  }

  public boolean isShorterThan(ReadableDuration paramReadableDuration)
  {
    if (paramReadableDuration == null)
      paramReadableDuration = Duration.ZERO;
    return compareTo(paramReadableDuration) < 0;
  }

  public Duration toDuration()
  {
    return new Duration(getMillis());
  }

  public Period toPeriod()
  {
    return new Period(getMillis());
  }

  @ToString
  public String toString()
  {
    long l = getMillis();
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append("PT");
    int i;
    label34: int k;
    if (l < 0L)
    {
      i = 1;
      FormatUtils.appendUnpaddedInteger(localStringBuffer, l);
      int j = localStringBuffer.length();
      if (i == 0)
        break label82;
      k = 7;
      label49: if (j >= k)
        break label95;
      if (i == 0)
        break label89;
    }
    label82: label89: for (int m = 3; ; m = 2)
    {
      localStringBuffer.insert(m, "0");
      break label34;
      i = 0;
      break;
      k = 6;
      break label49;
    }
    label95: if (1000L * (l / 1000L) == l)
      localStringBuffer.setLength(-3 + localStringBuffer.length());
    while (true)
    {
      localStringBuffer.append('S');
      return localStringBuffer.toString();
      localStringBuffer.insert(-3 + localStringBuffer.length(), ".");
    }
  }
}