package org.joda.time.field;

import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

public class ScaledDurationField extends DecoratedDurationField
{
  private static final long serialVersionUID = -3205227092378684157L;
  private final int iScalar;

  public ScaledDurationField(DurationField paramDurationField, DurationFieldType paramDurationFieldType, int paramInt)
  {
    super(paramDurationField, paramDurationFieldType);
    if ((paramInt == 0) || (paramInt == 1))
      throw new IllegalArgumentException("The scalar must not be 0 or 1");
    this.iScalar = paramInt;
  }

  public long add(long paramLong, int paramInt)
  {
    long l = paramInt * this.iScalar;
    return getWrappedField().add(paramLong, l);
  }

  public long add(long paramLong1, long paramLong2)
  {
    long l = FieldUtils.safeMultiply(paramLong2, this.iScalar);
    return getWrappedField().add(paramLong1, l);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ScaledDurationField localScaledDurationField;
    do
    {
      return true;
      if (!(paramObject instanceof ScaledDurationField))
        break;
      localScaledDurationField = (ScaledDurationField)paramObject;
    }
    while ((getWrappedField().equals(localScaledDurationField.getWrappedField())) && (getType() == localScaledDurationField.getType()) && (this.iScalar == localScaledDurationField.iScalar));
    return false;
    return false;
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return getWrappedField().getDifference(paramLong1, paramLong2) / this.iScalar;
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return getWrappedField().getDifferenceAsLong(paramLong1, paramLong2) / this.iScalar;
  }

  public long getMillis(int paramInt)
  {
    long l = paramInt * this.iScalar;
    return getWrappedField().getMillis(l);
  }

  public long getMillis(int paramInt, long paramLong)
  {
    long l = paramInt * this.iScalar;
    return getWrappedField().getMillis(l, paramLong);
  }

  public long getMillis(long paramLong)
  {
    long l = FieldUtils.safeMultiply(paramLong, this.iScalar);
    return getWrappedField().getMillis(l);
  }

  public long getMillis(long paramLong1, long paramLong2)
  {
    long l = FieldUtils.safeMultiply(paramLong1, this.iScalar);
    return getWrappedField().getMillis(l, paramLong2);
  }

  public int getScalar()
  {
    return this.iScalar;
  }

  public long getUnitMillis()
  {
    return getWrappedField().getUnitMillis() * this.iScalar;
  }

  public int getValue(long paramLong)
  {
    return getWrappedField().getValue(paramLong) / this.iScalar;
  }

  public int getValue(long paramLong1, long paramLong2)
  {
    return getWrappedField().getValue(paramLong1, paramLong2) / this.iScalar;
  }

  public long getValueAsLong(long paramLong)
  {
    return getWrappedField().getValueAsLong(paramLong) / this.iScalar;
  }

  public long getValueAsLong(long paramLong1, long paramLong2)
  {
    return getWrappedField().getValueAsLong(paramLong1, paramLong2) / this.iScalar;
  }

  public int hashCode()
  {
    long l = this.iScalar;
    return (int)(l ^ l >>> 32) + getType().hashCode() + getWrappedField().hashCode();
  }
}