package org.joda.time.chrono;

import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;
import org.joda.time.field.PreciseDurationDateTimeField;

final class BasicWeekOfWeekyearDateTimeField extends PreciseDurationDateTimeField
{
  private static final long serialVersionUID = -1587436826395135328L;
  private final BasicChronology iChronology;

  BasicWeekOfWeekyearDateTimeField(BasicChronology paramBasicChronology, DurationField paramDurationField)
  {
    super(DateTimeFieldType.weekOfWeekyear(), paramDurationField);
    this.iChronology = paramBasicChronology;
  }

  private Object readResolve()
  {
    return this.iChronology.weekOfWeekyear();
  }

  public int get(long paramLong)
  {
    return this.iChronology.getWeekOfWeekyear(paramLong);
  }

  public int getMaximumValue()
  {
    return 53;
  }

  public int getMaximumValue(long paramLong)
  {
    int i = this.iChronology.getWeekyear(paramLong);
    return this.iChronology.getWeeksInYear(i);
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial.isSupported(DateTimeFieldType.weekyear()))
    {
      int i = paramReadablePartial.get(DateTimeFieldType.weekyear());
      return this.iChronology.getWeeksInYear(i);
    }
    return 53;
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    int i = paramReadablePartial.size();
    for (int j = 0; j < i; j++)
      if (paramReadablePartial.getFieldType(j) == DateTimeFieldType.weekyear())
      {
        int k = paramArrayOfInt[j];
        return this.iChronology.getWeeksInYear(k);
      }
    return 53;
  }

  protected int getMaximumValueForSet(long paramLong, int paramInt)
  {
    int i = 52;
    if (paramInt > i)
      i = getMaximumValue(paramLong);
    return i;
  }

  public int getMinimumValue()
  {
    return 1;
  }

  public DurationField getRangeDurationField()
  {
    return this.iChronology.weekyears();
  }

  public long remainder(long paramLong)
  {
    return super.remainder(259200000L + paramLong);
  }

  public long roundCeiling(long paramLong)
  {
    return super.roundCeiling(paramLong + 259200000L) - 259200000L;
  }

  public long roundFloor(long paramLong)
  {
    return super.roundFloor(paramLong + 259200000L) - 259200000L;
  }
}