package org.joda.time;

import java.io.Serializable;
import java.util.Comparator;
import org.joda.time.convert.ConverterManager;
import org.joda.time.convert.InstantConverter;

public class DateTimeComparator
  implements Comparator<Object>, Serializable
{
  private static final DateTimeComparator ALL_INSTANCE = new DateTimeComparator(null, null);
  private static final DateTimeComparator DATE_INSTANCE = new DateTimeComparator(DateTimeFieldType.dayOfYear(), null);
  private static final DateTimeComparator TIME_INSTANCE = new DateTimeComparator(null, DateTimeFieldType.dayOfYear());
  private static final long serialVersionUID = -6097339773320178364L;
  private final DateTimeFieldType iLowerLimit;
  private final DateTimeFieldType iUpperLimit;

  protected DateTimeComparator(DateTimeFieldType paramDateTimeFieldType1, DateTimeFieldType paramDateTimeFieldType2)
  {
    this.iLowerLimit = paramDateTimeFieldType1;
    this.iUpperLimit = paramDateTimeFieldType2;
  }

  public static DateTimeComparator getDateOnlyInstance()
  {
    return DATE_INSTANCE;
  }

  public static DateTimeComparator getInstance()
  {
    return ALL_INSTANCE;
  }

  public static DateTimeComparator getInstance(DateTimeFieldType paramDateTimeFieldType)
  {
    return getInstance(paramDateTimeFieldType, null);
  }

  public static DateTimeComparator getInstance(DateTimeFieldType paramDateTimeFieldType1, DateTimeFieldType paramDateTimeFieldType2)
  {
    if ((paramDateTimeFieldType1 == null) && (paramDateTimeFieldType2 == null))
      return ALL_INSTANCE;
    if ((paramDateTimeFieldType1 == DateTimeFieldType.dayOfYear()) && (paramDateTimeFieldType2 == null))
      return DATE_INSTANCE;
    if ((paramDateTimeFieldType1 == null) && (paramDateTimeFieldType2 == DateTimeFieldType.dayOfYear()))
      return TIME_INSTANCE;
    return new DateTimeComparator(paramDateTimeFieldType1, paramDateTimeFieldType2);
  }

  public static DateTimeComparator getTimeOnlyInstance()
  {
    return TIME_INSTANCE;
  }

  private Object readResolve()
  {
    return getInstance(this.iLowerLimit, this.iUpperLimit);
  }

  public int compare(Object paramObject1, Object paramObject2)
  {
    InstantConverter localInstantConverter1 = ConverterManager.getInstance().getInstantConverter(paramObject1);
    Chronology localChronology1 = localInstantConverter1.getChronology(paramObject1, (Chronology)null);
    long l1 = localInstantConverter1.getInstantMillis(paramObject1, localChronology1);
    InstantConverter localInstantConverter2 = ConverterManager.getInstance().getInstantConverter(paramObject2);
    Chronology localChronology2 = localInstantConverter2.getChronology(paramObject2, (Chronology)null);
    long l2 = localInstantConverter2.getInstantMillis(paramObject2, localChronology2);
    if (this.iLowerLimit != null)
    {
      l1 = this.iLowerLimit.getField(localChronology1).roundFloor(l1);
      l2 = this.iLowerLimit.getField(localChronology2).roundFloor(l2);
    }
    if (this.iUpperLimit != null)
    {
      l1 = this.iUpperLimit.getField(localChronology1).remainder(l1);
      l2 = this.iUpperLimit.getField(localChronology2).remainder(l2);
    }
    if (l1 < l2)
      return -1;
    if (l1 > l2)
      return 1;
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = paramObject instanceof DateTimeComparator;
    boolean bool2 = false;
    if (bool1)
    {
      DateTimeComparator localDateTimeComparator = (DateTimeComparator)paramObject;
      if (this.iLowerLimit != localDateTimeComparator.getLowerLimit())
      {
        DateTimeFieldType localDateTimeFieldType2 = this.iLowerLimit;
        bool2 = false;
        if (localDateTimeFieldType2 != null)
        {
          boolean bool4 = this.iLowerLimit.equals(localDateTimeComparator.getLowerLimit());
          bool2 = false;
          if (!bool4);
        }
      }
      else if (this.iUpperLimit != localDateTimeComparator.getUpperLimit())
      {
        DateTimeFieldType localDateTimeFieldType1 = this.iUpperLimit;
        bool2 = false;
        if (localDateTimeFieldType1 != null)
        {
          boolean bool3 = this.iUpperLimit.equals(localDateTimeComparator.getUpperLimit());
          bool2 = false;
          if (!bool3);
        }
      }
      else
      {
        bool2 = true;
      }
    }
    return bool2;
  }

  public DateTimeFieldType getLowerLimit()
  {
    return this.iLowerLimit;
  }

  public DateTimeFieldType getUpperLimit()
  {
    return this.iUpperLimit;
  }

  public int hashCode()
  {
    int i;
    int j;
    if (this.iLowerLimit == null)
    {
      i = 0;
      DateTimeFieldType localDateTimeFieldType = this.iUpperLimit;
      j = 0;
      if (localDateTimeFieldType != null)
        break label38;
    }
    while (true)
    {
      return i + j * 123;
      i = this.iLowerLimit.hashCode();
      break;
      label38: j = this.iUpperLimit.hashCode();
    }
  }

  public String toString()
  {
    if (this.iLowerLimit == this.iUpperLimit)
    {
      StringBuilder localStringBuilder3 = new StringBuilder().append("DateTimeComparator[");
      if (this.iLowerLimit == null);
      for (String str3 = ""; ; str3 = this.iLowerLimit.getName())
        return str3 + "]";
    }
    StringBuilder localStringBuilder1 = new StringBuilder().append("DateTimeComparator[");
    String str1;
    StringBuilder localStringBuilder2;
    if (this.iLowerLimit == null)
    {
      str1 = "";
      localStringBuilder2 = localStringBuilder1.append(str1).append("-");
      if (this.iUpperLimit != null)
        break label135;
    }
    label135: for (String str2 = ""; ; str2 = this.iUpperLimit.getName())
    {
      return str2 + "]";
      str1 = this.iLowerLimit.getName();
      break;
    }
  }
}