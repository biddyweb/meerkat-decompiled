package org.joda.time.field;

import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;

public class PreciseDateTimeField extends PreciseDurationDateTimeField
{
  private static final long serialVersionUID = -5586801265774496376L;
  private final int iRange;
  private final DurationField iRangeField;

  public PreciseDateTimeField(DateTimeFieldType paramDateTimeFieldType, DurationField paramDurationField1, DurationField paramDurationField2)
  {
    super(paramDateTimeFieldType, paramDurationField1);
    if (!paramDurationField2.isPrecise())
      throw new IllegalArgumentException("Range duration field must be precise");
    this.iRange = ((int)(paramDurationField2.getUnitMillis() / getUnitMillis()));
    if (this.iRange < 2)
      throw new IllegalArgumentException("The effective range must be at least 2");
    this.iRangeField = paramDurationField2;
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    int i = get(paramLong);
    return paramLong + (FieldUtils.getWrappedValue(i, paramInt, getMinimumValue(), getMaximumValue()) - i) * getUnitMillis();
  }

  public int get(long paramLong)
  {
    if (paramLong >= 0L)
      return (int)(paramLong / getUnitMillis() % this.iRange);
    return -1 + this.iRange + (int)((1L + paramLong) / getUnitMillis() % this.iRange);
  }

  public int getMaximumValue()
  {
    return -1 + this.iRange;
  }

  public int getRange()
  {
    return this.iRange;
  }

  public DurationField getRangeDurationField()
  {
    return this.iRangeField;
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, getMinimumValue(), getMaximumValue());
    return paramLong + (paramInt - get(paramLong)) * this.iUnitMillis;
  }
}