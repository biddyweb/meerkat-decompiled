package org.joda.time.field;

import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;

public class OffsetDateTimeField extends DecoratedDateTimeField
{
  private static final long serialVersionUID = 3145790132623583142L;
  private final int iMax;
  private final int iMin;
  private final int iOffset;

  public OffsetDateTimeField(DateTimeField paramDateTimeField, int paramInt)
  {
  }

  public OffsetDateTimeField(DateTimeField paramDateTimeField, DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    this(paramDateTimeField, paramDateTimeFieldType, paramInt, -2147483648, 2147483647);
  }

  public OffsetDateTimeField(DateTimeField paramDateTimeField, DateTimeFieldType paramDateTimeFieldType, int paramInt1, int paramInt2, int paramInt3)
  {
    super(paramDateTimeField, paramDateTimeFieldType);
    if (paramInt1 == 0)
      throw new IllegalArgumentException("The offset cannot be zero");
    this.iOffset = paramInt1;
    if (paramInt2 < paramInt1 + paramDateTimeField.getMinimumValue());
    for (this.iMin = (paramInt1 + paramDateTimeField.getMinimumValue()); paramInt3 > paramInt1 + paramDateTimeField.getMaximumValue(); this.iMin = paramInt2)
    {
      this.iMax = (paramInt1 + paramDateTimeField.getMaximumValue());
      return;
    }
    this.iMax = paramInt3;
  }

  public long add(long paramLong, int paramInt)
  {
    long l = super.add(paramLong, paramInt);
    FieldUtils.verifyValueBounds(this, get(l), this.iMin, this.iMax);
    return l;
  }

  public long add(long paramLong1, long paramLong2)
  {
    long l = super.add(paramLong1, paramLong2);
    FieldUtils.verifyValueBounds(this, get(l), this.iMin, this.iMax);
    return l;
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return set(paramLong, FieldUtils.getWrappedValue(get(paramLong), paramInt, this.iMin, this.iMax));
  }

  public int get(long paramLong)
  {
    return super.get(paramLong) + this.iOffset;
  }

  public int getLeapAmount(long paramLong)
  {
    return getWrappedField().getLeapAmount(paramLong);
  }

  public DurationField getLeapDurationField()
  {
    return getWrappedField().getLeapDurationField();
  }

  public int getMaximumValue()
  {
    return this.iMax;
  }

  public int getMinimumValue()
  {
    return this.iMin;
  }

  public int getOffset()
  {
    return this.iOffset;
  }

  public boolean isLeap(long paramLong)
  {
    return getWrappedField().isLeap(paramLong);
  }

  public long remainder(long paramLong)
  {
    return getWrappedField().remainder(paramLong);
  }

  public long roundCeiling(long paramLong)
  {
    return getWrappedField().roundCeiling(paramLong);
  }

  public long roundFloor(long paramLong)
  {
    return getWrappedField().roundFloor(paramLong);
  }

  public long roundHalfCeiling(long paramLong)
  {
    return getWrappedField().roundHalfCeiling(paramLong);
  }

  public long roundHalfEven(long paramLong)
  {
    return getWrappedField().roundHalfEven(paramLong);
  }

  public long roundHalfFloor(long paramLong)
  {
    return getWrappedField().roundHalfFloor(paramLong);
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, this.iMin, this.iMax);
    return super.set(paramLong, paramInt - this.iOffset);
  }
}