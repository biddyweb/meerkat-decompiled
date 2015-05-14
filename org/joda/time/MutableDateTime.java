package org.joda.time;

import java.io.Serializable;
import org.joda.convert.FromString;
import org.joda.time.base.BaseDateTime;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class MutableDateTime extends BaseDateTime
  implements ReadWritableDateTime, Cloneable, Serializable
{
  public static final int ROUND_CEILING = 2;
  public static final int ROUND_FLOOR = 1;
  public static final int ROUND_HALF_CEILING = 4;
  public static final int ROUND_HALF_EVEN = 5;
  public static final int ROUND_HALF_FLOOR = 3;
  public static final int ROUND_NONE = 0;
  private static final long serialVersionUID = 2852608688135209575L;
  private DateTimeField iRoundingField;
  private int iRoundingMode;

  public MutableDateTime()
  {
  }

  public MutableDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
  }

  public MutableDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, Chronology paramChronology)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramChronology);
  }

  public MutableDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, DateTimeZone paramDateTimeZone)
  {
    super(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramDateTimeZone);
  }

  public MutableDateTime(long paramLong)
  {
    super(paramLong);
  }

  public MutableDateTime(long paramLong, Chronology paramChronology)
  {
    super(paramLong, paramChronology);
  }

  public MutableDateTime(long paramLong, DateTimeZone paramDateTimeZone)
  {
    super(paramLong, paramDateTimeZone);
  }

  public MutableDateTime(Object paramObject)
  {
    super(paramObject, (Chronology)null);
  }

  public MutableDateTime(Object paramObject, Chronology paramChronology)
  {
    super(paramObject, DateTimeUtils.getChronology(paramChronology));
  }

  public MutableDateTime(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    super(paramObject, paramDateTimeZone);
  }

  public MutableDateTime(Chronology paramChronology)
  {
    super(paramChronology);
  }

  public MutableDateTime(DateTimeZone paramDateTimeZone)
  {
    super(paramDateTimeZone);
  }

  public static MutableDateTime now()
  {
    return new MutableDateTime();
  }

  public static MutableDateTime now(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new NullPointerException("Chronology must not be null");
    return new MutableDateTime(paramChronology);
  }

  public static MutableDateTime now(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      throw new NullPointerException("Zone must not be null");
    return new MutableDateTime(paramDateTimeZone);
  }

  @FromString
  public static MutableDateTime parse(String paramString)
  {
    return parse(paramString, ISODateTimeFormat.dateTimeParser().withOffsetParsed());
  }

  public static MutableDateTime parse(String paramString, DateTimeFormatter paramDateTimeFormatter)
  {
    return paramDateTimeFormatter.parseDateTime(paramString).toMutableDateTime();
  }

  public void add(long paramLong)
  {
    setMillis(FieldUtils.safeAdd(getMillis(), paramLong));
  }

  public void add(DurationFieldType paramDurationFieldType, int paramInt)
  {
    if (paramDurationFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    if (paramInt != 0)
      setMillis(paramDurationFieldType.getField(getChronology()).add(getMillis(), paramInt));
  }

  public void add(ReadableDuration paramReadableDuration)
  {
    add(paramReadableDuration, 1);
  }

  public void add(ReadableDuration paramReadableDuration, int paramInt)
  {
    if (paramReadableDuration != null)
      add(FieldUtils.safeMultiply(paramReadableDuration.getMillis(), paramInt));
  }

  public void add(ReadablePeriod paramReadablePeriod)
  {
    add(paramReadablePeriod, 1);
  }

  public void add(ReadablePeriod paramReadablePeriod, int paramInt)
  {
    if (paramReadablePeriod != null)
      setMillis(getChronology().add(paramReadablePeriod, getMillis(), paramInt));
  }

  public void addDays(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().days().add(getMillis(), paramInt));
  }

  public void addHours(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().hours().add(getMillis(), paramInt));
  }

  public void addMillis(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().millis().add(getMillis(), paramInt));
  }

  public void addMinutes(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().minutes().add(getMillis(), paramInt));
  }

  public void addMonths(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().months().add(getMillis(), paramInt));
  }

  public void addSeconds(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().seconds().add(getMillis(), paramInt));
  }

  public void addWeeks(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().weeks().add(getMillis(), paramInt));
  }

  public void addWeekyears(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().weekyears().add(getMillis(), paramInt));
  }

  public void addYears(int paramInt)
  {
    if (paramInt != 0)
      setMillis(getChronology().years().add(getMillis(), paramInt));
  }

  public MutableDateTime.Property centuryOfEra()
  {
    return new MutableDateTime.Property(this, getChronology().centuryOfEra());
  }

  public Object clone()
  {
    try
    {
      Object localObject = super.clone();
      return localObject;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
    }
    throw new InternalError("Clone error");
  }

  public MutableDateTime copy()
  {
    return (MutableDateTime)clone();
  }

  public MutableDateTime.Property dayOfMonth()
  {
    return new MutableDateTime.Property(this, getChronology().dayOfMonth());
  }

  public MutableDateTime.Property dayOfWeek()
  {
    return new MutableDateTime.Property(this, getChronology().dayOfWeek());
  }

  public MutableDateTime.Property dayOfYear()
  {
    return new MutableDateTime.Property(this, getChronology().dayOfYear());
  }

  public MutableDateTime.Property era()
  {
    return new MutableDateTime.Property(this, getChronology().era());
  }

  public DateTimeField getRoundingField()
  {
    return this.iRoundingField;
  }

  public int getRoundingMode()
  {
    return this.iRoundingMode;
  }

  public MutableDateTime.Property hourOfDay()
  {
    return new MutableDateTime.Property(this, getChronology().hourOfDay());
  }

  public MutableDateTime.Property millisOfDay()
  {
    return new MutableDateTime.Property(this, getChronology().millisOfDay());
  }

  public MutableDateTime.Property millisOfSecond()
  {
    return new MutableDateTime.Property(this, getChronology().millisOfSecond());
  }

  public MutableDateTime.Property minuteOfDay()
  {
    return new MutableDateTime.Property(this, getChronology().minuteOfDay());
  }

  public MutableDateTime.Property minuteOfHour()
  {
    return new MutableDateTime.Property(this, getChronology().minuteOfHour());
  }

  public MutableDateTime.Property monthOfYear()
  {
    return new MutableDateTime.Property(this, getChronology().monthOfYear());
  }

  public MutableDateTime.Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The DateTimeFieldType must not be null");
    DateTimeField localDateTimeField = paramDateTimeFieldType.getField(getChronology());
    if (!localDateTimeField.isSupported())
      throw new IllegalArgumentException("Field '" + paramDateTimeFieldType + "' is not supported");
    return new MutableDateTime.Property(this, localDateTimeField);
  }

  public MutableDateTime.Property secondOfDay()
  {
    return new MutableDateTime.Property(this, getChronology().secondOfDay());
  }

  public MutableDateTime.Property secondOfMinute()
  {
    return new MutableDateTime.Property(this, getChronology().secondOfMinute());
  }

  public void set(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("Field must not be null");
    setMillis(paramDateTimeFieldType.getField(getChronology()).set(getMillis(), paramInt));
  }

  public void setChronology(Chronology paramChronology)
  {
    super.setChronology(paramChronology);
  }

  public void setDate(int paramInt1, int paramInt2, int paramInt3)
  {
    setDate(getChronology().getDateTimeMillis(paramInt1, paramInt2, paramInt3, 0));
  }

  public void setDate(long paramLong)
  {
    setMillis(getChronology().millisOfDay().set(paramLong, getMillisOfDay()));
  }

  public void setDate(ReadableInstant paramReadableInstant)
  {
    long l = DateTimeUtils.getInstantMillis(paramReadableInstant);
    if ((paramReadableInstant instanceof ReadableDateTime))
    {
      DateTimeZone localDateTimeZone = DateTimeUtils.getChronology(((ReadableDateTime)paramReadableInstant).getChronology()).getZone();
      if (localDateTimeZone != null)
        l = localDateTimeZone.getMillisKeepLocal(getZone(), l);
    }
    setDate(l);
  }

  public void setDateTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
  {
    setMillis(getChronology().getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7));
  }

  public void setDayOfMonth(int paramInt)
  {
    setMillis(getChronology().dayOfMonth().set(getMillis(), paramInt));
  }

  public void setDayOfWeek(int paramInt)
  {
    setMillis(getChronology().dayOfWeek().set(getMillis(), paramInt));
  }

  public void setDayOfYear(int paramInt)
  {
    setMillis(getChronology().dayOfYear().set(getMillis(), paramInt));
  }

  public void setHourOfDay(int paramInt)
  {
    setMillis(getChronology().hourOfDay().set(getMillis(), paramInt));
  }

  public void setMillis(long paramLong)
  {
    switch (this.iRoundingMode)
    {
    case 0:
    default:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    }
    while (true)
    {
      super.setMillis(paramLong);
      return;
      paramLong = this.iRoundingField.roundFloor(paramLong);
      continue;
      paramLong = this.iRoundingField.roundCeiling(paramLong);
      continue;
      paramLong = this.iRoundingField.roundHalfFloor(paramLong);
      continue;
      paramLong = this.iRoundingField.roundHalfCeiling(paramLong);
      continue;
      paramLong = this.iRoundingField.roundHalfEven(paramLong);
    }
  }

  public void setMillis(ReadableInstant paramReadableInstant)
  {
    setMillis(DateTimeUtils.getInstantMillis(paramReadableInstant));
  }

  public void setMillisOfDay(int paramInt)
  {
    setMillis(getChronology().millisOfDay().set(getMillis(), paramInt));
  }

  public void setMillisOfSecond(int paramInt)
  {
    setMillis(getChronology().millisOfSecond().set(getMillis(), paramInt));
  }

  public void setMinuteOfDay(int paramInt)
  {
    setMillis(getChronology().minuteOfDay().set(getMillis(), paramInt));
  }

  public void setMinuteOfHour(int paramInt)
  {
    setMillis(getChronology().minuteOfHour().set(getMillis(), paramInt));
  }

  public void setMonthOfYear(int paramInt)
  {
    setMillis(getChronology().monthOfYear().set(getMillis(), paramInt));
  }

  public void setRounding(DateTimeField paramDateTimeField)
  {
    setRounding(paramDateTimeField, 1);
  }

  public void setRounding(DateTimeField paramDateTimeField, int paramInt)
  {
    if ((paramDateTimeField != null) && ((paramInt < 0) || (paramInt > 5)))
      throw new IllegalArgumentException("Illegal rounding mode: " + paramInt);
    if (paramInt == 0);
    for (DateTimeField localDateTimeField = null; ; localDateTimeField = paramDateTimeField)
    {
      this.iRoundingField = localDateTimeField;
      if (paramDateTimeField == null)
        paramInt = 0;
      this.iRoundingMode = paramInt;
      setMillis(getMillis());
      return;
    }
  }

  public void setSecondOfDay(int paramInt)
  {
    setMillis(getChronology().secondOfDay().set(getMillis(), paramInt));
  }

  public void setSecondOfMinute(int paramInt)
  {
    setMillis(getChronology().secondOfMinute().set(getMillis(), paramInt));
  }

  public void setTime(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    setMillis(getChronology().getDateTimeMillis(getMillis(), paramInt1, paramInt2, paramInt3, paramInt4));
  }

  public void setTime(long paramLong)
  {
    int i = ISOChronology.getInstanceUTC().millisOfDay().get(paramLong);
    setMillis(getChronology().millisOfDay().set(getMillis(), i));
  }

  public void setTime(ReadableInstant paramReadableInstant)
  {
    long l = DateTimeUtils.getInstantMillis(paramReadableInstant);
    DateTimeZone localDateTimeZone = DateTimeUtils.getInstantChronology(paramReadableInstant).getZone();
    if (localDateTimeZone != null)
      l = localDateTimeZone.getMillisKeepLocal(DateTimeZone.UTC, l);
    setTime(l);
  }

  public void setWeekOfWeekyear(int paramInt)
  {
    setMillis(getChronology().weekOfWeekyear().set(getMillis(), paramInt));
  }

  public void setWeekyear(int paramInt)
  {
    setMillis(getChronology().weekyear().set(getMillis(), paramInt));
  }

  public void setYear(int paramInt)
  {
    setMillis(getChronology().year().set(getMillis(), paramInt));
  }

  public void setZone(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone = DateTimeUtils.getZone(paramDateTimeZone);
    Chronology localChronology = getChronology();
    if (localChronology.getZone() != localDateTimeZone)
      setChronology(localChronology.withZone(localDateTimeZone));
  }

  public void setZoneRetainFields(DateTimeZone paramDateTimeZone)
  {
    DateTimeZone localDateTimeZone1 = DateTimeUtils.getZone(paramDateTimeZone);
    DateTimeZone localDateTimeZone2 = DateTimeUtils.getZone(getZone());
    if (localDateTimeZone1 == localDateTimeZone2)
      return;
    long l = localDateTimeZone2.getMillisKeepLocal(localDateTimeZone1, getMillis());
    setChronology(getChronology().withZone(localDateTimeZone1));
    setMillis(l);
  }

  public MutableDateTime.Property weekOfWeekyear()
  {
    return new MutableDateTime.Property(this, getChronology().weekOfWeekyear());
  }

  public MutableDateTime.Property weekyear()
  {
    return new MutableDateTime.Property(this, getChronology().weekyear());
  }

  public MutableDateTime.Property year()
  {
    return new MutableDateTime.Property(this, getChronology().year());
  }

  public MutableDateTime.Property yearOfCentury()
  {
    return new MutableDateTime.Property(this, getChronology().yearOfCentury());
  }

  public MutableDateTime.Property yearOfEra()
  {
    return new MutableDateTime.Property(this, getChronology().yearOfEra());
  }
}