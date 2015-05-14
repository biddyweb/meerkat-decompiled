package org.joda.time.convert;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;
import org.joda.time.chrono.BuddhistChronology;
import org.joda.time.chrono.GJChronology;
import org.joda.time.chrono.GregorianChronology;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.chrono.JulianChronology;

final class CalendarConverter extends AbstractConverter
  implements InstantConverter, PartialConverter
{
  static final CalendarConverter INSTANCE = new CalendarConverter();

  public Chronology getChronology(Object paramObject, Chronology paramChronology)
  {
    if (paramChronology != null)
      return paramChronology;
    Calendar localCalendar = (Calendar)paramObject;
    try
    {
      DateTimeZone localDateTimeZone2 = DateTimeZone.forTimeZone(localCalendar.getTimeZone());
      localDateTimeZone1 = localDateTimeZone2;
      return getChronology(localCalendar, localDateTimeZone1);
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      while (true)
        DateTimeZone localDateTimeZone1 = DateTimeZone.getDefault();
    }
  }

  public Chronology getChronology(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    if (paramObject.getClass().getName().endsWith(".BuddhistCalendar"))
      return BuddhistChronology.getInstance(paramDateTimeZone);
    if ((paramObject instanceof GregorianCalendar))
    {
      long l = ((GregorianCalendar)paramObject).getGregorianChange().getTime();
      if (l == -9223372036854775808L)
        return GregorianChronology.getInstance(paramDateTimeZone);
      if (l == 9223372036854775807L)
        return JulianChronology.getInstance(paramDateTimeZone);
      return GJChronology.getInstance(paramDateTimeZone, l, 4);
    }
    return ISOChronology.getInstance(paramDateTimeZone);
  }

  public long getInstantMillis(Object paramObject, Chronology paramChronology)
  {
    return ((Calendar)paramObject).getTime().getTime();
  }

  public Class<?> getSupportedType()
  {
    return Calendar.class;
  }
}