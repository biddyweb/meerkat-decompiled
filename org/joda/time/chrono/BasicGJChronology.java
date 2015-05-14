package org.joda.time.chrono;

import org.joda.time.Chronology;
import org.joda.time.DateTimeField;

abstract class BasicGJChronology extends BasicChronology
{
  private static final long FEB_29 = 5097600000L;
  private static final int[] MAX_DAYS_PER_MONTH_ARRAY;
  private static final long[] MAX_TOTAL_MILLIS_BY_MONTH_ARRAY;
  private static final int[] MIN_DAYS_PER_MONTH_ARRAY;
  private static final long[] MIN_TOTAL_MILLIS_BY_MONTH_ARRAY;
  private static final long serialVersionUID = 538276888268L;

  static
  {
    long l1 = 0L;
    MIN_DAYS_PER_MONTH_ARRAY = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    MAX_DAYS_PER_MONTH_ARRAY = new int[] { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    MIN_TOTAL_MILLIS_BY_MONTH_ARRAY = new long[12];
    MAX_TOTAL_MILLIS_BY_MONTH_ARRAY = new long[12];
    int i = 0;
    long l2 = l1;
    while (i < 11)
    {
      l2 += 86400000L * MIN_DAYS_PER_MONTH_ARRAY[i];
      MIN_TOTAL_MILLIS_BY_MONTH_ARRAY[(i + 1)] = l2;
      l1 += 86400000L * MAX_DAYS_PER_MONTH_ARRAY[i];
      MAX_TOTAL_MILLIS_BY_MONTH_ARRAY[(i + 1)] = l1;
      i++;
    }
  }

  BasicGJChronology(Chronology paramChronology, Object paramObject, int paramInt)
  {
    super(paramChronology, paramObject, paramInt);
  }

  int getDaysInMonthMax(int paramInt)
  {
    return MAX_DAYS_PER_MONTH_ARRAY[(paramInt - 1)];
  }

  int getDaysInMonthMaxForSet(long paramLong, int paramInt)
  {
    int i = 28;
    if ((paramInt > i) || (paramInt < 1))
      i = getDaysInMonthMax(paramLong);
    return i;
  }

  int getDaysInYearMonth(int paramInt1, int paramInt2)
  {
    if (isLeapYear(paramInt1))
      return MAX_DAYS_PER_MONTH_ARRAY[(paramInt2 - 1)];
    return MIN_DAYS_PER_MONTH_ARRAY[(paramInt2 - 1)];
  }

  int getMonthOfYear(long paramLong, int paramInt)
  {
    int i = (int)(paramLong - getYearMillis(paramInt) >> 10);
    if (isLeapYear(paramInt))
      if (i < 15356250)
        if (i < 7678125)
          if (i >= 2615625);
    do
    {
      return 1;
      if (i < 5062500)
        return 2;
      return 3;
      if (i < 10209375)
        return 4;
      if (i < 12825000)
        return 5;
      return 6;
      if (i < 23118750)
      {
        if (i < 17971875)
          return 7;
        if (i < 20587500)
          return 8;
        return 9;
      }
      if (i < 25734375)
        return 10;
      if (i < 28265625)
        return 11;
      return 12;
      if (i >= 15271875)
        break label182;
      if (i >= 7593750)
        break;
    }
    while (i < 2615625);
    if (i < 4978125)
      return 2;
    return 3;
    if (i < 10125000)
      return 4;
    if (i < 12740625)
      return 5;
    return 6;
    label182: if (i < 23034375)
    {
      if (i < 17887500)
        return 7;
      if (i < 20503125)
        return 8;
      return 9;
    }
    if (i < 25650000)
      return 10;
    if (i < 28181250)
      return 11;
    return 12;
  }

  long getTotalMillisByYearMonth(int paramInt1, int paramInt2)
  {
    if (isLeapYear(paramInt1))
      return MAX_TOTAL_MILLIS_BY_MONTH_ARRAY[(paramInt2 - 1)];
    return MIN_TOTAL_MILLIS_BY_MONTH_ARRAY[(paramInt2 - 1)];
  }

  long getYearDifference(long paramLong1, long paramLong2)
  {
    int i = getYear(paramLong1);
    int j = getYear(paramLong2);
    long l1 = paramLong1 - getYearMillis(i);
    long l2 = paramLong2 - getYearMillis(j);
    long l3;
    long l4;
    if (l2 >= 5097600000L)
      if (isLeapYear(j))
      {
        if (isLeapYear(i))
          break label132;
        long l5 = l2 - 86400000L;
        l3 = l1;
        l4 = l5;
      }
    while (true)
    {
      int k = i - j;
      if (l3 < l4)
        k--;
      return k;
      if ((l1 >= 5097600000L) && (isLeapYear(i)))
      {
        l3 = l1 - 86400000L;
        l4 = l2;
      }
      else
      {
        label132: l3 = l1;
        l4 = l2;
      }
    }
  }

  boolean isLeapDay(long paramLong)
  {
    return (dayOfMonth().get(paramLong) == 29) && (monthOfYear().isLeap(paramLong));
  }

  long setYear(long paramLong, int paramInt)
  {
    int i = getYear(paramLong);
    int j = getDayOfYear(paramLong, i);
    int k = getMillisOfDay(paramLong);
    if (j > 59)
    {
      if (!isLeapYear(i))
        break label63;
      if (!isLeapYear(paramInt))
        j--;
    }
    while (true)
    {
      return getYearMonthDayMillis(paramInt, 1, j) + k;
      label63: if (isLeapYear(paramInt))
        j++;
    }
  }
}