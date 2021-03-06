package org.joda.time.field;

import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

public class DecoratedDurationField extends BaseDurationField
{
  private static final long serialVersionUID = 8019982251647420015L;
  private final DurationField iField;

  public DecoratedDurationField(DurationField paramDurationField, DurationFieldType paramDurationFieldType)
  {
    super(paramDurationFieldType);
    if (paramDurationField == null)
      throw new IllegalArgumentException("The field must not be null");
    if (!paramDurationField.isSupported())
      throw new IllegalArgumentException("The field must be supported");
    this.iField = paramDurationField;
  }

  public long add(long paramLong, int paramInt)
  {
    return this.iField.add(paramLong, paramInt);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return this.iField.add(paramLong1, paramLong2);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return this.iField.getDifferenceAsLong(paramLong1, paramLong2);
  }

  public long getMillis(int paramInt, long paramLong)
  {
    return this.iField.getMillis(paramInt, paramLong);
  }

  public long getMillis(long paramLong1, long paramLong2)
  {
    return this.iField.getMillis(paramLong1, paramLong2);
  }

  public long getUnitMillis()
  {
    return this.iField.getUnitMillis();
  }

  public long getValueAsLong(long paramLong1, long paramLong2)
  {
    return this.iField.getValueAsLong(paramLong1, paramLong2);
  }

  public final DurationField getWrappedField()
  {
    return this.iField;
  }

  public boolean isPrecise()
  {
    return this.iField.isPrecise();
  }
}