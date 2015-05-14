package org.joda.time;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import org.joda.convert.FromString;
import org.joda.convert.ToString;
import org.joda.time.base.BasePartial;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public final class YearMonth extends BasePartial
  implements ReadablePartial, Serializable
{
  private static final DateTimeFieldType[] FIELD_TYPES = arrayOfDateTimeFieldType;
  public static final int MONTH_OF_YEAR = 1;
  public static final int YEAR = 0;
  private static final long serialVersionUID = 797544782896179L;

  static
  {
    DateTimeFieldType[] arrayOfDateTimeFieldType = new DateTimeFieldType[2];
    arrayOfDateTimeFieldType[0] = DateTimeFieldType.year();
    arrayOfDateTimeFieldType[1] = DateTimeFieldType.monthOfYear();
  }

  public YearMonth()
  {
  }

  public YearMonth(int paramInt1, int paramInt2)
  {
    this(paramInt1, paramInt2, null);
  }

  public YearMonth(int paramInt1, int paramInt2, Chronology paramChronology)
  {
    super(new int[] { paramInt1, paramInt2 }, paramChronology);
  }

  public YearMonth(long paramLong)
  {
    super(paramLong);
  }

  public YearMonth(long paramLong, Chronology paramChronology)
  {
    super(paramLong, paramChronology);
  }

  public YearMonth(Object paramObject)
  {
    super(paramObject, null, ISODateTimeFormat.localDateParser());
  }

  public YearMonth(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, DateTimeUtils.getChronology(paramChronology), ISODateTimeFormat.localDateParser());
  }

  public YearMonth(Chronology paramChronology)
  {
    super(paramChronology);
  }

  public YearMonth(DateTimeZone paramDateTimeZone)
  {
    super(ISOChronology.getInstance(paramDateTimeZone));
  }

  YearMonth(YearMonth paramYearMonth, Chronology paramChronology)
  {
    super(paramYearMonth, paramChronology);
  }

  YearMonth(YearMonth paramYearMonth, int[] paramArrayOfInt)
  {
    super(paramYearMonth, paramArrayOfInt);
  }

  public static YearMonth fromCalendarFields(Calendar paramCalendar)
  {
    if (paramCalendar == null)
      throw new IllegalArgumentException("The calendar must not be null");
    return new YearMonth(paramCalendar.get(1), 1 + paramCalendar.get(2));
  }

  public static YearMonth fromDateFields(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("The date must not be null");
    return new YearMonth(1900 + paramDate.getYear(), 1 + paramDate.getMonth());
  }

  public static YearMonth now()
  {
    return new YearMonth();
  }

  public static YearMonth now(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new NullPointerException("Chronology must not be null");
    return new YearMonth(paramChronology);
  }

  public static YearMonth now(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      throw new NullPointerException("Zone must not be null");
    return new YearMonth(paramDateTimeZone);
  }

  @FromString
  public static YearMonth parse(String paramString)
  {
    return parse(paramString, ISODateTimeFormat.localDateParser());
  }

  public static YearMonth parse(String paramString, DateTimeFormatter paramDateTimeFormatter)
  {
    LocalDate localLocalDate = paramDateTimeFormatter.parseLocalDate(paramString);
    return new YearMonth(localLocalDate.getYear(), localLocalDate.getMonthOfYear());
  }

  private Object readResolve()
  {
    if (!DateTimeZone.UTC.equals(getChronology().getZone()))
      this = new YearMonth(this, getChronology().withUTC());
    return this;
  }

  protected DateTimeField getField(int paramInt, Chronology paramChronology)
  {
    switch (paramInt)
    {
    default:
      throw new IndexOutOfBoundsException("Invalid index: " + paramInt);
    case 0:
      return paramChronology.year();
    case 1:
    }
    return paramChronology.monthOfYear();
  }

  public DateTimeFieldType getFieldType(int paramInt)
  {
    return FIELD_TYPES[paramInt];
  }

  public DateTimeFieldType[] getFieldTypes()
  {
    return (DateTimeFieldType[])FIELD_TYPES.clone();
  }

  public int getMonthOfYear()
  {
    return getValue(1);
  }

  public int getYear()
  {
    return getValue(0);
  }

  public YearMonth minus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, -1);
  }

  public YearMonth minusMonths(int paramInt)
  {
    return withFieldAdded(DurationFieldType.months(), FieldUtils.safeNegate(paramInt));
  }

  public YearMonth minusYears(int paramInt)
  {
    return withFieldAdded(DurationFieldType.years(), FieldUtils.safeNegate(paramInt));
  }

  public YearMonth.Property monthOfYear()
  {
    return new YearMonth.Property(this, 1);
  }

  public YearMonth plus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, 1);
  }

  public YearMonth plusMonths(int paramInt)
  {
    return withFieldAdded(DurationFieldType.months(), paramInt);
  }

  public YearMonth plusYears(int paramInt)
  {
    return withFieldAdded(DurationFieldType.years(), paramInt);
  }

  public YearMonth.Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    return new YearMonth.Property(this, indexOfSupported(paramDateTimeFieldType));
  }

  public int size()
  {
    return 2;
  }

  public Interval toInterval()
  {
    return toInterval(null);
  }

  public Interval toInterval(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone = DateTimeUtils.getZone(paramDateTimeZone);
    return new Interval(toLocalDate(1).toDateTimeAtStartOfDay(localDateTimeZone), plusMonths(1).toLocalDate(1).toDateTimeAtStartOfDay(localDateTimeZone));
  }

  public LocalDate toLocalDate(int paramInt)
  {
    return new LocalDate(getYear(), getMonthOfYear(), paramInt, getChronology());
  }

  @ToString
  public String toString()
  {
    return ISODateTimeFormat.yearMonth().print(this);
  }

  public String toString(String paramString)
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).print(this);
  }

  public String toString(String paramString, Locale paramLocale)
    throws IllegalArgumentException
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).withLocale(paramLocale).print(this);
  }

  public YearMonth withChronologyRetainFields(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    if (localChronology == getChronology())
      return this;
    YearMonth localYearMonth = new YearMonth(this, localChronology);
    localChronology.validate(localYearMonth, getValues());
    return localYearMonth;
  }

  public YearMonth withField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDateTimeFieldType);
    if (paramInt == getValue(i))
      return this;
    int[] arrayOfInt = getValues();
    return new YearMonth(this, getField(i).set(this, i, arrayOfInt, paramInt));
  }

  public YearMonth withFieldAdded(DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDurationFieldType);
    if (paramInt == 0)
      return this;
    int[] arrayOfInt = getValues();
    return new YearMonth(this, getField(i).add(this, i, arrayOfInt, paramInt));
  }

  public YearMonth withMonthOfYear(int paramInt)
  {
    int[] arrayOfInt = getValues();
    return new YearMonth(this, getChronology().monthOfYear().set(this, 1, arrayOfInt, paramInt));
  }

  public YearMonth withPeriodAdded(ReadablePeriod paramReadablePeriod, int paramInt)
  {
    if ((paramReadablePeriod == null) || (paramInt == 0))
      return this;
    int[] arrayOfInt = getValues();
    for (int i = 0; i < paramReadablePeriod.size(); i++)
    {
      int j = indexOf(paramReadablePeriod.getFieldType(i));
      if (j >= 0)
        arrayOfInt = getField(j).add(this, j, arrayOfInt, FieldUtils.safeMultiply(paramReadablePeriod.getValue(i), paramInt));
    }
    return new YearMonth(this, arrayOfInt);
  }

  public YearMonth withYear(int paramInt)
  {
    int[] arrayOfInt = getValues();
    return new YearMonth(this, getChronology().year().set(this, 0, arrayOfInt, paramInt));
  }

  public YearMonth.Property year()
  {
    return new YearMonth.Property(this, 0);
  }
}