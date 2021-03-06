package org.joda.time.field;

import java.io.Serializable;
import java.util.Locale;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;

public class DelegatedDateTimeField extends DateTimeField
  implements Serializable
{
  private static final long serialVersionUID = -4730164440214502503L;
  private final DateTimeField iField;
  private final DurationField iRangeDurationField;
  private final DateTimeFieldType iType;

  public DelegatedDateTimeField(DateTimeField paramDateTimeField)
  {
    this(paramDateTimeField, null);
  }

  public DelegatedDateTimeField(DateTimeField paramDateTimeField, DateTimeFieldType paramDateTimeFieldType)
  {
    this(paramDateTimeField, null, paramDateTimeFieldType);
  }

  public DelegatedDateTimeField(DateTimeField paramDateTimeField, DurationField paramDurationField, DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeField == null)
      throw new IllegalArgumentException("The field must not be null");
    this.iField = paramDateTimeField;
    this.iRangeDurationField = paramDurationField;
    if (paramDateTimeFieldType == null)
      paramDateTimeFieldType = paramDateTimeField.getType();
    this.iType = paramDateTimeFieldType;
  }

  public long add(long paramLong, int paramInt)
  {
    return this.iField.add(paramLong, paramInt);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return this.iField.add(paramLong1, paramLong2);
  }

  public int[] add(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return this.iField.add(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return this.iField.addWrapField(paramLong, paramInt);
  }

  public int[] addWrapField(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return this.iField.addWrapField(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
  }

  public int[] addWrapPartial(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return this.iField.addWrapPartial(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
  }

  public int get(long paramLong)
  {
    return this.iField.get(paramLong);
  }

  public String getAsShortText(int paramInt, Locale paramLocale)
  {
    return this.iField.getAsShortText(paramInt, paramLocale);
  }

  public String getAsShortText(long paramLong)
  {
    return this.iField.getAsShortText(paramLong);
  }

  public String getAsShortText(long paramLong, Locale paramLocale)
  {
    return this.iField.getAsShortText(paramLong, paramLocale);
  }

  public String getAsShortText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    return this.iField.getAsShortText(paramReadablePartial, paramInt, paramLocale);
  }

  public String getAsShortText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    return this.iField.getAsShortText(paramReadablePartial, paramLocale);
  }

  public String getAsText(int paramInt, Locale paramLocale)
  {
    return this.iField.getAsText(paramInt, paramLocale);
  }

  public String getAsText(long paramLong)
  {
    return this.iField.getAsText(paramLong);
  }

  public String getAsText(long paramLong, Locale paramLocale)
  {
    return this.iField.getAsText(paramLong, paramLocale);
  }

  public String getAsText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    return this.iField.getAsText(paramReadablePartial, paramInt, paramLocale);
  }

  public String getAsText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    return this.iField.getAsText(paramReadablePartial, paramLocale);
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return this.iField.getDifference(paramLong1, paramLong2);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return this.iField.getDifferenceAsLong(paramLong1, paramLong2);
  }

  public DurationField getDurationField()
  {
    return this.iField.getDurationField();
  }

  public int getLeapAmount(long paramLong)
  {
    return this.iField.getLeapAmount(paramLong);
  }

  public DurationField getLeapDurationField()
  {
    return this.iField.getLeapDurationField();
  }

  public int getMaximumShortTextLength(Locale paramLocale)
  {
    return this.iField.getMaximumShortTextLength(paramLocale);
  }

  public int getMaximumTextLength(Locale paramLocale)
  {
    return this.iField.getMaximumTextLength(paramLocale);
  }

  public int getMaximumValue()
  {
    return this.iField.getMaximumValue();
  }

  public int getMaximumValue(long paramLong)
  {
    return this.iField.getMaximumValue(paramLong);
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    return this.iField.getMaximumValue(paramReadablePartial);
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    return this.iField.getMaximumValue(paramReadablePartial, paramArrayOfInt);
  }

  public int getMinimumValue()
  {
    return this.iField.getMinimumValue();
  }

  public int getMinimumValue(long paramLong)
  {
    return this.iField.getMinimumValue(paramLong);
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial)
  {
    return this.iField.getMinimumValue(paramReadablePartial);
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    return this.iField.getMinimumValue(paramReadablePartial, paramArrayOfInt);
  }

  public String getName()
  {
    return this.iType.getName();
  }

  public DurationField getRangeDurationField()
  {
    if (this.iRangeDurationField != null)
      return this.iRangeDurationField;
    return this.iField.getRangeDurationField();
  }

  public DateTimeFieldType getType()
  {
    return this.iType;
  }

  public final DateTimeField getWrappedField()
  {
    return this.iField;
  }

  public boolean isLeap(long paramLong)
  {
    return this.iField.isLeap(paramLong);
  }

  public boolean isLenient()
  {
    return this.iField.isLenient();
  }

  public boolean isSupported()
  {
    return this.iField.isSupported();
  }

  public long remainder(long paramLong)
  {
    return this.iField.remainder(paramLong);
  }

  public long roundCeiling(long paramLong)
  {
    return this.iField.roundCeiling(paramLong);
  }

  public long roundFloor(long paramLong)
  {
    return this.iField.roundFloor(paramLong);
  }

  public long roundHalfCeiling(long paramLong)
  {
    return this.iField.roundHalfCeiling(paramLong);
  }

  public long roundHalfEven(long paramLong)
  {
    return this.iField.roundHalfEven(paramLong);
  }

  public long roundHalfFloor(long paramLong)
  {
    return this.iField.roundHalfFloor(paramLong);
  }

  public long set(long paramLong, int paramInt)
  {
    return this.iField.set(paramLong, paramInt);
  }

  public long set(long paramLong, String paramString)
  {
    return this.iField.set(paramLong, paramString);
  }

  public long set(long paramLong, String paramString, Locale paramLocale)
  {
    return this.iField.set(paramLong, paramString, paramLocale);
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return this.iField.set(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt, int[] paramArrayOfInt, String paramString, Locale paramLocale)
  {
    return this.iField.set(paramReadablePartial, paramInt, paramArrayOfInt, paramString, paramLocale);
  }

  public String toString()
  {
    return "DateTimeField[" + getName() + ']';
  }
}