package org.joda.time.field;

import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeZone;

public class LenientDateTimeField extends DelegatedDateTimeField
{
  private static final long serialVersionUID = 8714085824173290599L;
  private final Chronology iBase;

  protected LenientDateTimeField(DateTimeField paramDateTimeField, Chronology paramChronology)
  {
    super(paramDateTimeField);
    this.iBase = paramChronology;
  }

  public static DateTimeField getInstance(DateTimeField paramDateTimeField, Chronology paramChronology)
  {
    if (paramDateTimeField == null)
      paramDateTimeField = null;
    do
    {
      return paramDateTimeField;
      if ((paramDateTimeField instanceof StrictDateTimeField))
        paramDateTimeField = ((StrictDateTimeField)paramDateTimeField).getWrappedField();
    }
    while (paramDateTimeField.isLenient());
    return new LenientDateTimeField(paramDateTimeField, paramChronology);
  }

  public final boolean isLenient()
  {
    return true;
  }

  public long set(long paramLong, int paramInt)
  {
    long l1 = this.iBase.getZone().convertUTCToLocal(paramLong);
    long l2 = FieldUtils.safeSubtract(paramInt, get(paramLong));
    long l3 = getType().getField(this.iBase.withUTC()).add(l1, l2);
    return this.iBase.getZone().convertLocalToUTC(l3, false, paramLong);
  }
}