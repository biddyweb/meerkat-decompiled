package org.joda.time.chrono;

import java.util.Locale;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;
import org.joda.time.field.BaseDateTimeField;
import org.joda.time.field.FieldUtils;
import org.joda.time.field.UnsupportedDurationField;

final class GJEraDateTimeField extends BaseDateTimeField
{
  private static final long serialVersionUID = 4240986525305515528L;
  private final BasicChronology iChronology;

  GJEraDateTimeField(BasicChronology paramBasicChronology)
  {
    super(DateTimeFieldType.era());
    this.iChronology = paramBasicChronology;
  }

  private Object readResolve()
  {
    return this.iChronology.era();
  }

  public int get(long paramLong)
  {
    if (this.iChronology.getYear(paramLong) <= 0)
      return 0;
    return 1;
  }

  public String getAsText(int paramInt, Locale paramLocale)
  {
    return GJLocaleSymbols.forLocale(paramLocale).eraValueToText(paramInt);
  }

  public DurationField getDurationField()
  {
    return UnsupportedDurationField.getInstance(DurationFieldType.eras());
  }

  public int getMaximumTextLength(Locale paramLocale)
  {
    return GJLocaleSymbols.forLocale(paramLocale).getEraMaxTextLength();
  }

  public int getMaximumValue()
  {
    return 1;
  }

  public int getMinimumValue()
  {
    return 0;
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
    if (get(paramLong) == 0)
      return this.iChronology.setYear(0L, 1);
    return 9223372036854775807L;
  }

  public long roundFloor(long paramLong)
  {
    if (get(paramLong) == 1)
      return this.iChronology.setYear(0L, 1);
    return -9223372036854775808L;
  }

  public long roundHalfCeiling(long paramLong)
  {
    return roundFloor(paramLong);
  }

  public long roundHalfEven(long paramLong)
  {
    return roundFloor(paramLong);
  }

  public long roundHalfFloor(long paramLong)
  {
    return roundFloor(paramLong);
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, 0, 1);
    if (get(paramLong) != paramInt)
    {
      int i = this.iChronology.getYear(paramLong);
      paramLong = this.iChronology.setYear(paramLong, -i);
    }
    return paramLong;
  }

  public long set(long paramLong, String paramString, Locale paramLocale)
  {
    return set(paramLong, GJLocaleSymbols.forLocale(paramLocale).eraTextToValue(paramString));
  }
}