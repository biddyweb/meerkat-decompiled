package org.joda.time.field;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Locale;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;

public final class UnsupportedDateTimeField extends DateTimeField
  implements Serializable
{
  private static HashMap<DateTimeFieldType, UnsupportedDateTimeField> cCache;
  private static final long serialVersionUID = -1934618396111902255L;
  private final DurationField iDurationField;
  private final DateTimeFieldType iType;

  private UnsupportedDateTimeField(DateTimeFieldType paramDateTimeFieldType, DurationField paramDurationField)
  {
    if ((paramDateTimeFieldType == null) || (paramDurationField == null))
      throw new IllegalArgumentException();
    this.iType = paramDateTimeFieldType;
    this.iDurationField = paramDurationField;
  }

  public static UnsupportedDateTimeField getInstance(DateTimeFieldType paramDateTimeFieldType, DurationField paramDurationField)
  {
    try
    {
      UnsupportedDateTimeField localUnsupportedDateTimeField;
      if (cCache == null)
      {
        cCache = new HashMap(7);
        localUnsupportedDateTimeField = null;
      }
      while (true)
      {
        if (localUnsupportedDateTimeField == null)
        {
          localUnsupportedDateTimeField = new UnsupportedDateTimeField(paramDateTimeFieldType, paramDurationField);
          cCache.put(paramDateTimeFieldType, localUnsupportedDateTimeField);
        }
        return localUnsupportedDateTimeField;
        localUnsupportedDateTimeField = (UnsupportedDateTimeField)cCache.get(paramDateTimeFieldType);
        if (localUnsupportedDateTimeField != null)
        {
          DurationField localDurationField = localUnsupportedDateTimeField.getDurationField();
          if (localDurationField != paramDurationField)
            localUnsupportedDateTimeField = null;
        }
      }
    }
    finally
    {
    }
  }

  private Object readResolve()
  {
    return getInstance(this.iType, this.iDurationField);
  }

  private UnsupportedOperationException unsupported()
  {
    return new UnsupportedOperationException(this.iType + " field is unsupported");
  }

  public long add(long paramLong, int paramInt)
  {
    return getDurationField().add(paramLong, paramInt);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return getDurationField().add(paramLong1, paramLong2);
  }

  public int[] add(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    throw unsupported();
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    throw unsupported();
  }

  public int[] addWrapField(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    throw unsupported();
  }

  public int[] addWrapPartial(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    throw unsupported();
  }

  public int get(long paramLong)
  {
    throw unsupported();
  }

  public String getAsShortText(int paramInt, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsShortText(long paramLong)
  {
    throw unsupported();
  }

  public String getAsShortText(long paramLong, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsShortText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsShortText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsText(int paramInt, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsText(long paramLong)
  {
    throw unsupported();
  }

  public String getAsText(long paramLong, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    throw unsupported();
  }

  public String getAsText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    throw unsupported();
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return getDurationField().getDifference(paramLong1, paramLong2);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return getDurationField().getDifferenceAsLong(paramLong1, paramLong2);
  }

  public DurationField getDurationField()
  {
    return this.iDurationField;
  }

  public int getLeapAmount(long paramLong)
  {
    throw unsupported();
  }

  public DurationField getLeapDurationField()
  {
    return null;
  }

  public int getMaximumShortTextLength(Locale paramLocale)
  {
    throw unsupported();
  }

  public int getMaximumTextLength(Locale paramLocale)
  {
    throw unsupported();
  }

  public int getMaximumValue()
  {
    throw unsupported();
  }

  public int getMaximumValue(long paramLong)
  {
    throw unsupported();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    throw unsupported();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    throw unsupported();
  }

  public int getMinimumValue()
  {
    throw unsupported();
  }

  public int getMinimumValue(long paramLong)
  {
    throw unsupported();
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial)
  {
    throw unsupported();
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    throw unsupported();
  }

  public String getName()
  {
    return this.iType.getName();
  }

  public DurationField getRangeDurationField()
  {
    return null;
  }

  public DateTimeFieldType getType()
  {
    return this.iType;
  }

  public boolean isLeap(long paramLong)
  {
    throw unsupported();
  }

  public boolean isLenient()
  {
    return false;
  }

  public boolean isSupported()
  {
    return false;
  }

  public long remainder(long paramLong)
  {
    throw unsupported();
  }

  public long roundCeiling(long paramLong)
  {
    throw unsupported();
  }

  public long roundFloor(long paramLong)
  {
    throw unsupported();
  }

  public long roundHalfCeiling(long paramLong)
  {
    throw unsupported();
  }

  public long roundHalfEven(long paramLong)
  {
    throw unsupported();
  }

  public long roundHalfFloor(long paramLong)
  {
    throw unsupported();
  }

  public long set(long paramLong, int paramInt)
  {
    throw unsupported();
  }

  public long set(long paramLong, String paramString)
  {
    throw unsupported();
  }

  public long set(long paramLong, String paramString, Locale paramLocale)
  {
    throw unsupported();
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    throw unsupported();
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt, int[] paramArrayOfInt, String paramString, Locale paramLocale)
  {
    throw unsupported();
  }

  public String toString()
  {
    return "UnsupportedDateTimeField";
  }
}