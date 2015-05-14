package org.joda.time.field;

import org.joda.time.DurationFieldType;

public class PreciseDurationField extends BaseDurationField
{
  private static final long serialVersionUID = -8346152187724495365L;
  private final long iUnitMillis;

  public PreciseDurationField(DurationFieldType paramDurationFieldType, long paramLong)
  {
    super(paramDurationFieldType);
    this.iUnitMillis = paramLong;
  }

  public long add(long paramLong, int paramInt)
  {
    return FieldUtils.safeAdd(paramLong, paramInt * this.iUnitMillis);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return FieldUtils.safeAdd(paramLong1, FieldUtils.safeMultiply(paramLong2, this.iUnitMillis));
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    PreciseDurationField localPreciseDurationField;
    do
    {
      return true;
      if (!(paramObject instanceof PreciseDurationField))
        break;
      localPreciseDurationField = (PreciseDurationField)paramObject;
    }
    while ((getType() == localPreciseDurationField.getType()) && (this.iUnitMillis == localPreciseDurationField.iUnitMillis));
    return false;
    return false;
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return FieldUtils.safeSubtract(paramLong1, paramLong2) / this.iUnitMillis;
  }

  public long getMillis(int paramInt, long paramLong)
  {
    return paramInt * this.iUnitMillis;
  }

  public long getMillis(long paramLong1, long paramLong2)
  {
    return FieldUtils.safeMultiply(paramLong1, this.iUnitMillis);
  }

  public final long getUnitMillis()
  {
    return this.iUnitMillis;
  }

  public long getValueAsLong(long paramLong1, long paramLong2)
  {
    return paramLong1 / this.iUnitMillis;
  }

  public int hashCode()
  {
    long l = this.iUnitMillis;
    return (int)(l ^ l >>> 32) + getType().hashCode();
  }

  public final boolean isPrecise()
  {
    return true;
  }
}