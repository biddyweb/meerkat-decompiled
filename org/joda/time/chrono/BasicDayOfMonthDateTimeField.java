package org.joda.time.chrono;

import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;
import org.joda.time.field.PreciseDurationDateTimeField;

final class BasicDayOfMonthDateTimeField extends PreciseDurationDateTimeField
{
  private static final long serialVersionUID = -4677223814028011723L;
  private final BasicChronology iChronology;

  BasicDayOfMonthDateTimeField(BasicChronology paramBasicChronology, DurationField paramDurationField)
  {
    super(DateTimeFieldType.dayOfMonth(), paramDurationField);
    this.iChronology = paramBasicChronology;
  }

  private Object readResolve()
  {
    return this.iChronology.dayOfMonth();
  }

  public int get(long paramLong)
  {
    return this.iChronology.getDayOfMonth(paramLong);
  }

  public int getMaximumValue()
  {
    return this.iChronology.getDaysInMonthMax();
  }

  public int getMaximumValue(long paramLong)
  {
    return this.iChronology.getDaysInMonthMax(paramLong);
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial.isSupported(DateTimeFieldType.monthOfYear()))
    {
      int i = paramReadablePartial.get(DateTimeFieldType.monthOfYear());
      if (paramReadablePartial.isSupported(DateTimeFieldType.year()))
      {
        int j = paramReadablePartial.get(DateTimeFieldType.year());
        return this.iChronology.getDaysInYearMonth(j, i);
      }
      return this.iChronology.getDaysInMonthMax(i);
    }
    return getMaximumValue();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    int i = 0;
    int j = paramReadablePartial.size();
    for (int k = 0; k < j; k++)
      if (paramReadablePartial.getFieldType(k) == DateTimeFieldType.monthOfYear())
      {
        int m = paramArrayOfInt[k];
        while (i < j)
        {
          if (paramReadablePartial.getFieldType(i) == DateTimeFieldType.year())
          {
            int n = paramArrayOfInt[i];
            return this.iChronology.getDaysInYearMonth(n, m);
          }
          i++;
        }
        return this.iChronology.getDaysInMonthMax(m);
      }
    return getMaximumValue();
  }

  protected int getMaximumValueForSet(long paramLong, int paramInt)
  {
    return this.iChronology.getDaysInMonthMaxForSet(paramLong, paramInt);
  }

  public int getMinimumValue()
  {
    return 1;
  }

  public DurationField getRangeDurationField()
  {
    return this.iChronology.months();
  }

  public boolean isLeap(long paramLong)
  {
    return this.iChronology.isLeapDay(paramLong);
  }
}