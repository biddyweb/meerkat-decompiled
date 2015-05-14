package org.joda.time;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.joda.convert.FromString;
import org.joda.convert.ToString;
import org.joda.time.base.BasePartial;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormatterBuilder;
import org.joda.time.format.ISODateTimeFormat;

public final class MonthDay extends BasePartial
  implements ReadablePartial, Serializable
{
  public static final int DAY_OF_MONTH = 1;
  private static final DateTimeFieldType[] FIELD_TYPES = arrayOfDateTimeFieldType;
  public static final int MONTH_OF_YEAR = 0;
  private static final DateTimeFormatter PARSER = new DateTimeFormatterBuilder().appendOptional(ISODateTimeFormat.localDateParser().getParser()).appendOptional(DateTimeFormat.forPattern("--MM-dd").getParser()).toFormatter();
  private static final long serialVersionUID = 2954560699050434609L;

  static
  {
    DateTimeFieldType[] arrayOfDateTimeFieldType = new DateTimeFieldType[2];
    arrayOfDateTimeFieldType[0] = DateTimeFieldType.monthOfYear();
    arrayOfDateTimeFieldType[1] = DateTimeFieldType.dayOfMonth();
  }

  public MonthDay()
  {
  }

  public MonthDay(int paramInt1, int paramInt2)
  {
    this(paramInt1, paramInt2, null);
  }

  public MonthDay(int paramInt1, int paramInt2, Chronology paramChronology)
  {
    super(new int[] { paramInt1, paramInt2 }, paramChronology);
  }

  public MonthDay(long paramLong)
  {
    super(paramLong);
  }

  public MonthDay(long paramLong, Chronology paramChronology)
  {
    super(paramLong, paramChronology);
  }

  public MonthDay(Object paramObject)
  {
    super(paramObject, null, ISODateTimeFormat.localDateParser());
  }

  public MonthDay(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, DateTimeUtils.getChronology(paramChronology), ISODateTimeFormat.localDateParser());
  }

  public MonthDay(Chronology paramChronology)
  {
    super(paramChronology);
  }

  public MonthDay(DateTimeZone paramDateTimeZone)
  {
    super(ISOChronology.getInstance(paramDateTimeZone));
  }

  MonthDay(MonthDay paramMonthDay, Chronology paramChronology)
  {
    super(paramMonthDay, paramChronology);
  }

  MonthDay(MonthDay paramMonthDay, int[] paramArrayOfInt)
  {
    super(paramMonthDay, paramArrayOfInt);
  }

  public static MonthDay fromCalendarFields(Calendar paramCalendar)
  {
    if (paramCalendar == null)
      throw new IllegalArgumentException("The calendar must not be null");
    return new MonthDay(1 + paramCalendar.get(2), paramCalendar.get(5));
  }

  public static MonthDay fromDateFields(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("The date must not be null");
    return new MonthDay(1 + paramDate.getMonth(), paramDate.getDate());
  }

  public static MonthDay now()
  {
    return new MonthDay();
  }

  public static MonthDay now(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new NullPointerException("Chronology must not be null");
    return new MonthDay(paramChronology);
  }

  public static MonthDay now(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      throw new NullPointerException("Zone must not be null");
    return new MonthDay(paramDateTimeZone);
  }

  @FromString
  public static MonthDay parse(String paramString)
  {
    return parse(paramString, PARSER);
  }

  public static MonthDay parse(String paramString, DateTimeFormatter paramDateTimeFormatter)
  {
    LocalDate localLocalDate = paramDateTimeFormatter.parseLocalDate(paramString);
    return new MonthDay(localLocalDate.getMonthOfYear(), localLocalDate.getDayOfMonth());
  }

  private Object readResolve()
  {
    if (!DateTimeZone.UTC.equals(getChronology().getZone()))
      this = new MonthDay(this, getChronology().withUTC());
    return this;
  }

  public MonthDay.Property dayOfMonth()
  {
    return new MonthDay.Property(this, 1);
  }

  public int getDayOfMonth()
  {
    return getValue(1);
  }

  protected DateTimeField getField(int paramInt, Chronology paramChronology)
  {
    switch (paramInt)
    {
    default:
      throw new IndexOutOfBoundsException("Invalid index: " + paramInt);
    case 0:
      return paramChronology.monthOfYear();
    case 1:
    }
    return paramChronology.dayOfMonth();
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
    return getValue(0);
  }

  public MonthDay minus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, -1);
  }

  public MonthDay minusDays(int paramInt)
  {
    return withFieldAdded(DurationFieldType.days(), FieldUtils.safeNegate(paramInt));
  }

  public MonthDay minusMonths(int paramInt)
  {
    return withFieldAdded(DurationFieldType.months(), FieldUtils.safeNegate(paramInt));
  }

  public MonthDay.Property monthOfYear()
  {
    return new MonthDay.Property(this, 0);
  }

  public MonthDay plus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, 1);
  }

  public MonthDay plusDays(int paramInt)
  {
    return withFieldAdded(DurationFieldType.days(), paramInt);
  }

  public MonthDay plusMonths(int paramInt)
  {
    return withFieldAdded(DurationFieldType.months(), paramInt);
  }

  public MonthDay.Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    return new MonthDay.Property(this, indexOfSupported(paramDateTimeFieldType));
  }

  public int size()
  {
    return 2;
  }

  public LocalDate toLocalDate(int paramInt)
  {
    return new LocalDate(paramInt, getMonthOfYear(), getDayOfMonth(), getChronology());
  }

  @ToString
  public String toString()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(DateTimeFieldType.monthOfYear());
    localArrayList.add(DateTimeFieldType.dayOfMonth());
    return ISODateTimeFormat.forFields(localArrayList, true, true).print(this);
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

  public MonthDay withChronologyRetainFields(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    if (localChronology == getChronology())
      return this;
    MonthDay localMonthDay = new MonthDay(this, localChronology);
    localChronology.validate(localMonthDay, getValues());
    return localMonthDay;
  }

  public MonthDay withDayOfMonth(int paramInt)
  {
    int[] arrayOfInt = getValues();
    return new MonthDay(this, getChronology().dayOfMonth().set(this, 1, arrayOfInt, paramInt));
  }

  public MonthDay withField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDateTimeFieldType);
    if (paramInt == getValue(i))
      return this;
    int[] arrayOfInt = getValues();
    return new MonthDay(this, getField(i).set(this, i, arrayOfInt, paramInt));
  }

  public MonthDay withFieldAdded(DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDurationFieldType);
    if (paramInt == 0)
      return this;
    int[] arrayOfInt = getValues();
    return new MonthDay(this, getField(i).add(this, i, arrayOfInt, paramInt));
  }

  public MonthDay withMonthOfYear(int paramInt)
  {
    int[] arrayOfInt = getValues();
    return new MonthDay(this, getChronology().monthOfYear().set(this, 0, arrayOfInt, paramInt));
  }

  public MonthDay withPeriodAdded(ReadablePeriod paramReadablePeriod, int paramInt)
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
    return new MonthDay(this, arrayOfInt);
  }
}