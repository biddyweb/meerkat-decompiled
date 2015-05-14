package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.ReadWritableInterval;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadableInterval;

class ReadableIntervalConverter extends AbstractConverter
  implements IntervalConverter, DurationConverter, PeriodConverter
{
  static final ReadableIntervalConverter INSTANCE = new ReadableIntervalConverter();

  public long getDurationMillis(Object paramObject)
  {
    return ((ReadableInterval)paramObject).toDurationMillis();
  }

  public Class<?> getSupportedType()
  {
    return ReadableInterval.class;
  }

  public boolean isReadableInterval(Object paramObject, Chronology paramChronology)
  {
    return true;
  }

  public void setInto(ReadWritableInterval paramReadWritableInterval, Object paramObject, Chronology paramChronology)
  {
    ReadableInterval localReadableInterval = (ReadableInterval)paramObject;
    paramReadWritableInterval.setInterval(localReadableInterval);
    if (paramChronology != null)
    {
      paramReadWritableInterval.setChronology(paramChronology);
      return;
    }
    paramReadWritableInterval.setChronology(localReadableInterval.getChronology());
  }

  public void setInto(ReadWritablePeriod paramReadWritablePeriod, Object paramObject, Chronology paramChronology)
  {
    ReadableInterval localReadableInterval = (ReadableInterval)paramObject;
    if (paramChronology != null);
    for (Chronology localChronology = paramChronology; ; localChronology = DateTimeUtils.getIntervalChronology(localReadableInterval))
    {
      int[] arrayOfInt = localChronology.get(paramReadWritablePeriod, localReadableInterval.getStartMillis(), localReadableInterval.getEndMillis());
      for (int i = 0; i < arrayOfInt.length; i++)
        paramReadWritablePeriod.setValue(i, arrayOfInt[i]);
    }
  }
}