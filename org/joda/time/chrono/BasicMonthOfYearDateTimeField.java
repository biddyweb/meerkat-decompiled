package org.joda.time.chrono;

import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DurationField;
import org.joda.time.ReadablePartial;
import org.joda.time.field.FieldUtils;
import org.joda.time.field.ImpreciseDateTimeField;

class BasicMonthOfYearDateTimeField extends ImpreciseDateTimeField
{
  private static final int MIN = 1;
  private static final long serialVersionUID = -8258715387168736L;
  private final BasicChronology iChronology;
  private final int iLeapMonth;
  private final int iMax;

  BasicMonthOfYearDateTimeField(BasicChronology paramBasicChronology, int paramInt)
  {
    super(DateTimeFieldType.monthOfYear(), paramBasicChronology.getAverageMillisPerMonth());
    this.iChronology = paramBasicChronology;
    this.iMax = this.iChronology.getMaxMonth();
    this.iLeapMonth = paramInt;
  }

  private Object readResolve()
  {
    return this.iChronology.monthOfYear();
  }

  public long add(long paramLong, int paramInt)
  {
    if (paramInt == 0)
      return paramLong;
    long l = this.iChronology.getMillisOfDay(paramLong);
    int i = this.iChronology.getYear(paramLong);
    int j = this.iChronology.getMonthOfYear(paramLong, i);
    int k = paramInt + (j - 1);
    int m;
    int i1;
    int i2;
    int i3;
    if (k >= 0)
    {
      m = i + k / this.iMax;
      i1 = 1 + k % this.iMax;
      i2 = this.iChronology.getDayOfMonth(paramLong, i, j);
      i3 = this.iChronology.getDaysInYearMonth(m, i1);
      if (i2 <= i3)
        break label186;
    }
    while (true)
    {
      return l + this.iChronology.getYearMonthDayMillis(m, i1, i3);
      m = -1 + (i + k / this.iMax);
      int n = Math.abs(k) % this.iMax;
      if (n == 0)
        n = this.iMax;
      i1 = 1 + (this.iMax - n);
      if (i1 != 1)
        break;
      m++;
      break;
      label186: i3 = i2;
    }
  }

  public long add(long paramLong1, long paramLong2)
  {
    int i = (int)paramLong2;
    if (i == paramLong2)
      return add(paramLong1, i);
    long l1 = this.iChronology.getMillisOfDay(paramLong1);
    int j = this.iChronology.getYear(paramLong1);
    int k = this.iChronology.getMonthOfYear(paramLong1, j);
    long l2 = paramLong2 + (k - 1);
    long l3;
    long l4;
    if (l2 >= 0L)
    {
      l3 = j + l2 / this.iMax;
      l4 = 1L + l2 % this.iMax;
    }
    while ((l3 < this.iChronology.getMinYear()) || (l3 > this.iChronology.getMaxYear()))
    {
      throw new IllegalArgumentException("Magnitude of add amount is too large: " + paramLong2);
      l3 = j + l2 / this.iMax - 1L;
      int m = (int)(Math.abs(l2) % this.iMax);
      if (m == 0)
        m = this.iMax;
      l4 = 1 + (this.iMax - m);
      if (l4 == 1L)
        l3 += 1L;
    }
    int n = (int)l3;
    int i1 = (int)l4;
    int i2 = this.iChronology.getDayOfMonth(paramLong1, j, k);
    int i3 = this.iChronology.getDaysInYearMonth(n, i1);
    if (i2 > i3);
    while (true)
    {
      return l1 + this.iChronology.getYearMonthDayMillis(n, i1, i3);
      i3 = i2;
    }
  }

  public int[] add(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    int i = 0;
    if (paramInt2 == 0)
      return paramArrayOfInt;
    if ((paramReadablePartial.size() > 0) && (paramReadablePartial.getFieldType(0).equals(DateTimeFieldType.monthOfYear())) && (paramInt1 == 0))
      return set(paramReadablePartial, 0, paramArrayOfInt, 1 + (12 + (-1 + paramReadablePartial.getValue(0) + paramInt2 % 12)) % 12);
    if (DateTimeUtils.isContiguous(paramReadablePartial))
    {
      long l1 = 0L;
      int j = paramReadablePartial.size();
      while (i < j)
      {
        l1 = paramReadablePartial.getFieldType(i).getField(this.iChronology).set(l1, paramArrayOfInt[i]);
        i++;
      }
      long l2 = add(l1, paramInt2);
      return this.iChronology.get(paramReadablePartial, l2);
    }
    return super.add(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return set(paramLong, FieldUtils.getWrappedValue(get(paramLong), paramInt, 1, this.iMax));
  }

  public int get(long paramLong)
  {
    return this.iChronology.getMonthOfYear(paramLong);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    long l;
    if (paramLong1 < paramLong2)
      l = -getDifference(paramLong2, paramLong1);
    int i;
    int j;
    int k;
    int m;
    do
    {
      return l;
      i = this.iChronology.getYear(paramLong1);
      j = this.iChronology.getMonthOfYear(paramLong1, i);
      k = this.iChronology.getYear(paramLong2);
      m = this.iChronology.getMonthOfYear(paramLong2, k);
      l = (i - k) * this.iMax + j - m;
      int n = this.iChronology.getDayOfMonth(paramLong1, i, j);
      if ((n == this.iChronology.getDaysInYearMonth(i, j)) && (this.iChronology.getDayOfMonth(paramLong2, k, m) > n))
        paramLong2 = this.iChronology.dayOfMonth().set(paramLong2, n);
    }
    while (paramLong1 - this.iChronology.getYearMonthMillis(i, j) >= paramLong2 - this.iChronology.getYearMonthMillis(k, m));
    return l - 1L;
  }

  public int getLeapAmount(long paramLong)
  {
    if (isLeap(paramLong))
      return 1;
    return 0;
  }

  public DurationField getLeapDurationField()
  {
    return this.iChronology.days();
  }

  public int getMaximumValue()
  {
    return this.iMax;
  }

  public int getMinimumValue()
  {
    return 1;
  }

  public DurationField getRangeDurationField()
  {
    return this.iChronology.years();
  }

  public boolean isLeap(long paramLong)
  {
    int i = this.iChronology.getYear(paramLong);
    boolean bool1 = this.iChronology.isLeapYear(i);
    boolean bool2 = false;
    if (bool1)
    {
      int j = this.iChronology.getMonthOfYear(paramLong, i);
      int k = this.iLeapMonth;
      bool2 = false;
      if (j == k)
        bool2 = true;
    }
    return bool2;
  }

  public boolean isLenient()
  {
    return false;
  }

  public long remainder(long paramLong)
  {
    return paramLong - roundFloor(paramLong);
  }

  public long roundFloor(long paramLong)
  {
    int i = this.iChronology.getYear(paramLong);
    int j = this.iChronology.getMonthOfYear(paramLong, i);
    return this.iChronology.getYearMonthMillis(i, j);
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, paramInt, 1, this.iMax);
    int i = this.iChronology.getYear(paramLong);
    int j = this.iChronology.getDayOfMonth(paramLong, i);
    int k = this.iChronology.getDaysInYearMonth(i, paramInt);
    if (j > k);
    while (true)
    {
      return this.iChronology.getYearMonthDayMillis(i, paramInt, k) + this.iChronology.getMillisOfDay(paramLong);
      k = j;
    }
  }
}