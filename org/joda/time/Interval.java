package org.joda.time;

import java.io.Serializable;
import org.joda.time.base.BaseInterval;
import org.joda.time.chrono.ISOChronology;

public final class Interval extends BaseInterval
  implements ReadableInterval, Serializable
{
  private static final long serialVersionUID = 4922451897541386752L;

  public Interval(long paramLong1, long paramLong2)
  {
    super(paramLong1, paramLong2, null);
  }

  public Interval(long paramLong1, long paramLong2, Chronology paramChronology)
  {
    super(paramLong1, paramLong2, paramChronology);
  }

  public Interval(long paramLong1, long paramLong2, DateTimeZone paramDateTimeZone)
  {
    super(paramLong1, paramLong2, ISOChronology.getInstance(paramDateTimeZone));
  }

  public Interval(Object paramObject)
  {
    super(paramObject, null);
  }

  public Interval(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, paramChronology);
  }

  public Interval(ReadableDuration paramReadableDuration, ReadableInstant paramReadableInstant)
  {
    super(paramReadableDuration, paramReadableInstant);
  }

  public Interval(ReadableInstant paramReadableInstant, ReadableDuration paramReadableDuration)
  {
    super(paramReadableInstant, paramReadableDuration);
  }

  public Interval(ReadableInstant paramReadableInstant1, ReadableInstant paramReadableInstant2)
  {
    super(paramReadableInstant1, paramReadableInstant2);
  }

  public Interval(ReadableInstant paramReadableInstant, ReadablePeriod paramReadablePeriod)
  {
    super(paramReadableInstant, paramReadablePeriod);
  }

  public Interval(ReadablePeriod paramReadablePeriod, ReadableInstant paramReadableInstant)
  {
    super(paramReadablePeriod, paramReadableInstant);
  }

  public static Interval parse(String paramString)
  {
    return new Interval(paramString);
  }

  public boolean abuts(ReadableInterval paramReadableInterval)
  {
    boolean bool2;
    if (paramReadableInterval == null)
    {
      long l = DateTimeUtils.currentTimeMillis();
      if (getStartMillis() != l)
      {
        boolean bool3 = getEndMillis() < l;
        bool2 = false;
        if (bool3);
      }
      else
      {
        bool2 = true;
      }
    }
    boolean bool1;
    do
    {
      return bool2;
      if (paramReadableInterval.getEndMillis() == getStartMillis())
        break;
      bool1 = getEndMillis() < paramReadableInterval.getStartMillis();
      bool2 = false;
    }
    while (bool1);
    return true;
  }

  public Interval gap(ReadableInterval paramReadableInterval)
  {
    ReadableInterval localReadableInterval = DateTimeUtils.getReadableInterval(paramReadableInterval);
    long l1 = localReadableInterval.getStartMillis();
    long l2 = localReadableInterval.getEndMillis();
    long l3 = getStartMillis();
    long l4 = getEndMillis();
    if (l3 > l2)
      return new Interval(l2, l3, getChronology());
    if (l1 > l4)
      return new Interval(l4, l1, getChronology());
    return null;
  }

  public Interval overlap(ReadableInterval paramReadableInterval)
  {
    ReadableInterval localReadableInterval = DateTimeUtils.getReadableInterval(paramReadableInterval);
    if (!overlaps(localReadableInterval))
      return null;
    return new Interval(Math.max(getStartMillis(), localReadableInterval.getStartMillis()), Math.min(getEndMillis(), localReadableInterval.getEndMillis()), getChronology());
  }

  public Interval toInterval()
  {
    return this;
  }

  public Interval withChronology(Chronology paramChronology)
  {
    if (getChronology() == paramChronology)
      return this;
    return new Interval(getStartMillis(), getEndMillis(), paramChronology);
  }

  public Interval withDurationAfterStart(ReadableDuration paramReadableDuration)
  {
    long l1 = DateTimeUtils.getDurationMillis(paramReadableDuration);
    if (l1 == toDurationMillis())
      return this;
    Chronology localChronology = getChronology();
    long l2 = getStartMillis();
    return new Interval(l2, localChronology.add(l2, l1, 1), localChronology);
  }

  public Interval withDurationBeforeEnd(ReadableDuration paramReadableDuration)
  {
    long l1 = DateTimeUtils.getDurationMillis(paramReadableDuration);
    if (l1 == toDurationMillis())
      return this;
    Chronology localChronology = getChronology();
    long l2 = getEndMillis();
    return new Interval(localChronology.add(l2, l1, -1), l2, localChronology);
  }

  public Interval withEnd(ReadableInstant paramReadableInstant)
  {
    return withEndMillis(DateTimeUtils.getInstantMillis(paramReadableInstant));
  }

  public Interval withEndMillis(long paramLong)
  {
    if (paramLong == getEndMillis())
      return this;
    return new Interval(getStartMillis(), paramLong, getChronology());
  }

  public Interval withPeriodAfterStart(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod == null)
      return withDurationAfterStart(null);
    Chronology localChronology = getChronology();
    long l = getStartMillis();
    return new Interval(l, localChronology.add(paramReadablePeriod, l, 1), localChronology);
  }

  public Interval withPeriodBeforeEnd(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod == null)
      return withDurationBeforeEnd(null);
    Chronology localChronology = getChronology();
    long l = getEndMillis();
    return new Interval(localChronology.add(paramReadablePeriod, l, -1), l, localChronology);
  }

  public Interval withStart(ReadableInstant paramReadableInstant)
  {
    return withStartMillis(DateTimeUtils.getInstantMillis(paramReadableInstant));
  }

  public Interval withStartMillis(long paramLong)
  {
    if (paramLong == getStartMillis())
      return this;
    return new Interval(paramLong, getEndMillis(), getChronology());
  }
}