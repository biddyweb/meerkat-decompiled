package org.joda.time.chrono;

import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.field.FieldUtils;
import org.joda.time.field.ImpreciseDateTimeField;

final class BasicWeekyearDateTimeField extends ImpreciseDateTimeField
{
  private static final long WEEK_53 = 31449600000L;
  private static final long serialVersionUID = 6215066916806820644L;
  private final BasicChronology iChronology;

  BasicWeekyearDateTimeField(BasicChronology paramBasicChronology)
  {
    super(DateTimeFieldType.weekyear(), paramBasicChronology.getAverageMillisPerYear());
    this.iChronology = paramBasicChronology;
  }

  private Object readResolve()
  {
    return this.iChronology.weekyear();
  }

  public long add(long paramLong, int paramInt)
  {
    if (paramInt == 0)
      return paramLong;
    return set(paramLong, paramInt + get(paramLong));
  }

  public long add(long paramLong1, long paramLong2)
  {
    return add(paramLong1, FieldUtils.safeToInt(paramLong2));
  }

  public long addWrapField(long paramLong, int paramInt)
  {
    return add(paramLong, paramInt);
  }

  public int get(long paramLong)
  {
    return this.iChronology.getWeekyear(paramLong);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    if (paramLong1 < paramLong2)
      return -getDifference(paramLong2, paramLong1);
    int i = get(paramLong1);
    int j = get(paramLong2);
    long l1 = remainder(paramLong1);
    long l2 = remainder(paramLong2);
    if ((l2 >= 31449600000L) && (this.iChronology.getWeeksInYear(i) <= 52));
    for (long l3 = l2 - 604800000L; ; l3 = l2)
    {
      int k = i - j;
      if (l1 < l3)
        k--;
      return k;
    }
  }

  public int getLeapAmount(long paramLong)
  {
    return -52 + this.iChronology.getWeeksInYear(this.iChronology.getWeekyear(paramLong));
  }

  public DurationField getLeapDurationField()
  {
    return this.iChronology.weeks();
  }

  public int getMaximumValue()
  {
    return this.iChronology.getMaxYear();
  }

  public int getMinimumValue()
  {
    return this.iChronology.getMinYear();
  }

  public DurationField getRangeDurationField()
  {
    return null;
  }

  public boolean isLeap(long paramLong)
  {
    return this.iChronology.getWeeksInYear(this.iChronology.getWeekyear(paramLong)) > 52;
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
    long l = this.iChronology.weekOfWeekyear().roundFloor(paramLong);
    int i = this.iChronology.getWeekOfWeekyear(l);
    if (i > 1)
      l -= 604800000L * (i - 1);
    return l;
  }

  public long set(long paramLong, int paramInt)
  {
    FieldUtils.verifyValueBounds(this, Math.abs(paramInt), this.iChronology.getMinYear(), this.iChronology.getMaxYear());
    int i = get(paramLong);
    if (i == paramInt)
      return paramLong;
    int j = this.iChronology.getDayOfWeek(paramLong);
    int k = this.iChronology.getWeeksInYear(i);
    int m = this.iChronology.getWeeksInYear(paramInt);
    int n;
    if (m < k)
    {
      n = this.iChronology.getWeekOfWeekyear(paramLong);
      if (n <= m)
        break label186;
    }
    while (true)
    {
      long l1 = this.iChronology.setYear(paramLong, paramInt);
      int i1 = get(l1);
      if (i1 < paramInt)
        l1 += 604800000L;
      while (true)
      {
        long l2 = l1 + 604800000L * (m - this.iChronology.getWeekOfWeekyear(l1));
        return this.iChronology.dayOfWeek().set(l2, j);
        m = k;
        break;
        if (i1 > paramInt)
          l1 -= 604800000L;
      }
      label186: m = n;
    }
  }
}