package org.joda.time;

import java.io.Serializable;
import org.joda.convert.FromString;
import org.joda.time.base.BaseDateTime;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public final class DateTime extends BaseDateTime
  implements ReadableDateTime, Serializable
{
  private static final long serialVersionUID = -5171125899451703815L;

  public DateTime()
  {
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, 0, 0);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, 0);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Chronology paramChronology)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramChronology);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, DateTimeZone paramDateTimeZone)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramDateTimeZone);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Chronology paramChronology)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, 0, paramChronology);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, DateTimeZone paramDateTimeZone)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, 0, paramDateTimeZone);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, Chronology paramChronology)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, 0, 0, paramChronology);
  }

  public DateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, DateTimeZone paramDateTimeZone)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, 0, 0, paramDateTimeZone);
  }

  public DateTime(long paramLong)
  {
    super(paramLong);
  }

  public DateTime(long paramLong, Chronology paramChronology)
  {
    super(paramLong, paramChronology);
  }

  public DateTime(long paramLong, DateTimeZone paramDateTimeZone)
  {
    super(paramLong, paramDateTimeZone);
  }

  public DateTime(Object paramObject)
  {
    super(paramObject, (Chronology)null);
  }

  public DateTime(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, DateTimeUtils.getChronology(paramChronology));
  }

  public DateTime(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    super(paramObject, paramDateTimeZone);
  }

  public DateTime(Chronology paramChronology)
  {
    super(paramChronology);
  }

  public DateTime(DateTimeZone paramDateTimeZone)
  {
    super(paramDateTimeZone);
  }

  public static DateTime now()
  {
    return new DateTime();
  }

  public static DateTime now(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new NullPointerException("Chronology must not be null");
    return new DateTime(paramChronology);
  }

  public static DateTime now(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      throw new NullPointerException("Zone must not be null");
    return new DateTime(paramDateTimeZone);
  }

  @FromString
  public static DateTime parse(String paramString)
  {
    return parse(paramString, ISODateTimeFormat.dateTimeParser().withOffsetParsed());
  }

  public static DateTime parse(String paramString, DateTimeFormatter paramDateTimeFormatter)
  {
    return paramDateTimeFormatter.parseDateTime(paramString);
  }

  public DateTime.Property centuryOfEra()
  {
    return new DateTime.Property(this, getChronology().centuryOfEra());
  }

  public DateTime.Property dayOfMonth()
  {
    return new DateTime.Property(this, getChronology().dayOfMonth());
  }

  public DateTime.Property dayOfWeek()
  {
    return new DateTime.Property(this, getChronology().dayOfWeek());
  }

  public DateTime.Property dayOfYear()
  {
    return new DateTime.Property(this, getChronology().dayOfYear());
  }

  public DateTime.Property era()
  {
    return new DateTime.Property(this, getChronology().era());
  }

  public DateTime.Property hourOfDay()
  {
    return new DateTime.Property(this, getChronology().hourOfDay());
  }

  public DateTime.Property millisOfDay()
  {
    return new DateTime.Property(this, getChronology().millisOfDay());
  }

  public DateTime.Property millisOfSecond()
  {
    return new DateTime.Property(this, getChronology().millisOfSecond());
  }

  public DateTime minus(long paramLong)
  {
    return withDurationAdded(paramLong, -1);
  }

  public DateTime minus(ReadableDuration paramReadableDuration)
  {
    return withDurationAdded(paramReadableDuration, -1);
  }

  public DateTime minus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, -1);
  }

  public DateTime minusDays(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().days().subtract(getMillis(), paramInt));
  }

  public DateTime minusHours(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().hours().subtract(getMillis(), paramInt));
  }

  public DateTime minusMillis(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().millis().subtract(getMillis(), paramInt));
  }

  public DateTime minusMinutes(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().minutes().subtract(getMillis(), paramInt));
  }

  public DateTime minusMonths(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().months().subtract(getMillis(), paramInt));
  }

  public DateTime minusSeconds(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().seconds().subtract(getMillis(), paramInt));
  }

  public DateTime minusWeeks(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().weeks().subtract(getMillis(), paramInt));
  }

  public DateTime minusYears(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().years().subtract(getMillis(), paramInt));
  }

  public DateTime.Property minuteOfDay()
  {
    return new DateTime.Property(this, getChronology().minuteOfDay());
  }

  public DateTime.Property minuteOfHour()
  {
    return new DateTime.Property(this, getChronology().minuteOfHour());
  }

  public DateTime.Property monthOfYear()
  {
    return new DateTime.Property(this, getChronology().monthOfYear());
  }

  public DateTime plus(long paramLong)
  {
    return withDurationAdded(paramLong, 1);
  }

  public DateTime plus(ReadableDuration paramReadableDuration)
  {
    return withDurationAdded(paramReadableDuration, 1);
  }

  public DateTime plus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, 1);
  }

  public DateTime plusDays(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().days().add(getMillis(), paramInt));
  }

  public DateTime plusHours(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().hours().add(getMillis(), paramInt));
  }

  public DateTime plusMillis(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().millis().add(getMillis(), paramInt));
  }

  public DateTime plusMinutes(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().minutes().add(getMillis(), paramInt));
  }

  public DateTime plusMonths(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().months().add(getMillis(), paramInt));
  }

  public DateTime plusSeconds(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().seconds().add(getMillis(), paramInt));
  }

  public DateTime plusWeeks(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().weeks().add(getMillis(), paramInt));
  }

  public DateTime plusYears(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().years().add(getMillis(), paramInt));
  }

  public DateTime.Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The DateTimeFieldType must not be null");
    DateTimeField localDateTimeField = paramDateTimeFieldType.getField(getChronology());
    if (!localDateTimeField.isSupported())
      throw new IllegalArgumentException("Field '" + paramDateTimeFieldType + "' is not supported");
    return new DateTime.Property(this, localDateTimeField);
  }

  public DateTime.Property secondOfDay()
  {
    return new DateTime.Property(this, getChronology().secondOfDay());
  }

  public DateTime.Property secondOfMinute()
  {
    return new DateTime.Property(this, getChronology().secondOfMinute());
  }

  @Deprecated
  public DateMidnight toDateMidnight()
  {
    return new DateMidnight(getMillis(), getChronology());
  }

  public DateTime toDateTime()
  {
    return this;
  }

  public DateTime toDateTime(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    if (getChronology() == localChronology)
      return this;
    return super.toDateTime(localChronology);
  }

  public DateTime toDateTime(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone = DateTimeUtils.getZone(paramDateTimeZone);
    if (getZone() == localDateTimeZone)
      return this;
    return super.toDateTime(localDateTimeZone);
  }

  public DateTime toDateTimeISO()
  {
    if (getChronology() == ISOChronology.getInstance())
      return this;
    return super.toDateTimeISO();
  }

  public LocalDate toLocalDate()
  {
    return new LocalDate(getMillis(), getChronology());
  }

  public LocalDateTime toLocalDateTime()
  {
    return new LocalDateTime(getMillis(), getChronology());
  }

  public LocalTime toLocalTime()
  {
    return new LocalTime(getMillis(), getChronology());
  }

  @Deprecated
  public TimeOfDay toTimeOfDay()
  {
    return new TimeOfDay(getMillis(), getChronology());
  }

  @Deprecated
  public YearMonthDay toYearMonthDay()
  {
    return new YearMonthDay(getMillis(), getChronology());
  }

  public DateTime.Property weekOfWeekyear()
  {
    return new DateTime.Property(this, getChronology().weekOfWeekyear());
  }

  public DateTime.Property weekyear()
  {
    return new DateTime.Property(this, getChronology().weekyear());
  }

  public DateTime withCenturyOfEra(int paramInt)
  {
    return withMillis(getChronology().centuryOfEra().set(getMillis(), paramInt));
  }

  public DateTime withChronology(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    if (localChronology == getChronology())
      return this;
    return new DateTime(getMillis(), localChronology);
  }

  public DateTime withDate(int paramInt1, int paramInt2, int paramInt3)
  {
    Chronology localChronology = getChronology();
    long l1 = getMillis();
    long l2 = localChronology.year().set(l1, paramInt1);
    long l3 = localChronology.monthOfYear().set(l2, paramInt2);
    return withMillis(localChronology.dayOfMonth().set(l3, paramInt3));
  }

  public DateTime withDate(LocalDate paramLocalDate)
  {
    return withDate(paramLocalDate.getYear(), paramLocalDate.getMonthOfYear(), paramLocalDate.getDayOfMonth());
  }

  public DateTime withDayOfMonth(int paramInt)
  {
    return withMillis(getChronology().dayOfMonth().set(getMillis(), paramInt));
  }

  public DateTime withDayOfWeek(int paramInt)
  {
    return withMillis(getChronology().dayOfWeek().set(getMillis(), paramInt));
  }

  public DateTime withDayOfYear(int paramInt)
  {
    return withMillis(getChronology().dayOfYear().set(getMillis(), paramInt));
  }

  public DateTime withDurationAdded(long paramLong, int paramInt)
  {
    if ((paramLong == 0L) || (paramInt == 0))
      return this;
    return withMillis(getChronology().add(getMillis(), paramLong, paramInt));
  }

  public DateTime withDurationAdded(ReadableDuration paramReadableDuration, int paramInt)
  {
    if ((paramReadableDuration == null) || (paramInt == 0))
      return this;
    return withDurationAdded(paramReadableDuration.getMillis(), paramInt);
  }

  public DateTime withEarlierOffsetAtOverlap()
  {
    return withMillis(getZone().adjustOffset(getMillis(), false));
  }

  public DateTime withEra(int paramInt)
  {
    return withMillis(getChronology().era().set(getMillis(), paramInt));
  }

  public DateTime withField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    return withMillis(paramDateTimeFieldType.getField(getChronology()).set(getMillis(), paramInt));
  }

  public DateTime withFieldAdded(DurationFieldType paramDurationFieldType, int paramInt)
  {
    if (paramDurationFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    if (paramInt == 0)
      return this;
    return withMillis(paramDurationFieldType.getField(getChronology()).add(getMillis(), paramInt));
  }

  public DateTime withFields(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      return this;
    return withMillis(getChronology().set(paramReadablePartial, getMillis()));
  }

  public DateTime withHourOfDay(int paramInt)
  {
    return withMillis(getChronology().hourOfDay().set(getMillis(), paramInt));
  }

  public DateTime withLaterOffsetAtOverlap()
  {
    return withMillis(getZone().adjustOffset(getMillis(), true));
  }

  public DateTime withMillis(long paramLong)
  {
    if (paramLong == getMillis())
      return this;
    return new DateTime(paramLong, getChronology());
  }

  public DateTime withMillisOfDay(int paramInt)
  {
    return withMillis(getChronology().millisOfDay().set(getMillis(), paramInt));
  }

  public DateTime withMillisOfSecond(int paramInt)
  {
    return withMillis(getChronology().millisOfSecond().set(getMillis(), paramInt));
  }

  public DateTime withMinuteOfHour(int paramInt)
  {
    return withMillis(getChronology().minuteOfHour().set(getMillis(), paramInt));
  }

  public DateTime withMonthOfYear(int paramInt)
  {
    return withMillis(getChronology().monthOfYear().set(getMillis(), paramInt));
  }

  public DateTime withPeriodAdded(ReadablePeriod paramReadablePeriod, int paramInt)
  {
    if ((paramReadablePeriod == null) || (paramInt == 0))
      return this;
    return withMillis(getChronology().add(paramReadablePeriod, getMillis(), paramInt));
  }

  public DateTime withSecondOfMinute(int paramInt)
  {
    return withMillis(getChronology().secondOfMinute().set(getMillis(), paramInt));
  }

  public DateTime withTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    Chronology localChronology = getChronology();
    long l1 = getMillis();
    long l2 = localChronology.hourOfDay().set(l1, paramInt1);
    long l3 = localChronology.minuteOfHour().set(l2, paramInt2);
    long l4 = localChronology.secondOfMinute().set(l3, paramInt3);
    return withMillis(localChronology.millisOfSecond().set(l4, paramInt4));
  }

  public DateTime withTime(LocalTime paramLocalTime)
  {
    return withTime(paramLocalTime.getHourOfDay(), paramLocalTime.getMinuteOfHour(), paramLocalTime.getSecondOfMinute(), paramLocalTime.getMillisOfSecond());
  }

  public DateTime withTimeAtStartOfDay()
  {
    return toLocalDate().toDateTimeAtStartOfDay(getZone());
  }

  public DateTime withWeekOfWeekyear(int paramInt)
  {
    return withMillis(getChronology().weekOfWeekyear().set(getMillis(), paramInt));
  }

  public DateTime withWeekyear(int paramInt)
  {
    return withMillis(getChronology().weekyear().set(getMillis(), paramInt));
  }

  public DateTime withYear(int paramInt)
  {
    return withMillis(getChronology().year().set(getMillis(), paramInt));
  }

  public DateTime withYearOfCentury(int paramInt)
  {
    return withMillis(getChronology().yearOfCentury().set(getMillis(), paramInt));
  }

  public DateTime withYearOfEra(int paramInt)
  {
    return withMillis(getChronology().yearOfEra().set(getMillis(), paramInt));
  }

  public DateTime withZone(DateTimeZone paramDateTimeZone)
  {
    return withChronology(getChronology().withZone(paramDateTimeZone));
  }

  public DateTime withZoneRetainFields(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone1 = DateTimeUtils.getZone(paramDateTimeZone);
    DateTimeZone localDateTimeZone2 = DateTimeUtils.getZone(getZone());
    if (localDateTimeZone1 == localDateTimeZone2)
      return this;
    return new DateTime(localDateTimeZone2.getMillisKeepLocal(localDateTimeZone1, getMillis()), getChronology().withZone(localDateTimeZone1));
  }

  public DateTime.Property year()
  {
    return new DateTime.Property(this, getChronology().year());
  }

  public DateTime.Property yearOfCentury()
  {
    return new DateTime.Property(this, getChronology().yearOfCentury());
  }

  public DateTime.Property yearOfEra()
  {
    return new DateTime.Property(this, getChronology().yearOfEra());
  }
}