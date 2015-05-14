package org.joda.time.field;

import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

public abstract class ImpreciseDateTimeField extends BaseDateTimeField
{
  private static final long serialVersionUID = 7190739608550251860L;
  private final DurationField iDurationField;
  final long iUnitMillis;

  public ImpreciseDateTimeField(DateTimeFieldType paramDateTimeFieldType, long paramLong)
  {
    super(paramDateTimeFieldType);
    this.iUnitMillis = paramLong;
    this.iDurationField = new LinkedDurationField(paramDateTimeFieldType.getDurationType());
  }

  public abstract long add(long paramLong, int paramInt);

  public abstract long add(long paramLong1, long paramLong2);

  public abstract int get(long paramLong);

  public int getDifference(long paramLong1, long paramLong2)
  {
    return FieldUtils.safeToInt(getDifferenceAsLong(paramLong1, paramLong2));
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    long l;
    if (paramLong1 < paramLong2)
      l = -getDifferenceAsLong(paramLong2, paramLong1);
    do
    {
      return l;
      l = (paramLong1 - paramLong2) / this.iUnitMillis;
      if (add(paramLong2, l) < paramLong1)
      {
        do
          l += 1L;
        while (add(paramLong2, l) <= paramLong1);
        return l - 1L;
      }
    }
    while (add(paramLong2, l) <= paramLong1);
    do
      l -= 1L;
    while (add(paramLong2, l) > paramLong1);
    return l;
  }

  public final DurationField getDurationField()
  {
    return this.iDurationField;
  }

  protected final long getDurationUnitMillis()
  {
    return this.iUnitMillis;
  }

  public abstract DurationField getRangeDurationField();

  public abstract long roundFloor(long paramLong);

  public abstract long set(long paramLong, int paramInt);

  private final class LinkedDurationField extends BaseDurationField
  {
    private static final long serialVersionUID = -203813474600094134L;

    LinkedDurationField(DurationFieldType arg2)
    {
      super();
    }

    public long add(long paramLong, int paramInt)
    {
      return ImpreciseDateTimeField.this.add(paramLong, paramInt);
    }

    public long add(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.add(paramLong1, paramLong2);
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.getDifference(paramLong1, paramLong2);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.getDifferenceAsLong(paramLong1, paramLong2);
    }

    public long getMillis(int paramInt, long paramLong)
    {
      return ImpreciseDateTimeField.this.add(paramLong, paramInt) - paramLong;
    }

    public long getMillis(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.add(paramLong2, paramLong1) - paramLong2;
    }

    public long getUnitMillis()
    {
      return ImpreciseDateTimeField.this.iUnitMillis;
    }

    public int getValue(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.getDifference(paramLong2 + paramLong1, paramLong2);
    }

    public long getValueAsLong(long paramLong1, long paramLong2)
    {
      return ImpreciseDateTimeField.this.getDifferenceAsLong(paramLong2 + paramLong1, paramLong2);
    }

    public boolean isPrecise()
    {
      return false;
    }
  }
}