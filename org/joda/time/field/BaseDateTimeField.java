package org.joda.time.field;

import java.util.Locale;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.ReadablePartial;

public abstract class BaseDateTimeField extends DateTimeField
{
  private final DateTimeFieldType iType;

  protected BaseDateTimeField(DateTimeFieldType paramDateTimeFieldType)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The type must not be null");
    this.iType = paramDateTimeFieldType;
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
    if (paramInt2 == 0)
      return paramArrayOfInt;
    DateTimeField localDateTimeField = null;
    int i = paramInt2;
    int[] arrayOfInt = paramArrayOfInt;
    int k;
    if (i > 0)
    {
      k = getMaximumValue(paramReadablePartial, arrayOfInt);
      long l2 = i + arrayOfInt[paramInt1];
      if (l2 > k)
        break label110;
      arrayOfInt[paramInt1] = ((int)l2);
    }
    while (true)
    {
      int j;
      if (i < 0)
      {
        j = getMinimumValue(paramReadablePartial, arrayOfInt);
        long l1 = i + arrayOfInt[paramInt1];
        if (l1 >= j)
          arrayOfInt[paramInt1] = ((int)l1);
      }
      else
      {
        return set(paramReadablePartial, paramInt1, arrayOfInt, arrayOfInt[paramInt1]);
        label110: if (localDateTimeField == null)
        {
          if (paramInt1 == 0)
            throw new IllegalArgumentException("Maximum value exceeded for add");
          localDateTimeField = paramReadablePartial.getField(paramInt1 - 1);
          if (getRangeDurationField().getType() != localDateTimeField.getDurationField().getType())
            throw new IllegalArgumentException("Fields invalid for add");
        }
        i -= k + 1 - arrayOfInt[paramInt1];
        arrayOfInt = localDateTimeField.add(paramReadablePartial, paramInt1 - 1, arrayOfInt, 1);
        arrayOfInt[paramInt1] = getMinimumValue(paramReadablePartial, arrayOfInt);
        break;
      }
      if (localDateTimeField == null)
      {
        if (paramInt1 == 0)
          throw new IllegalArgumentException("Maximum value exceeded for add");
        localDateTimeField = paramReadablePartial.getField(paramInt1 - 1);
        if (getRangeDurationField().getType() != localDateTimeField.getDurationField().getType())
          throw new IllegalArgumentException("Fields invalid for add");
      }
      i -= j - 1 - arrayOfInt[paramInt1];
      arrayOfInt = localDateTimeField.add(paramReadablePartial, paramInt1 - 1, arrayOfInt, -1);
      arrayOfInt[paramInt1] = getMaximumValue(paramReadablePartial, arrayOfInt);
    }
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return set(paramLong, FieldUtils.getWrappedValue(get(paramLong), paramInt, getMinimumValue(paramLong), getMaximumValue(paramLong)));
  }

  public int[] addWrapField(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    return set(paramReadablePartial, paramInt1, paramArrayOfInt, FieldUtils.getWrappedValue(paramArrayOfInt[paramInt1], paramInt2, getMinimumValue(paramReadablePartial), getMaximumValue(paramReadablePartial)));
  }

  public int[] addWrapPartial(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    if (paramInt2 == 0)
      return paramArrayOfInt;
    DateTimeField localDateTimeField = null;
    int i = paramInt2;
    int[] arrayOfInt = paramArrayOfInt;
    int k;
    if (i > 0)
    {
      k = getMaximumValue(paramReadablePartial, arrayOfInt);
      long l2 = i + arrayOfInt[paramInt1];
      if (l2 > k)
        break label110;
      arrayOfInt[paramInt1] = ((int)l2);
    }
    while (true)
    {
      int j;
      if (i < 0)
      {
        j = getMinimumValue(paramReadablePartial, arrayOfInt);
        long l1 = i + arrayOfInt[paramInt1];
        if (l1 >= j)
          arrayOfInt[paramInt1] = ((int)l1);
      }
      else
      {
        return set(paramReadablePartial, paramInt1, arrayOfInt, arrayOfInt[paramInt1]);
        label110: if (localDateTimeField == null)
        {
          if (paramInt1 == 0)
          {
            i -= k + 1 - arrayOfInt[paramInt1];
            arrayOfInt[paramInt1] = getMinimumValue(paramReadablePartial, arrayOfInt);
            break;
          }
          localDateTimeField = paramReadablePartial.getField(paramInt1 - 1);
          if (getRangeDurationField().getType() != localDateTimeField.getDurationField().getType())
            throw new IllegalArgumentException("Fields invalid for add");
        }
        i -= k + 1 - arrayOfInt[paramInt1];
        arrayOfInt = localDateTimeField.addWrapPartial(paramReadablePartial, paramInt1 - 1, arrayOfInt, 1);
        arrayOfInt[paramInt1] = getMinimumValue(paramReadablePartial, arrayOfInt);
        break;
      }
      if (localDateTimeField == null)
      {
        if (paramInt1 == 0)
        {
          i -= j - 1 - arrayOfInt[paramInt1];
          arrayOfInt[paramInt1] = getMaximumValue(paramReadablePartial, arrayOfInt);
        }
        else
        {
          localDateTimeField = paramReadablePartial.getField(paramInt1 - 1);
          if (getRangeDurationField().getType() != localDateTimeField.getDurationField().getType())
            throw new IllegalArgumentException("Fields invalid for add");
        }
      }
      else
      {
        i -= j - 1 - arrayOfInt[paramInt1];
        arrayOfInt = localDateTimeField.addWrapPartial(paramReadablePartial, paramInt1 - 1, arrayOfInt, -1);
        arrayOfInt[paramInt1] = getMaximumValue(paramReadablePartial, arrayOfInt);
      }
    }
  }

  protected int convertText(String paramString, Locale paramLocale)
  {
    try
    {
      int i = Integer.parseInt(paramString);
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    throw new IllegalFieldValueException(getType(), paramString);
  }

  public abstract int get(long paramLong);

  public String getAsShortText(int paramInt, Locale paramLocale)
  {
    return getAsText(paramInt, paramLocale);
  }

  public final String getAsShortText(long paramLong)
  {
    return getAsShortText(paramLong, null);
  }

  public String getAsShortText(long paramLong, Locale paramLocale)
  {
    return getAsShortText(get(paramLong), paramLocale);
  }

  public String getAsShortText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    return getAsShortText(paramInt, paramLocale);
  }

  public final String getAsShortText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    return getAsShortText(paramReadablePartial, paramReadablePartial.get(getType()), paramLocale);
  }

  public String getAsText(int paramInt, Locale paramLocale)
  {
    return Integer.toString(paramInt);
  }

  public final String getAsText(long paramLong)
  {
    return getAsText(paramLong, null);
  }

  public String getAsText(long paramLong, Locale paramLocale)
  {
    return getAsText(get(paramLong), paramLocale);
  }

  public String getAsText(ReadablePartial paramReadablePartial, int paramInt, Locale paramLocale)
  {
    return getAsText(paramInt, paramLocale);
  }

  public final String getAsText(ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    return getAsText(paramReadablePartial, paramReadablePartial.get(getType()), paramLocale);
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return getDurationField().getDifference(paramLong1, paramLong2);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return getDurationField().getDifferenceAsLong(paramLong1, paramLong2);
  }

  public abstract DurationField getDurationField();

  public int getLeapAmount(long paramLong)
  {
    return 0;
  }

  public DurationField getLeapDurationField()
  {
    return null;
  }

  public int getMaximumShortTextLength(Locale paramLocale)
  {
    return getMaximumTextLength(paramLocale);
  }

  public int getMaximumTextLength(Locale paramLocale)
  {
    int i = getMaximumValue();
    if (i >= 0)
    {
      if (i < 10)
        return 1;
      if (i < 100)
        return 2;
      if (i < 1000)
        return 3;
    }
    return Integer.toString(i).length();
  }

  public abstract int getMaximumValue();

  public int getMaximumValue(long paramLong)
  {
    return getMaximumValue();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial)
  {
    return getMaximumValue();
  }

  public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    return getMaximumValue(paramReadablePartial);
  }

  public abstract int getMinimumValue();

  public int getMinimumValue(long paramLong)
  {
    return getMinimumValue();
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial)
  {
    return getMinimumValue();
  }

  public int getMinimumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
  {
    return getMinimumValue(paramReadablePartial);
  }

  public final String getName()
  {
    return this.iType.getName();
  }

  public abstract DurationField getRangeDurationField();

  public final DateTimeFieldType getType()
  {
    return this.iType;
  }

  public boolean isLeap(long paramLong)
  {
    return false;
  }

  public final boolean isSupported()
  {
    return true;
  }

  public long remainder(long paramLong)
  {
    return paramLong - roundFloor(paramLong);
  }

  public long roundCeiling(long paramLong)
  {
    long l = roundFloor(paramLong);
    if (l != paramLong)
      paramLong = add(l, 1);
    return paramLong;
  }

  public abstract long roundFloor(long paramLong);

  public long roundHalfCeiling(long paramLong)
  {
    long l1 = roundFloor(paramLong);
    long l2 = roundCeiling(paramLong);
    long l3 = paramLong - l1;
    if (l2 - paramLong <= l3)
      return l2;
    return l1;
  }

  public long roundHalfEven(long paramLong)
  {
    long l1 = roundFloor(paramLong);
    long l2 = roundCeiling(paramLong);
    long l3 = paramLong - l1;
    long l4 = l2 - paramLong;
    if (l3 < l4);
    do
    {
      return l1;
      if (l4 < l3)
        return l2;
    }
    while ((0x1 & get(l2)) != 0);
    return l2;
  }

  public long roundHalfFloor(long paramLong)
  {
    long l1 = roundFloor(paramLong);
    long l2 = roundCeiling(paramLong);
    if (paramLong - l1 <= l2 - paramLong)
      return l1;
    return l2;
  }

  public abstract long set(long paramLong, int paramInt);

  public final long set(long paramLong, String paramString)
  {
    return set(paramLong, paramString, null);
  }

  public long set(long paramLong, String paramString, Locale paramLocale)
  {
    return set(paramLong, convertText(paramString, paramLocale));
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    FieldUtils.verifyValueBounds(this, paramInt2, getMinimumValue(paramReadablePartial, paramArrayOfInt), getMaximumValue(paramReadablePartial, paramArrayOfInt));
    paramArrayOfInt[paramInt1] = paramInt2;
    for (int i = paramInt1 + 1; i < paramReadablePartial.size(); i++)
    {
      DateTimeField localDateTimeField = paramReadablePartial.getField(i);
      if (paramArrayOfInt[i] > localDateTimeField.getMaximumValue(paramReadablePartial, paramArrayOfInt))
        paramArrayOfInt[i] = localDateTimeField.getMaximumValue(paramReadablePartial, paramArrayOfInt);
      if (paramArrayOfInt[i] < localDateTimeField.getMinimumValue(paramReadablePartial, paramArrayOfInt))
        paramArrayOfInt[i] = localDateTimeField.getMinimumValue(paramReadablePartial, paramArrayOfInt);
    }
    return paramArrayOfInt;
  }

  public int[] set(ReadablePartial paramReadablePartial, int paramInt, int[] paramArrayOfInt, String paramString, Locale paramLocale)
  {
    return set(paramReadablePartial, paramInt, paramArrayOfInt, convertText(paramString, paramLocale));
  }

  public String toString()
  {
    return "DateTimeField[" + getName() + ']';
  }
}