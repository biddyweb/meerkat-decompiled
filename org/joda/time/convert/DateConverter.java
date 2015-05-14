package org.joda.time.convert;

import java.util.Date;
import org.joda.time.Chronology;

final class DateConverter extends AbstractConverter
  implements InstantConverter, PartialConverter
{
  static final DateConverter INSTANCE = new DateConverter();

  public long getInstantMillis(Object paramObject, Chronology paramChronology)
  {
    return ((Date)paramObject).getTime();
  }

  public Class<?> getSupportedType()
  {
    return Date.class;
  }
}