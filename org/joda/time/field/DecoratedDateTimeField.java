package org.joda.time.field;

import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;

public abstract class DecoratedDateTimeField extends BaseDateTimeField
{
  private static final long serialVersionUID = 203115783733757597L;
  private final DateTimeField iField;

  protected DecoratedDateTimeField(DateTimeField paramDateTimeField, DateTimeFieldType paramDateTimeFieldType)
  {
    super(paramDateTimeFieldType);
    if (paramDateTimeField == null)
      throw new IllegalArgumentException("The field must not be null");
    if (!paramDateTimeField.isSupported())
      throw new IllegalArgumentException("The field must be supported");
    this.iField = paramDateTimeField;
  }

  public int get(long paramLong)
  {
    return this.iField.get(paramLong);
  }

  public DurationField getDurationField()
  {
    return this.iField.getDurationField();
  }

  public int getMaximumValue()
  {
    return this.iField.getMaximumValue();
  }

  public int getMinimumValue()
  {
    return this.iField.getMinimumValue();
  }

  public DurationField getRangeDurationField()
  {
    return this.iField.getRangeDurationField();
  }

  public final DateTimeField getWrappedField()
  {
    return this.iField;
  }

  public boolean isLenient()
  {
    return this.iField.isLenient();
  }

  public long roundFloor(long paramLong)
  {
    return this.iField.roundFloor(paramLong);
  }

  public long set(long paramLong, int paramInt)
  {
    return this.iField.set(paramLong, paramInt);
  }
}