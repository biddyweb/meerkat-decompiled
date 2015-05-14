package org.joda.time.chrono;

import java.util.Locale;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.field.BaseDateTimeField;
import org.joda.time.field.FieldUtils;
import org.joda.time.field.UnsupportedDurationField;

final class BasicSingleEraDateTimeField extends BaseDateTimeField
{
  private static final int ERA_VALUE = 1;
  private final String iEraText;

  BasicSingleEraDateTimeField(String paramString)
  {
    super(DateTimeFieldType.era());
    this.iEraText = paramString;
  }

  public int get(long paramLong)
  {
    return 1;
  }

  public String getAsText(int paramInt, Locale paramLocale)
  {
    return this.iEraText;
  }

  public DurationField getDurationField()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.eras());
  }

  public int getMaximumTextLength(Locale paramLocale)
  {
    return this.iEraText.length();
  }

  public int getMaximumValue()
  {
    return 1;
  }

  public int getMinimumValue()
  {
    return 1;
  }

  public DurationField getRangeDurationField()
  {
    return null;
  }

  public boolean isLenient()
  {
    return false;
  }

  public long roundCeiling(long paramLong)
  {
    return 9223372036854775807L;
  }

  public long roundFloor(long paramLong)
  {
    return -9223372036854775808L;
  }

  public long roundHalfCeiling(long paramLong)
  {
    return -9223372036854775808L;
  }

  public long roundHalfEven(long paramLong)
  {
    return -9223372036854775808L;
  }

  public long roundHalfFloor(long paramLong)
  {
    return -9223372036854775808L;
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, 1, 1);
    return paramLong;
  }

  public long set(long paramLong, String paramString, Locale paramLocale)
  {
    if ((!this.iEraText.equals(paramString)) && (!"1".equals(paramString)))
      throw new IllegalFieldValueException(DateTimeFieldType.era(), paramString);
    return paramLong;
  }
}