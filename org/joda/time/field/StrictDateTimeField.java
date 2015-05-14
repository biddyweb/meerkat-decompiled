package org.joda.time.field;

import org.joda.time.DateTimeField;

public class StrictDateTimeField extends DelegatedDateTimeField
{
  private static final long serialVersionUID = 3154803964207950910L;

  protected StrictDateTimeField(DateTimeField paramDateTimeField)
  {
    super(paramDateTimeField);
  }

  public static DateTimeField getInstance(DateTimeField paramDateTimeField)
  {
    if (paramDateTimeField == null)
      paramDateTimeField = null;
    do
    {
      return paramDateTimeField;
      if ((paramDateTimeField instanceof LenientDateTimeField))
        paramDateTimeField = ((LenientDateTimeField)paramDateTimeField).getWrappedField();
    }
    while (!paramDateTimeField.isLenient());
    return new StrictDateTimeField(paramDateTimeField);
  }

  public final boolean isLenient()
  {
    return false;
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, getMinimumValue(paramLong), getMaximumValue(paramLong));
    return super.set(paramLong, paramInt);
  }
}