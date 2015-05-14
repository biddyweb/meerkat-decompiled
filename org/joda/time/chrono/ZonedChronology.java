package org.joda.time.chrono;

import java.util.HashMap;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.IllegalInstantException;
import org.joda.time.ReadablePartial;
import org.joda.time.field.BaseDateTimeField;
import org.joda.time.field.BaseDurationField;

public final class ZonedChronology extends AssembledChronology
{
  private static final long serialVersionUID = -1079258847191166848L;

  private ZonedChronology(Chronology paramChronology, DateTimeZone paramDateTimeZone)
  {
    super(paramChronology, paramDateTimeZone);
  }

  private DateTimeField convertField(DateTimeField paramDateTimeField, HashMap<Object, Object> paramHashMap)
  {
    if ((paramDateTimeField == null) || (!paramDateTimeField.isSupported()))
      return paramDateTimeField;
    if (paramHashMap.containsKey(paramDateTimeField))
      return (DateTimeField)paramHashMap.get(paramDateTimeField);
    ZonedDateTimeField localZonedDateTimeField = new ZonedDateTimeField(paramDateTimeField, getZone(), convertField(paramDateTimeField.getDurationField(), paramHashMap), convertField(paramDateTimeField.getRangeDurationField(), paramHashMap), convertField(paramDateTimeField.getLeapDurationField(), paramHashMap));
    paramHashMap.put(paramDateTimeField, localZonedDateTimeField);
    return localZonedDateTimeField;
  }

  private DurationField convertField(DurationField paramDurationField, HashMap<Object, Object> paramHashMap)
  {
    if ((paramDurationField == null) || (!paramDurationField.isSupported()))
      return paramDurationField;
    if (paramHashMap.containsKey(paramDurationField))
      return (DurationField)paramHashMap.get(paramDurationField);
    ZonedDurationField localZonedDurationField = new ZonedDurationField(paramDurationField, getZone());
    paramHashMap.put(paramDurationField, localZonedDurationField);
    return localZonedDurationField;
  }

  public static ZonedChronology getInstance(Chronology paramChronology, DateTimeZone paramDateTimeZone)
  {
    if (paramChronology == null)
      throw new IllegalArgumentException("Must supply a chronology");
    Chronology localChronology = paramChronology.withUTC();
    if (localChronology == null)
      throw new IllegalArgumentException("UTC chronology must not be null");
    if (paramDateTimeZone == null)
      throw new IllegalArgumentException("DateTimeZone must not be null");
    return new ZonedChronology(localChronology, paramDateTimeZone);
  }

  private long localToUTC(long paramLong)
  {
    DateTimeZone localDateTimeZone = getZone();
    int i = localDateTimeZone.getOffsetFromLocal(paramLong);
    long l = paramLong - i;
    if (i != localDateTimeZone.getOffset(l))
      throw new IllegalInstantException(paramLong, localDateTimeZone.getID());
    return l;
  }

  static boolean useTimeArithmetic(DurationField paramDurationField)
  {
    return (paramDurationField != null) && (paramDurationField.getUnitMillis() < 43200000L);
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    HashMap localHashMap = new HashMap();
    paramFields.eras = convertField(paramFields.eras, localHashMap);
    paramFields.centuries = convertField(paramFields.centuries, localHashMap);
    paramFields.years = convertField(paramFields.years, localHashMap);
    paramFields.months = convertField(paramFields.months, localHashMap);
    paramFields.weekyears = convertField(paramFields.weekyears, localHashMap);
    paramFields.weeks = convertField(paramFields.weeks, localHashMap);
    paramFields.days = convertField(paramFields.days, localHashMap);
    paramFields.halfdays = convertField(paramFields.halfdays, localHashMap);
    paramFields.hours = convertField(paramFields.hours, localHashMap);
    paramFields.minutes = convertField(paramFields.minutes, localHashMap);
    paramFields.seconds = convertField(paramFields.seconds, localHashMap);
    paramFields.millis = convertField(paramFields.millis, localHashMap);
    paramFields.year = convertField(paramFields.year, localHashMap);
    paramFields.yearOfEra = convertField(paramFields.yearOfEra, localHashMap);
    paramFields.yearOfCentury = convertField(paramFields.yearOfCentury, localHashMap);
    paramFields.centuryOfEra = convertField(paramFields.centuryOfEra, localHashMap);
    paramFields.era = convertField(paramFields.era, localHashMap);
    paramFields.dayOfWeek = convertField(paramFields.dayOfWeek, localHashMap);
    paramFields.dayOfMonth = convertField(paramFields.dayOfMonth, localHashMap);
    paramFields.dayOfYear = convertField(paramFields.dayOfYear, localHashMap);
    paramFields.monthOfYear = convertField(paramFields.monthOfYear, localHashMap);
    paramFields.weekOfWeekyear = convertField(paramFields.weekOfWeekyear, localHashMap);
    paramFields.weekyear = convertField(paramFields.weekyear, localHashMap);
    paramFields.weekyearOfCentury = convertField(paramFields.weekyearOfCentury, localHashMap);
    paramFields.millisOfSecond = convertField(paramFields.millisOfSecond, localHashMap);
    paramFields.millisOfDay = convertField(paramFields.millisOfDay, localHashMap);
    paramFields.secondOfMinute = convertField(paramFields.secondOfMinute, localHashMap);
    paramFields.secondOfDay = convertField(paramFields.secondOfDay, localHashMap);
    paramFields.minuteOfHour = convertField(paramFields.minuteOfHour, localHashMap);
    paramFields.minuteOfDay = convertField(paramFields.minuteOfDay, localHashMap);
    paramFields.hourOfDay = convertField(paramFields.hourOfDay, localHashMap);
    paramFields.hourOfHalfday = convertField(paramFields.hourOfHalfday, localHashMap);
    paramFields.clockhourOfDay = convertField(paramFields.clockhourOfDay, localHashMap);
    paramFields.clockhourOfHalfday = convertField(paramFields.clockhourOfHalfday, localHashMap);
    paramFields.halfdayOfDay = convertField(paramFields.halfdayOfDay, localHashMap);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ZonedChronology localZonedChronology;
    do
    {
      return true;
      if (!(paramObject instanceof ZonedChronology))
        return false;
      localZonedChronology = (ZonedChronology)paramObject;
    }
    while ((getBase().equals(localZonedChronology.getBase())) && (getZone().equals(localZonedChronology.getZone())));
    return false;
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    return localToUTC(getBase().getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4));
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
    throws IllegalArgumentException
  {
    return localToUTC(getBase().getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7));
  }

  public long getDateTimeMillis(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    return localToUTC(getBase().getDateTimeMillis(paramLong + getZone().getOffset(paramLong), paramInt1, paramInt2, paramInt3, paramInt4));
  }

  public DateTimeZone getZone()
  {
    return (DateTimeZone)getParam();
  }

  public int hashCode()
  {
    return 326565 + 11 * getZone().hashCode() + 7 * getBase().hashCode();
  }

  public String toString()
  {
    return "ZonedChronology[" + getBase() + ", " + getZone().getID() + ']';
  }

  public Chronology withUTC()
  {
    return getBase();
  }

  public Chronology withZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    if (paramDateTimeZone == getParam())
      return this;
    if (paramDateTimeZone == DateTimeZone.UTC)
      return getBase();
    return new ZonedChronology(getBase(), paramDateTimeZone);
  }

  static final class ZonedDateTimeField extends BaseDateTimeField
  {
    private static final long serialVersionUID = -3968986277775529794L;
    final DurationField iDurationField;
    final DateTimeField iField;
    final DurationField iLeapDurationField;
    final DurationField iRangeDurationField;
    final boolean iTimeField;
    final DateTimeZone iZone;

    ZonedDateTimeField(DateTimeField paramDateTimeField, DateTimeZone paramDateTimeZone, DurationField paramDurationField1, DurationField paramDurationField2, DurationField paramDurationField3)
    {
      super();
      if (!paramDateTimeField.isSupported())
        throw new IllegalArgumentException();
      this.iField = paramDateTimeField;
      this.iZone = paramDateTimeZone;
      this.iDurationField = paramDurationField1;
      this.iTimeField = ZonedChronology.useTimeArithmetic(paramDurationField1);
      this.iRangeDurationField = paramDurationField2;
      this.iLeapDurationField = paramDurationField3;
    }

    private int getOffsetToAdd(long paramLong)
    {
      int i = this.iZone.getOffset(paramLong);
      if (((paramLong ^ paramLong + i) < 0L) && ((paramLong ^ i) >= 0L))
        throw new ArithmeticException("Adding time zone offset caused overflow");
      return i;
    }

    public long add(long paramLong, int paramInt)
    {
      if (this.iTimeField)
      {
        int i = getOffsetToAdd(paramLong);
        return this.iField.add(paramLong + i, paramInt) - i;
      }
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.add(l1, paramInt);
      return this.iZone.convertLocalToUTC(l2, false, paramLong);
    }

    public long add(long paramLong1, long paramLong2)
    {
      if (this.iTimeField)
      {
        int i = getOffsetToAdd(paramLong1);
        return this.iField.add(paramLong1 + i, paramLong2) - i;
      }
      long l1 = this.iZone.convertUTCToLocal(paramLong1);
      long l2 = this.iField.add(l1, paramLong2);
      return this.iZone.convertLocalToUTC(l2, false, paramLong1);
    }

    public long addWrapField(long paramLong, int paramInt)
    {
      if (this.iTimeField)
      {
        int i = getOffsetToAdd(paramLong);
        return this.iField.addWrapField(paramLong + i, paramInt) - i;
      }
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.addWrapField(l1, paramInt);
      return this.iZone.convertLocalToUTC(l2, false, paramLong);
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      ZonedDateTimeField localZonedDateTimeField;
      do
      {
        return true;
        if (!(paramObject instanceof ZonedDateTimeField))
          break;
        localZonedDateTimeField = (ZonedDateTimeField)paramObject;
      }
      while ((this.iField.equals(localZonedDateTimeField.iField)) && (this.iZone.equals(localZonedDateTimeField.iZone)) && (this.iDurationField.equals(localZonedDateTimeField.iDurationField)) && (this.iRangeDurationField.equals(localZonedDateTimeField.iRangeDurationField)));
      return false;
      return false;
    }

    public int get(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.get(l);
    }

    public String getAsShortText(int paramInt, Locale paramLocale)
    {
      return this.iField.getAsShortText(paramInt, paramLocale);
    }

    public String getAsShortText(long paramLong, Locale paramLocale)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.getAsShortText(l, paramLocale);
    }

    public String getAsText(int paramInt, Locale paramLocale)
    {
      return this.iField.getAsText(paramInt, paramLocale);
    }

    public String getAsText(long paramLong, Locale paramLocale)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.getAsText(l, paramLocale);
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      int i = getOffsetToAdd(paramLong2);
      DateTimeField localDateTimeField = this.iField;
      if (this.iTimeField);
      for (int j = i; ; j = getOffsetToAdd(paramLong1))
        return localDateTimeField.getDifference(paramLong1 + j, paramLong2 + i);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      int i = getOffsetToAdd(paramLong2);
      DateTimeField localDateTimeField = this.iField;
      if (this.iTimeField);
      for (int j = i; ; j = getOffsetToAdd(paramLong1))
        return localDateTimeField.getDifferenceAsLong(paramLong1 + j, paramLong2 + i);
    }

    public final DurationField getDurationField()
    {
      return this.iDurationField;
    }

    public int getLeapAmount(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.getLeapAmount(l);
    }

    public final DurationField getLeapDurationField()
    {
      return this.iLeapDurationField;
    }

    public int getMaximumShortTextLength(Locale paramLocale)
    {
      return this.iField.getMaximumShortTextLength(paramLocale);
    }

    public int getMaximumTextLength(Locale paramLocale)
    {
      return this.iField.getMaximumTextLength(paramLocale);
    }

    public int getMaximumValue()
    {
      return this.iField.getMaximumValue();
    }

    public int getMaximumValue(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.getMaximumValue(l);
    }

    public int getMaximumValue(ReadablePartial paramReadablePartial)
    {
      return this.iField.getMaximumValue(paramReadablePartial);
    }

    public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
    {
      return this.iField.getMaximumValue(paramReadablePartial, paramArrayOfInt);
    }

    public int getMinimumValue()
    {
      return this.iField.getMinimumValue();
    }

    public int getMinimumValue(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.getMinimumValue(l);
    }

    public int getMinimumValue(ReadablePartial paramReadablePartial)
    {
      return this.iField.getMinimumValue(paramReadablePartial);
    }

    public int getMinimumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
    {
      return this.iField.getMinimumValue(paramReadablePartial, paramArrayOfInt);
    }

    public final DurationField getRangeDurationField()
    {
      return this.iRangeDurationField;
    }

    public int hashCode()
    {
      return this.iField.hashCode() ^ this.iZone.hashCode();
    }

    public boolean isLeap(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.isLeap(l);
    }

    public boolean isLenient()
    {
      return this.iField.isLenient();
    }

    public long remainder(long paramLong)
    {
      long l = this.iZone.convertUTCToLocal(paramLong);
      return this.iField.remainder(l);
    }

    public long roundCeiling(long paramLong)
    {
      if (this.iTimeField)
      {
        int i = getOffsetToAdd(paramLong);
        return this.iField.roundCeiling(paramLong + i) - i;
      }
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.roundCeiling(l1);
      return this.iZone.convertLocalToUTC(l2, false, paramLong);
    }

    public long roundFloor(long paramLong)
    {
      if (this.iTimeField)
      {
        int i = getOffsetToAdd(paramLong);
        return this.iField.roundFloor(paramLong + i) - i;
      }
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.roundFloor(l1);
      return this.iZone.convertLocalToUTC(l2, false, paramLong);
    }

    public long set(long paramLong, int paramInt)
    {
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.set(l1, paramInt);
      long l3 = this.iZone.convertLocalToUTC(l2, false, paramLong);
      if (get(l3) != paramInt)
      {
        IllegalInstantException localIllegalInstantException = new IllegalInstantException(l2, this.iZone.getID());
        IllegalFieldValueException localIllegalFieldValueException = new IllegalFieldValueException(this.iField.getType(), Integer.valueOf(paramInt), localIllegalInstantException.getMessage());
        localIllegalFieldValueException.initCause(localIllegalInstantException);
        throw localIllegalFieldValueException;
      }
      return l3;
    }

    public long set(long paramLong, String paramString, Locale paramLocale)
    {
      long l1 = this.iZone.convertUTCToLocal(paramLong);
      long l2 = this.iField.set(l1, paramString, paramLocale);
      return this.iZone.convertLocalToUTC(l2, false, paramLong);
    }
  }

  static class ZonedDurationField extends BaseDurationField
  {
    private static final long serialVersionUID = -485345310999208286L;
    final DurationField iField;
    final boolean iTimeField;
    final DateTimeZone iZone;

    ZonedDurationField(DurationField paramDurationField, DateTimeZone paramDateTimeZone)
    {
      super();
      if (!paramDurationField.isSupported())
        throw new IllegalArgumentException();
      this.iField = paramDurationField;
      this.iTimeField = ZonedChronology.useTimeArithmetic(paramDurationField);
      this.iZone = paramDateTimeZone;
    }

    private long addOffset(long paramLong)
    {
      return this.iZone.convertUTCToLocal(paramLong);
    }

    private int getOffsetFromLocalToSubtract(long paramLong)
    {
      int i = this.iZone.getOffsetFromLocal(paramLong);
      if (((paramLong ^ paramLong - i) < 0L) && ((paramLong ^ i) < 0L))
        throw new ArithmeticException("Subtracting time zone offset caused overflow");
      return i;
    }

    private int getOffsetToAdd(long paramLong)
    {
      int i = this.iZone.getOffset(paramLong);
      if (((paramLong ^ paramLong + i) < 0L) && ((paramLong ^ i) >= 0L))
        throw new ArithmeticException("Adding time zone offset caused overflow");
      return i;
    }

    public long add(long paramLong, int paramInt)
    {
      int i = getOffsetToAdd(paramLong);
      long l = this.iField.add(paramLong + i, paramInt);
      if (this.iTimeField);
      while (true)
      {
        return l - i;
        i = getOffsetFromLocalToSubtract(l);
      }
    }

    public long add(long paramLong1, long paramLong2)
    {
      int i = getOffsetToAdd(paramLong1);
      long l = this.iField.add(paramLong1 + i, paramLong2);
      if (this.iTimeField);
      while (true)
      {
        return l - i;
        i = getOffsetFromLocalToSubtract(l);
      }
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      ZonedDurationField localZonedDurationField;
      do
      {
        return true;
        if (!(paramObject instanceof ZonedDurationField))
          break;
        localZonedDurationField = (ZonedDurationField)paramObject;
      }
      while ((this.iField.equals(localZonedDurationField.iField)) && (this.iZone.equals(localZonedDurationField.iZone)));
      return false;
      return false;
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      int i = getOffsetToAdd(paramLong2);
      DurationField localDurationField = this.iField;
      if (this.iTimeField);
      for (int j = i; ; j = getOffsetToAdd(paramLong1))
        return localDurationField.getDifference(paramLong1 + j, paramLong2 + i);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      int i = getOffsetToAdd(paramLong2);
      DurationField localDurationField = this.iField;
      if (this.iTimeField);
      for (int j = i; ; j = getOffsetToAdd(paramLong1))
        return localDurationField.getDifferenceAsLong(paramLong1 + j, paramLong2 + i);
    }

    public long getMillis(int paramInt, long paramLong)
    {
      return this.iField.getMillis(paramInt, addOffset(paramLong));
    }

    public long getMillis(long paramLong1, long paramLong2)
    {
      return this.iField.getMillis(paramLong1, addOffset(paramLong2));
    }

    public long getUnitMillis()
    {
      return this.iField.getUnitMillis();
    }

    public int getValue(long paramLong1, long paramLong2)
    {
      return this.iField.getValue(paramLong1, addOffset(paramLong2));
    }

    public long getValueAsLong(long paramLong1, long paramLong2)
    {
      return this.iField.getValueAsLong(paramLong1, addOffset(paramLong2));
    }

    public int hashCode()
    {
      return this.iField.hashCode() ^ this.iZone.hashCode();
    }

    public boolean isPrecise()
    {
      if (this.iTimeField)
        return this.iField.isPrecise();
      return (this.iField.isPrecise()) && (this.iZone.isFixed());
    }
  }
}