package org.joda.time.base;

import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DurationFieldType;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadablePartial;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormatter;

public abstract class AbstractPartial
  implements ReadablePartial, Comparable<ReadablePartial>
{
  public int compareTo(ReadablePartial paramReadablePartial)
  {
    if (this == paramReadablePartial);
    while (true)
    {
      return 0;
      if (size() != paramReadablePartial.size())
        throw new ClassCastException("ReadablePartial objects must have matching field types");
      int i = size();
      for (int j = 0; j < i; j++)
        if (getFieldType(j) != paramReadablePartial.getFieldType(j))
          throw new ClassCastException("ReadablePartial objects must have matching field types");
      int k = size();
      for (int m = 0; m < k; m++)
      {
        if (getValue(m) > paramReadablePartial.getValue(m))
          return 1;
        if (getValue(m) < paramReadablePartial.getValue(m))
          return -1;
      }
    }
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (this == paramObject)
      bool2 = true;
    ReadablePartial localReadablePartial;
    int i;
    int j;
    do
    {
      boolean bool1;
      do
      {
        return bool2;
        bool1 = paramObject instanceof ReadablePartial;
        bool2 = false;
      }
      while (!bool1);
      localReadablePartial = (ReadablePartial)paramObject;
      i = size();
      j = localReadablePartial.size();
      bool2 = false;
    }
    while (i != j);
    int k = size();
    for (int m = 0; ; m++)
    {
      if (m >= k)
        break label128;
      int n = getValue(m);
      int i1 = localReadablePartial.getValue(m);
      bool2 = false;
      if (n != i1)
        break;
      DateTimeFieldType localDateTimeFieldType1 = getFieldType(m);
      DateTimeFieldType localDateTimeFieldType2 = localReadablePartial.getFieldType(m);
      bool2 = false;
      if (localDateTimeFieldType1 != localDateTimeFieldType2)
        break;
    }
    label128: return FieldUtils.equals(getChronology(), localReadablePartial.getChronology());
  }

  public int get(DateTimeFieldType paramDateTimeFieldType)
  {
    return getValue(indexOfSupported(paramDateTimeFieldType));
  }

  public DateTimeField getField(int paramInt)
  {
    return getField(paramInt, getChronology());
  }

  protected abstract DateTimeField getField(int paramInt, Chronology paramChronology);

  public DateTimeFieldType getFieldType(int paramInt)
  {
    return getField(paramInt, getChronology()).getType();
  }

  public DateTimeFieldType[] getFieldTypes()
  {
    DateTimeFieldType[] arrayOfDateTimeFieldType = new DateTimeFieldType[size()];
    for (int i = 0; i < arrayOfDateTimeFieldType.length; i++)
      arrayOfDateTimeFieldType[i] = getFieldType(i);
    return arrayOfDateTimeFieldType;
  }

  public DateTimeField[] getFields()
  {
    DateTimeField[] arrayOfDateTimeField = new DateTimeField[size()];
    for (int i = 0; i < arrayOfDateTimeField.length; i++)
      arrayOfDateTimeField[i] = getField(i);
    return arrayOfDateTimeField;
  }

  public int[] getValues()
  {
    int[] arrayOfInt = new int[size()];
    for (int i = 0; i < arrayOfInt.length; i++)
      arrayOfInt[i] = getValue(i);
    return arrayOfInt;
  }

  public int hashCode()
  {
    int i = 157;
    int j = 0;
    int k = size();
    while (j < k)
    {
      i = 23 * (i * 23 + getValue(j)) + getFieldType(j).hashCode();
      j++;
    }
    return i + getChronology().hashCode();
  }

  public int indexOf(DateTimeFieldType paramDateTimeFieldType)
  {
    int i = 0;
    int j = size();
    while (i < j)
    {
      if (getFieldType(i) == paramDateTimeFieldType)
        return i;
      i++;
    }
    return -1;
  }

  protected int indexOf(DurationFieldType paramDurationFieldType)
  {
    int i = 0;
    int j = size();
    while (i < j)
    {
      if (getFieldType(i).getDurationType() == paramDurationFieldType)
        return i;
      i++;
    }
    return -1;
  }

  protected int indexOfSupported(DateTimeFieldType paramDateTimeFieldType)
  {
    int i = indexOf(paramDateTimeFieldType);
    if (i == -1)
      throw new IllegalArgumentException("Field '" + paramDateTimeFieldType + "' is not supported");
    return i;
  }

  protected int indexOfSupported(DurationFieldType paramDurationFieldType)
  {
    int i = indexOf(paramDurationFieldType);
    if (i == -1)
      throw new IllegalArgumentException("Field '" + paramDurationFieldType + "' is not supported");
    return i;
  }

  public boolean isAfter(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("Partial cannot be null");
    return compareTo(paramReadablePartial) > 0;
  }

  public boolean isBefore(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("Partial cannot be null");
    return compareTo(paramReadablePartial) < 0;
  }

  public boolean isEqual(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("Partial cannot be null");
    return compareTo(paramReadablePartial) == 0;
  }

  public boolean isSupported(DateTimeFieldType paramDateTimeFieldType)
  {
    return indexOf(paramDateTimeFieldType) != -1;
  }

  public DateTime toDateTime(ReadableInstant paramReadableInstant)
  {
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    return new DateTime(localChronology.set(this, DateTimeUtils.getInstantMillis(paramReadableInstant)), localChronology);
  }

  public String toString(DateTimeFormatter paramDateTimeFormatter)
  {
    if (paramDateTimeFormatter == null)
      return toString();
    return paramDateTimeFormatter.print(this);
  }
}