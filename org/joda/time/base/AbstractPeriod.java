package org.joda.time.base;

import org.joda.convert.ToString;
import org.joda.time.DurationFieldType;
import org.joda.time.MutablePeriod;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.joda.time.ReadablePeriod;
import org.joda.time.format.ISOPeriodFormat;
import org.joda.time.format.PeriodFormatter;

public abstract class AbstractPeriod
  implements ReadablePeriod
{
  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    while (true)
    {
      return true;
      if (!(paramObject instanceof ReadablePeriod))
        return false;
      ReadablePeriod localReadablePeriod = (ReadablePeriod)paramObject;
      if (size() != localReadablePeriod.size())
        return false;
      int i = size();
      for (int j = 0; j < i; j++)
        if ((getValue(j) != localReadablePeriod.getValue(j)) || (getFieldType(j) != localReadablePeriod.getFieldType(j)))
          return false;
    }
  }

  public int get(DurationFieldType paramDurationFieldType)
  {
    int i = indexOf(paramDurationFieldType);
    if (i == -1)
      return 0;
    return getValue(i);
  }

  public DurationFieldType getFieldType(int paramInt)
  {
    return getPeriodType().getFieldType(paramInt);
  }

  public DurationFieldType[] getFieldTypes()
  {
    DurationFieldType[] arrayOfDurationFieldType = new DurationFieldType[size()];
    for (int i = 0; i < arrayOfDurationFieldType.length; i++)
      arrayOfDurationFieldType[i] = getFieldType(i);
    return arrayOfDurationFieldType;
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
    int i = 17;
    int j = 0;
    int k = size();
    while (j < k)
    {
      i = 27 * (i * 27 + getValue(j)) + getFieldType(j).hashCode();
      j++;
    }
    return i;
  }

  public int indexOf(DurationFieldType paramDurationFieldType)
  {
    return getPeriodType().indexOf(paramDurationFieldType);
  }

  public boolean isSupported(DurationFieldType paramDurationFieldType)
  {
    return getPeriodType().isSupported(paramDurationFieldType);
  }

  public int size()
  {
    return getPeriodType().size();
  }

  public MutablePeriod toMutablePeriod()
  {
    return new MutablePeriod(this);
  }

  public Period toPeriod()
  {
    return new Period(this);
  }

  @ToString
  public String toString()
  {
    return ISOPeriodFormat.standard().print(this);
  }

  public String toString(PeriodFormatter paramPeriodFormatter)
  {
    if (paramPeriodFormatter == null)
      return toString();
    return paramPeriodFormatter.print(this);
  }
}