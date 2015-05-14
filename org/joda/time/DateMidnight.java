package org.joda.time;

import java.io.Serializable;
import org.joda.convert.FromString;
import org.joda.time.base.BaseDateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

@Deprecated
public final class DateMidnight extends BaseDateTime
  implements ReadableDateTime, Serializable
{
  private static final long serialVersionUID = 156371964018738L;

  public DateMidnight()
  {
  }

  public DateMidnight(int paramInt1, int paramInt2, int paramInt3)
  {
    super(paramInt1, paramInt2, paramInt3, 0, 0, 0, 0);
  }

  public DateMidnight(int paramInt1, int paramInt2, int paramInt3, Chronology paramChronology)
  {
    super(paramInt1, paramInt2, paramInt3, 0, 0, 0, 0, paramChronology);
  }

  public DateMidnight(int paramInt1, int paramInt2, int paramInt3, DateTimeZone paramDateTimeZone)
  {
    super(paramInt1, paramInt2, paramInt3, 0, 0, 0, 0, paramDateTimeZone);
  }

  public DateMidnight(long paramLong)
  {
    super(paramLong);
  }

  public DateMidnight(long paramLong, Chronology paramChronology)
  {
    super(paramLong, paramChronology);
  }

  public DateMidnight(long paramLong, DateTimeZone paramDateTimeZone)
  {
    super(paramLong, paramDateTimeZone);
  }

  public DateMidnight(Object paramObject)
  {
    super(paramObject, (Chronology)null);
  }

  public DateMidnight(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, DateTimeUtils.getChronology(paramChronology));
  }

  public DateMidnight(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    super(paramObject, paramDateTimeZone);
  }

  public DateMidnight(Chronology paramChronology)
  {
    super(paramChronology);
  }

  public DateMidnight(DateTimeZone paramDateTimeZone)
  {
    super(paramDateTimeZone);
  }

  public static DateMidnight now()
  {
    return new DateMidnight();
  }

  public static DateMidnight now(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new NullPointerException("Chronology must not be null");
    return new DateMidnight(paramChronology);
  }

  public static DateMidnight now(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      throw new NullPointerException("Zone must not be null");
    return new DateMidnight(paramDateTimeZone);
  }

  @FromString
  public static DateMidnight parse(String paramString)
  {
    return parse(paramString, ISODateTimeFormat.dateTimeParser().withOffsetParsed());
  }

  public static DateMidnight parse(String paramString, DateTimeFormatter paramDateTimeFormatter)
  {
    return paramDateTimeFormatter.parseDateTime(paramString).toDateMidnight();
  }

  public DateMidnight.Property centuryOfEra()
  {
    return new DateMidnight.Property(this, getChronology().centuryOfEra());
  }

  protected long checkInstant(long paramLong, Chronology paramChronology)
  {
    return paramChronology.dayOfMonth().roundFloor(paramLong);
  }

  public DateMidnight.Property dayOfMonth()
  {
    return new DateMidnight.Property(this, getChronology().dayOfMonth());
  }

  public DateMidnight.Property dayOfWeek()
  {
    return new DateMidnight.Property(this, getChronology().dayOfWeek());
  }

  public DateMidnight.Property dayOfYear()
  {
    return new DateMidnight.Property(this, getChronology().dayOfYear());
  }

  public DateMidnight.Property era()
  {
    return new DateMidnight.Property(this, getChronology().era());
  }

  public DateMidnight minus(long paramLong)
  {
    return withDurationAdded(paramLong, -1);
  }

  public DateMidnight minus(ReadableDuration paramReadableDuration)
  {
    return withDurationAdded(paramReadableDuration, -1);
  }

  public DateMidnight minus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, -1);
  }

  public DateMidnight minusDays(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().days().subtract(getMillis(), paramInt));
  }

  public DateMidnight minusMonths(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().months().subtract(getMillis(), paramInt));
  }

  public DateMidnight minusWeeks(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().weeks().subtract(getMillis(), paramInt));
  }

  public DateMidnight minusYears(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().years().subtract(getMillis(), paramInt));
  }

  public DateMidnight.Property monthOfYear()
  {
    return new DateMidnight.Property(this, getChronology().monthOfYear());
  }

  public DateMidnight plus(long paramLong)
  {
    return withDurationAdded(paramLong, 1);
  }

  public DateMidnight plus(ReadableDuration paramReadableDuration)
  {
    return withDurationAdded(paramReadableDuration, 1);
  }

  public DateMidnight plus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, 1);
  }

  public DateMidnight plusDays(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().days().add(getMillis(), paramInt));
  }

  public DateMidnight plusMonths(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().months().add(getMillis(), paramInt));
  }

  public DateMidnight plusWeeks(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().weeks().add(getMillis(), paramInt));
  }

  public DateMidnight plusYears(int paramInt)
  {
    if (paramInt == 0)
      return this;
    return withMillis(getChronology().years().add(getMillis(), paramInt));
  }

  public DateMidnight.Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The DateTimeFieldType must not be null");
    DateTimeField localDateTimeField = paramDateTimeFieldType.getField(getChronology());
    if (!localDateTimeField.isSupported())
      throw new IllegalArgumentException("Field '" + paramDateTimeFieldType + "' is not supported");
    return new DateMidnight.Property(this, localDateTimeField);
  }

  public Interval toInterval()
  {
    Chronology localChronology = getChronology();
    long l = getMillis();
    return new Interval(l, DurationFieldType.days().getField(localChronology).add(l, 1), localChronology);
  }

  public LocalDate toLocalDate()
  {
    return new LocalDate(getMillis(), getChronology());
  }

  @Deprecated
  public YearMonthDay toYearMonthDay()
  {
    return new YearMonthDay(getMillis(), getChronology());
  }

  public DateMidnight.Property weekOfWeekyear()
  {
    return new DateMidnight.Property(this, getChronology().weekOfWeekyear());
  }

  public DateMidnight.Property weekyear()
  {
    return new DateMidnight.Property(this, getChronology().weekyear());
  }

  public DateMidnight withCenturyOfEra(int paramInt)
  {
    return withMillis(getChronology().centuryOfEra().set(getMillis(), paramInt));
  }

  public DateMidnight withChronology(Chronology paramChronology)
  {
    if (paramChronology == getChronology())
      return this;
    return new DateMidnight(getMillis(), paramChronology);
  }

  public DateMidnight withDayOfMonth(int paramInt)
  {
    return withMillis(getChronology().dayOfMonth().set(getMillis(), paramInt));
  }

  public DateMidnight withDayOfWeek(int paramInt)
  {
    return withMillis(getChronology().dayOfWeek().set(getMillis(), paramInt));
  }

  public DateMidnight withDayOfYear(int paramInt)
  {
    return withMillis(getChronology().dayOfYear().set(getMillis(), paramInt));
  }

  public DateMidnight withDurationAdded(long paramLong, int paramInt)
  {
    if ((paramLong == 0L) || (paramInt == 0))
      return this;
    return withMillis(getChronology().add(getMillis(), paramLong, paramInt));
  }

  public DateMidnight withDurationAdded(ReadableDuration paramReadableDuration, int paramInt)
  {
    if ((paramReadableDuration == null) || (paramInt == 0))
      return this;
    return withDurationAdded(paramReadableDuration.getMillis(), paramInt);
  }

  public DateMidnight withEra(int paramInt)
  {
    return withMillis(getChronology().era().set(getMillis(), paramInt));
  }

  public DateMidnight withField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    return withMillis(paramDateTimeFieldType.getField(getChronology()).set(getMillis(), paramInt));
  }

  public DateMidnight withFieldAdded(DurationFieldType paramDurationFieldType, int paramInt)
  {
    if (paramDurationFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    if (paramInt == 0)
      return this;
    return withMillis(paramDurationFieldType.getField(getChronology()).add(getMillis(), paramInt));
  }

  public DateMidnight withFields(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      return this;
    return withMillis(getChronology().set(paramReadablePartial, getMillis()));
  }

  public DateMidnight withMillis(long paramLong)
  {
    Chronology localChronology = getChronology();
    long l = checkInstant(paramLong, localChronology);
    if (l == getMillis())
      return this;
    return new DateMidnight(l, localChronology);
  }

  public DateMidnight withMonthOfYear(int paramInt)
  {
    return withMillis(getChronology().monthOfYear().set(getMillis(), paramInt));
  }

  public DateMidnight withPeriodAdded(ReadablePeriod paramReadablePeriod, int paramInt)
  {
    if ((paramReadablePeriod == null) || (paramInt == 0))
      return this;
    return withMillis(getChronology().add(paramReadablePeriod, getMillis(), paramInt));
  }

  public DateMidnight withWeekOfWeekyear(int paramInt)
  {
    return withMillis(getChronology().weekOfWeekyear().set(getMillis(), paramInt));
  }

  public DateMidnight withWeekyear(int paramInt)
  {
    return withMillis(getChronology().weekyear().set(getMillis(), paramInt));
  }

  public DateMidnight withYear(int paramInt)
  {
    return withMillis(getChronology().year().set(getMillis(), paramInt));
  }

  public DateMidnight withYearOfCentury(int paramInt)
  {
    return withMillis(getChronology().yearOfCentury().set(getMillis(), paramInt));
  }

  public DateMidnight withYearOfEra(int paramInt)
  {
    return withMillis(getChronology().yearOfEra().set(getMillis(), paramInt));
  }

  public DateMidnight withZoneRetainFields(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone1 = DateTimeUtils.getZone(paramDateTimeZone);
    DateTimeZone localDateTimeZone2 = DateTimeUtils.getZone(getZone());
    if (localDateTimeZone1 == localDateTimeZone2)
      return this;
    return new DateMidnight(localDateTimeZone2.getMillisKeepLocal(localDateTimeZone1, getMillis()), getChronology().withZone(localDateTimeZone1));
  }

  public DateMidnight.Property year()
  {
    return new DateMidnight.Property(this, getChronology().year());
  }

  public DateMidnight.Property yearOfCentury()
  {
    return new DateMidnight.Property(this, getChronology().yearOfCentury());
  }

  public DateMidnight.Property yearOfEra()
  {
    return new DateMidnight.Property(this, getChronology().yearOfEra());
  }
}