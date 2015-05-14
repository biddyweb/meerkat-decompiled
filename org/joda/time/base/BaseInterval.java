package org.joda.time.base;

import java.io.Serializable;
import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.MutableInterval;
import org.joda.time.ReadWritableInterval;
import org.joda.time.ReadableDuration;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadableInterval;
import org.joda.time.ReadablePeriod;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.convert.ConverterManager;
import org.joda.time.convert.IntervalConverter;
import org.joda.time.field.FieldUtils;

public abstract class BaseInterval extends AbstractInterval
  implements ReadableInterval, Serializable
{
  private static final long serialVersionUID = 576586928732749278L;
  private volatile Chronology iChronology;
  private volatile long iEndMillis;
  private volatile long iStartMillis;

  protected BaseInterval(long paramLong1, long paramLong2, Chronology paramChronology)
  {
    this.iChronology = DateTimeUtils.getChronology(paramChronology);
    checkInterval(paramLong1, paramLong2);
    this.iStartMillis = paramLong1;
    this.iEndMillis = paramLong2;
  }

  protected BaseInterval(Object paramObject, Chronology paramChronology)
  {
    IntervalConverter localIntervalConverter = ConverterManager.getInstance().getIntervalConverter(paramObject);
    ReadableInterval localReadableInterval;
    if (localIntervalConverter.isReadableInterval(paramObject, paramChronology))
    {
      localReadableInterval = (Serializable)paramObject;
      if (paramChronology != null)
      {
        this.iChronology = paramChronology;
        this.iStartMillis = localReadableInterval.getStartMillis();
        this.iEndMillis = localReadableInterval.getEndMillis();
      }
    }
    while (true)
    {
      checkInterval(this.iStartMillis, this.iEndMillis);
      return;
      paramChronology = localReadableInterval.getChronology();
      break;
      if ((this instanceof ReadWritableInterval))
      {
        localIntervalConverter.setInto((ReadWritableInterval)this, paramObject, paramChronology);
      }
      else
      {
        MutableInterval localMutableInterval = new MutableInterval();
        localIntervalConverter.setInto(localMutableInterval, paramObject, paramChronology);
        this.iChronology = localMutableInterval.getChronology();
        this.iStartMillis = localMutableInterval.getStartMillis();
        this.iEndMillis = localMutableInterval.getEndMillis();
      }
    }
  }

  protected BaseInterval(ReadableDuration paramReadableDuration, ReadableInstant paramReadableInstant)
  {
    this.iChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iEndMillis = DateTimeUtils.getInstantMillis(paramReadableInstant);
    long l = DateTimeUtils.getDurationMillis(paramReadableDuration);
    this.iStartMillis = FieldUtils.safeAdd(this.iEndMillis, -l);
    checkInterval(this.iStartMillis, this.iEndMillis);
  }

  protected BaseInterval(ReadableInstant paramReadableInstant, ReadableDuration paramReadableDuration)
  {
    this.iChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iStartMillis = DateTimeUtils.getInstantMillis(paramReadableInstant);
    long l = DateTimeUtils.getDurationMillis(paramReadableDuration);
    this.iEndMillis = FieldUtils.safeAdd(this.iStartMillis, l);
    checkInterval(this.iStartMillis, this.iEndMillis);
  }

  protected BaseInterval(ReadableInstant paramReadableInstant1, ReadableInstant paramReadableInstant2)
  {
    if ((paramReadableInstant1 == null) && (paramReadableInstant2 == null))
    {
      long l = DateTimeUtils.currentTimeMillis();
      this.iEndMillis = l;
      this.iStartMillis = l;
      this.iChronology = ISOChronology.getInstance();
      return;
    }
    this.iChronology = DateTimeUtils.getInstantChronology(paramReadableInstant1);
    this.iStartMillis = DateTimeUtils.getInstantMillis(paramReadableInstant1);
    this.iEndMillis = DateTimeUtils.getInstantMillis(paramReadableInstant2);
    checkInterval(this.iStartMillis, this.iEndMillis);
  }

  protected BaseInterval(ReadableInstant paramReadableInstant, ReadablePeriod paramReadablePeriod)
  {
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iChronology = localChronology;
    this.iStartMillis = DateTimeUtils.getInstantMillis(paramReadableInstant);
    if (paramReadablePeriod == null);
    for (this.iEndMillis = this.iStartMillis; ; this.iEndMillis = localChronology.add(paramReadablePeriod, this.iStartMillis, 1))
    {
      checkInterval(this.iStartMillis, this.iEndMillis);
      return;
    }
  }

  protected BaseInterval(ReadablePeriod paramReadablePeriod, ReadableInstant paramReadableInstant)
  {
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iChronology = localChronology;
    this.iEndMillis = DateTimeUtils.getInstantMillis(paramReadableInstant);
    if (paramReadablePeriod == null);
    for (this.iStartMillis = this.iEndMillis; ; this.iStartMillis = localChronology.add(paramReadablePeriod, this.iEndMillis, -1))
    {
      checkInterval(this.iStartMillis, this.iEndMillis);
      return;
    }
  }

  public Chronology getChronology()
  {
    return this.iChronology;
  }

  public long getEndMillis()
  {
    return this.iEndMillis;
  }

  public long getStartMillis()
  {
    return this.iStartMillis;
  }

  protected void setInterval(long paramLong1, long paramLong2, Chronology paramChronology)
  {
    checkInterval(paramLong1, paramLong2);
    this.iStartMillis = paramLong1;
    this.iEndMillis = paramLong2;
    this.iChronology = DateTimeUtils.getChronology(paramChronology);
  }
}