package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadableDuration;

class ReadableDurationConverter extends AbstractConverter
  implements DurationConverter, PeriodConverter
{
  static final ReadableDurationConverter INSTANCE = new ReadableDurationConverter();

  public long getDurationMillis(Object paramObject)
  {
    return ((ReadableDuration)paramObject).getMillis();
  }

  public Class<?> getSupportedType()
  {
    return ReadableDuration.class;
  }

  public void setInto(ReadWritablePeriod paramReadWritablePeriod, Object paramObject, Chronology paramChronology)
  {
    ReadableDuration localReadableDuration = (ReadableDuration)paramObject;
    int[] arrayOfInt = DateTimeUtils.getChronology(paramChronology).get(paramReadWritablePeriod, localReadableDuration.getMillis());
    for (int i = 0; i < arrayOfInt.length; i++)
      paramReadWritablePeriod.setValue(i, arrayOfInt[i]);
  }
}