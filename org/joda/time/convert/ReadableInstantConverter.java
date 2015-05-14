package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadableInstant;
import org.joda.time.chrono.ISOChronology;

class ReadableInstantConverter extends AbstractConverter
  implements InstantConverter, PartialConverter
{
  static final ReadableInstantConverter INSTANCE = new ReadableInstantConverter();

  public Chronology getChronology(Object paramObject, Chronology paramChronology)
  {
    if (paramChronology == null)
      paramChronology = DateTimeUtils.getChronology(((ReadableInstant)paramObject).getChronology());
    return paramChronology;
  }

  public Chronology getChronology(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    Object localObject = ((ReadableInstant)paramObject).getChronology();
    if (localObject == null)
      localObject = ISOChronology.getInstance(paramDateTimeZone);
    do
    {
      do
        return localObject;
      while (((Chronology)localObject).getZone() == paramDateTimeZone);
      localObject = ((Chronology)localObject).withZone(paramDateTimeZone);
    }
    while (localObject != null);
    return ISOChronology.getInstance(paramDateTimeZone);
  }

  public long getInstantMillis(Object paramObject, Chronology paramChronology)
  {
    return ((ReadableInstant)paramObject).getMillis();
  }

  public Class<?> getSupportedType()
  {
    return ReadableInstant.class;
  }
}