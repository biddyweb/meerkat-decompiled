package org.joda.time.field;

import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;

public class DividedDateTimeField extends DecoratedDateTimeField
{
  private static final long serialVersionUID = 8318475124230605365L;
  final int iDivisor;
  final DurationField iDurationField;
  private final int iMax;
  private final int iMin;
  final DurationField iRangeDurationField;

  public DividedDateTimeField(DateTimeField paramDateTimeField, DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    this(paramDateTimeField, paramDateTimeField.getRangeDurationField(), paramDateTimeFieldType, paramInt);
  }

  public DividedDateTimeField(DateTimeField paramDateTimeField, DurationField paramDurationField, DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    super(paramDateTimeField, paramDateTimeFieldType);
    if (paramInt < 2)
      throw new IllegalArgumentException("The divisor must be at least 2");
    DurationField localDurationField = paramDateTimeField.getDurationField();
    int i;
    int j;
    label67: int k;
    if (localDurationField == null)
    {
      this.iDurationField = null;
      this.iRangeDurationField = paramDurationField;
      this.iDivisor = paramInt;
      i = paramDateTimeField.getMinimumValue();
      if (i < 0)
        break label120;
      j = i / paramInt;
      k = paramDateTimeField.getMaximumValue();
      if (k < 0)
        break label134;
    }
    label134: for (int m = k / paramInt; ; m = -1 + (k + 1) / paramInt)
    {
      this.iMin = j;
      this.iMax = m;
      return;
      this.iDurationField = new ScaledDurationField(localDurationField, paramDateTimeFieldType.getDurationType(), paramInt);
      break;
      label120: j = -1 + (i + 1) / paramInt;
      break label67;
    }
  }

  public DividedDateTimeField(RemainderDateTimeField paramRemainderDateTimeField, DateTimeFieldType paramDateTimeFieldType)
  {
    this(paramRemainderDateTimeField, null, paramDateTimeFieldType);
  }

  public DividedDateTimeField(RemainderDateTimeField paramRemainderDateTimeField, DurationField paramDurationField, DateTimeFieldType paramDateTimeFieldType)
  {
    super(paramRemainderDateTimeField.getWrappedField(), paramDateTimeFieldType);
    int i = paramRemainderDateTimeField.iDivisor;
    this.iDivisor = i;
    this.iDurationField = paramRemainderDateTimeField.iRangeField;
    this.iRangeDurationField = paramDurationField;
    DateTimeField localDateTimeField = getWrappedField();
    int j = localDateTimeField.getMinimumValue();
    int k;
    int m;
    if (j >= 0)
    {
      k = j / i;
      m = localDateTimeField.getMaximumValue();
      if (m < 0)
        break label105;
    }
    label105: for (int n = m / i; ; n = -1 + (m + 1) / i)
    {
      this.iMin = k;
      this.iMax = n;
      return;
      k = -1 + (j + 1) / i;
      break;
    }
  }

  private int getRemainder(int paramInt)
  {
    if (paramInt >= 0)
      return paramInt % this.iDivisor;
    return -1 + this.iDivisor + (paramInt + 1) % this.iDivisor;
  }

  public long add(long paramLong, int paramInt)
  {
    return getWrappedField().add(paramLong, paramInt * this.iDivisor);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return getWrappedField().add(paramLong1, paramLong2 * this.iDivisor);
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return set(paramLong, FieldUtils.getWrappedValue(get(paramLong), paramInt, this.iMin, this.iMax));
  }

  public int get(long paramLong)
  {
    int i = getWrappedField().get(paramLong);
    if (i >= 0)
      return i / this.iDivisor;
    return -1 + (i + 1) / this.iDivisor;
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return getWrappedField().getDifference(paramLong1, paramLong2) / this.iDivisor;
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return getWrappedField().getDifferenceAsLong(paramLong1, paramLong2) / this.iDivisor;
  }

  public int getDivisor()
  {
    return this.iDivisor;
  }

  public DurationField getDurationField()
  {
    return this.iDurationField;
  }

  public int getMaximumValue()
  {
    return this.iMax;
  }

  public int getMinimumValue()
  {
    return this.iMin;
  }

  public DurationField getRangeDurationField()
  {
    if (this.iRangeDurationField != null)
      return this.iRangeDurationField;
    return super.getRangeDurationField();
  }

  public long remainder(long paramLong)
  {
    return set(paramLong, get(getWrappedField().remainder(paramLong)));
  }

  public long roundFloor(long paramLong)
  {
    DateTimeField localDateTimeField = getWrappedField();
    return localDateTimeField.roundFloor(localDateTimeField.set(paramLong, get(paramLong) * this.iDivisor));
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, this.iMin, this.iMax);
    int i = getRemainder(getWrappedField().get(paramLong));
    return getWrappedField().set(paramLong, i + paramInt * this.iDivisor);
  }
}