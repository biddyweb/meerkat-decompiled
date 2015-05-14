package org.joda.time.field;

import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.IllegalFieldValueException;

public final class SkipDateTimeField extends DelegatedDateTimeField
{
  private static final long serialVersionUID = -8869148464118507846L;
  private final Chronology iChronology;
  private transient int iMinValue;
  private final int iSkip;

  public SkipDateTimeField(Chronology paramChronology, DateTimeField paramDateTimeField)
  {
    this(paramChronology, paramDateTimeField, 0);
  }

  public SkipDateTimeField(Chronology paramChronology, DateTimeField paramDateTimeField, int paramInt)
  {
    super(paramDateTimeField);
    this.iChronology = paramChronology;
    int i = super.getMinimumValue();
    if (i < paramInt)
      this.iMinValue = (i - 1);
    while (true)
    {
      this.iSkip = paramInt;
      return;
      if (i == paramInt)
        this.iMinValue = (paramInt + 1);
      else
        this.iMinValue = i;
    }
  }

  private Object readResolve()
  {
    return getType().getField(this.iChronology);
  }

  public int get(long paramLong)
  {
    int i = super.get(paramLong);
    if (i <= this.iSkip)
      i--;
    return i;
  }

  public int getMinimumValue()
  {
    return this.iMinValue;
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, this.iMinValue, getMaximumValue());
    if (paramInt <= this.iSkip)
    {
      if (paramInt == this.iSkip)
        throw new IllegalFieldValueException(DateTimeFieldType.year(), Integer.valueOf(paramInt), null, null);
      paramInt++;
    }
    return super.set(paramLong, paramInt);
  }
}