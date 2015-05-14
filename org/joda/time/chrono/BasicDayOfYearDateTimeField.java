package org.joda.time.chrono;

import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;
import org.joda.time.field.PreciseDurationDateTimeField;

final class BasicDayOfYearDateTimeField extends PreciseDurationDateTimeField
{
  private static final long serialVersionUID = -6821236822336841037L;
  private final BasicChronology iChronology;

  BasicDayOfYearDateTimeField(BasicChronology paramBasicChronology, DurationField paramDurationField)
  {
    super(DateTimeFieldType.dayOfYear(), paramDurationField);
    this.iChronology = paramBasicChronology;
  }

  private Object readResolve()
  {
    return this.iChronology.dayOfYear();
  }

  public int get(long paramLong)
  {
    return this.iChronology.getDayOfYear(paramLong);
  }

  public int getMaximumValue()
  {
    return this.iChronology.getDaysInYearMax();
  }

  public int getMaximumValue(long paramLong)
  {
    int i = this.iChronology.getYear(paramLong);
    return this.iChronology.getDaysInYear(i);
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial.isSupported(DateTimeFieldType.year()))
    {
      int i = paramReadablePartial.get(DateTimeFieldType.year());
      return this.iChronology.getDaysInYear(i);
    }
    return this.iChronology.getDaysInYearMax();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    int i = paramReadablePartial.size();
    for (int j = 0; j < i; j++)
      if (paramReadablePartial.getFieldType(j) == DateTimeFieldType.year())
      {
        int k = paramArrayOfInt[j];
        return this.iChronology.getDaysInYear(k);
      }
    return this.iChronology.getDaysInYearMax();
  }

  protected int getMaximumValueForSet(long paramLong, int paramInt)
  {
    int i = -1 + this.iChronology.getDaysInYearMax();
    if ((paramInt > i) || (paramInt < 1))
      i = getMaximumValue(paramLong);
    return i;
  }

  public int getMinimumValue()
  {
    return 1;
  }

  public DurationField getRangeDurationField()
  {
    return this.iChronology.years();
  }

  public boolean isLeap(long paramLong)
  {
    return this.iChronology.isLeapDay(paramLong);
  }
}