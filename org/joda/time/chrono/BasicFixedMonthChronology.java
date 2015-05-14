package org.joda.time.chrono;

import org.joda.time.Chronology;

abstract class BasicFixedMonthChronology extends BasicChronology
{
  static final long MILLIS_PER_MONTH = 2592000000L;
  static final long MILLIS_PER_YEAR = 31557600000L;
  static final int MONTH_LENGTH = 30;
  private static final long serialVersionUID = 261387371998L;

  BasicFixedMonthChronology(Chronology paramChronology, Object paramObject, int paramInt)
  {
    super(paramChronology, paramObject, paramInt);
  }

  long getAverageMillisPerMonth()
  {
    return 2592000000L;
  }

  long getAverageMillisPerYear()
  {
    return 31557600000L;
  }

  long getAverageMillisPerYearDividedByTwo()
  {
    return 15778800000L;
  }

  int getDayOfMonth(long paramLong)
  {
    return 1 + (-1 + getDayOfYear(paramLong)) % 30;
  }

  int getDaysInMonthMax()
  {
    return 30;
  }

  int getDaysInMonthMax(int paramInt)
  {
    if (paramInt != 13)
      return 30;
    return 6;
  }

  int getDaysInYearMonth(int paramInt1, int paramInt2)
  {
    if (paramInt2 != 13)
      return 30;
    if (isLeapYear(paramInt1))
      return 6;
    return 5;
  }

  int getMaxMonth()
  {
    return 13;
  }

  int getMonthOfYear(long paramLong)
  {
    return 1 + (-1 + getDayOfYear(paramLong)) / 30;
  }

  int getMonthOfYear(long paramLong, int paramInt)
  {
    return 1 + (int)((paramLong - getYearMillis(paramInt)) / 2592000000L);
  }

  long getTotalMillisByYearMonth(int paramInt1, int paramInt2)
  {
    return 2592000000L * (paramInt2 - 1);
  }

  long getYearDifference(long paramLong1, long paramLong2)
  {
    int i = getYear(paramLong1);
    int j = getYear(paramLong2);
    long l1 = paramLong1 - getYearMillis(i);
    long l2 = paramLong2 - getYearMillis(j);
    int k = i - j;
    if (l1 < l2)
      k--;
    return k;
  }

  boolean isLeapYear(int paramInt)
  {
    return (paramInt & 0x3) == 3;
  }

  long setYear(long paramLong, int paramInt)
  {
    int i = getDayOfYear(paramLong, getYear(paramLong));
    int j = getMillisOfDay(paramLong);
    if ((i > 365) && (!isLeapYear(paramInt)))
      i--;
    return getYearMonthDayMillis(paramInt, 1, i) + j;
  }
}