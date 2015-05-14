package org.joda.time.chrono;

import java.io.Serializable;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.ReadablePartial;
import org.joda.time.ReadablePeriod;
import org.joda.time.field.FieldUtils;
import org.joda.time.field.UnsupportedDateTimeField;
import org.joda.time.field.UnsupportedDurationField;

public abstract class BaseChronology extends Chronology
  implements Serializable
{
  private static final long serialVersionUID = -7310865996721419676L;

  public long add(long paramLong1, long paramLong2, int paramInt)
  {
    if ((paramLong2 == 0L) || (paramInt == 0))
      return paramLong1;
    return FieldUtils.safeAdd(paramLong1, FieldUtils.safeMultiply(paramLong2, paramInt));
  }

  public long add(ReadablePeriod paramReadablePeriod, long paramLong, int paramInt)
  {
    if ((paramInt != 0) && (paramReadablePeriod != null))
    {
      int i = paramReadablePeriod.size();
      int j = 0;
      long l1 = paramLong;
      while (j < i)
      {
        long l2 = paramReadablePeriod.getValue(j);
        if (l2 != 0L)
          l1 = paramReadablePeriod.getFieldType(j).getField(this).add(l1, l2 * paramInt);
        j++;
      }
      paramLong = l1;
    }
    return paramLong;
  }

  public DurationField centuries()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.centuries());
  }

  public DateTimeField centuryOfEra()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.centuryOfEra(), centuries());
  }

  public DateTimeField clockhourOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.clockhourOfDay(), hours());
  }

  public DateTimeField clockhourOfHalfday()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.clockhourOfHalfday(), hours());
  }

  public DateTimeField dayOfMonth()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.dayOfMonth(), days());
  }

  public DateTimeField dayOfWeek()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.dayOfWeek(), days());
  }

  public DateTimeField dayOfYear()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.dayOfYear(), days());
  }

  public DurationField days()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.days());
  }

  public DateTimeField era()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.era(), eras());
  }

  public DurationField eras()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.eras());
  }

  public int[] get(ReadablePartial paramReadablePartial, long paramLong)
  {
    int i = paramReadablePartial.size();
    int[] arrayOfInt = new int[i];
    for (int j = 0; j < i; j++)
      arrayOfInt[j] = paramReadablePartial.getFieldType(j).getField(this).get(paramLong);
    return arrayOfInt;
  }

  public int[] get(ReadablePeriod paramReadablePeriod, long paramLong)
  {
    int i = paramReadablePeriod.size();
    int[] arrayOfInt = new int[i];
    if (paramLong != 0L)
    {
      long l = 0L;
      for (int j = 0; j < i; j++)
      {
        DurationField localDurationField = paramReadablePeriod.getFieldType(j).getField(this);
        if (localDurationField.isPrecise())
        {
          int k = localDurationField.getDifference(paramLong, l);
          l = localDurationField.add(l, k);
          arrayOfInt[j] = k;
        }
      }
    }
    return arrayOfInt;
  }

  public int[] get(ReadablePeriod paramReadablePeriod, long paramLong1, long paramLong2)
  {
    int i = paramReadablePeriod.size();
    int[] arrayOfInt = new int[i];
    if (paramLong1 != paramLong2)
    {
      int j = 0;
      long l = paramLong1;
      while (j < i)
      {
        DurationField localDurationField = paramReadablePeriod.getFieldType(j).getField(this);
        int k = localDurationField.getDifference(paramLong2, l);
        if (k != 0)
          l = localDurationField.add(l, k);
        arrayOfInt[j] = k;
        j++;
      }
    }
    return arrayOfInt;
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    long l1 = year().set(0L, paramInt1);
    long l2 = monthOfYear().set(l1, paramInt2);
    long l3 = dayOfMonth().set(l2, paramInt3);
    return millisOfDay().set(l3, paramInt4);
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
    throws IllegalArgumentException
  {
    long l1 = year().set(0L, paramInt1);
    long l2 = monthOfYear().set(l1, paramInt2);
    long l3 = dayOfMonth().set(l2, paramInt3);
    long l4 = hourOfDay().set(l3, paramInt4);
    long l5 = minuteOfHour().set(l4, paramInt5);
    long l6 = secondOfMinute().set(l5, paramInt6);
    return millisOfSecond().set(l6, paramInt7);
  }

  public long getDateTimeMillis(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    long l1 = hourOfDay().set(paramLong, paramInt1);
    long l2 = minuteOfHour().set(l1, paramInt2);
    long l3 = secondOfMinute().set(l2, paramInt3);
    return millisOfSecond().set(l3, paramInt4);
  }

  public abstract DateTimeZone getZone();

  public DateTimeField halfdayOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.halfdayOfDay(), halfdays());
  }

  public DurationField halfdays()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.halfdays());
  }

  public DateTimeField hourOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.hourOfDay(), hours());
  }

  public DateTimeField hourOfHalfday()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.hourOfHalfday(), hours());
  }

  public DurationField hours()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.hours());
  }

  public DurationField millis()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.millis());
  }

  public DateTimeField millisOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.millisOfDay(), millis());
  }

  public DateTimeField millisOfSecond()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.millisOfSecond(), millis());
  }

  public DateTimeField minuteOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.minuteOfDay(), minutes());
  }

  public DateTimeField minuteOfHour()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.minuteOfHour(), minutes());
  }

  public DurationField minutes()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.minutes());
  }

  public DateTimeField monthOfYear()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.monthOfYear(), months());
  }

  public DurationField months()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.months());
  }

  public DateTimeField secondOfDay()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.secondOfDay(), seconds());
  }

  public DateTimeField secondOfMinute()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.secondOfMinute(), seconds());
  }

  public DurationField seconds()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.seconds());
  }

  public long set(ReadablePartial paramReadablePartial, long paramLong)
  {
    int i = 0;
    int j = paramReadablePartial.size();
    while (i < j)
    {
      paramLong = paramReadablePartial.getFieldType(i).getField(this).set(paramLong, paramReadablePartial.getValue(i));
      i++;
    }
    return paramLong;
  }

  public abstract String toString();

  public void validate(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    int i = paramReadablePartial.size();
    int k;
    for (int j = 0; ; j++)
    {
      k = 0;
      if (j >= i)
        break;
      int n = paramArrayOfInt[j];
      DateTimeField localDateTimeField2 = paramReadablePartial.getField(j);
      if (n < localDateTimeField2.getMinimumValue())
        throw new IllegalFieldValueException(localDateTimeField2.getType(), Integer.valueOf(n), Integer.valueOf(localDateTimeField2.getMinimumValue()), null);
      if (n > localDateTimeField2.getMaximumValue())
        throw new IllegalFieldValueException(localDateTimeField2.getType(), Integer.valueOf(n), null, Integer.valueOf(localDateTimeField2.getMaximumValue()));
    }
    int m;
    DateTimeField localDateTimeField1;
    do
    {
      k++;
      if (k >= i)
        break;
      m = paramArrayOfInt[k];
      localDateTimeField1 = paramReadablePartial.getField(k);
      if (m < localDateTimeField1.getMinimumValue(paramReadablePartial, paramArrayOfInt))
        throw new IllegalFieldValueException(localDateTimeField1.getType(), Integer.valueOf(m), Integer.valueOf(localDateTimeField1.getMinimumValue(paramReadablePartial, paramArrayOfInt)), null);
    }
    while (m <= localDateTimeField1.getMaximumValue(paramReadablePartial, paramArrayOfInt));
    throw new IllegalFieldValueException(localDateTimeField1.getType(), Integer.valueOf(m), null, Integer.valueOf(localDateTimeField1.getMaximumValue(paramReadablePartial, paramArrayOfInt)));
  }

  public DateTimeField weekOfWeekyear()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.weekOfWeekyear(), weeks());
  }

  public DurationField weeks()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.weeks());
  }

  public DateTimeField weekyear()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.weekyear(), weekyears());
  }

  public DateTimeField weekyearOfCentury()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.weekyearOfCentury(), weekyears());
  }

  public DurationField weekyears()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.weekyears());
  }

  public abstract Chronology withUTC();

  public abstract Chronology withZone(DateTimeZone paramDateTimeZone);

  public DateTimeField year()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.year(), years());
  }

  public DateTimeField yearOfCentury()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.yearOfCentury(), years());
  }

  public DateTimeField yearOfEra()
  {
    return UnsupportedDateTimeField.getInstance(DateTimeFieldType.yearOfEra(), years());
  }

  public DurationField years()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.years());
  }
}