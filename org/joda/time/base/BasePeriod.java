package org.joda.time.base;

import java.io.Serializable;
import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.Duration;
import org.joda.time.DurationFieldType;
import org.joda.time.MutablePeriod;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadableDuration;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadablePartial;
import org.joda.time.ReadablePeriod;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.convert.ConverterManager;
import org.joda.time.convert.PeriodConverter;
import org.joda.time.field.FieldUtils;

public abstract class BasePeriod extends AbstractPeriod
  implements ReadablePeriod, Serializable
{
  private static final ReadablePeriod DUMMY_PERIOD = new AbstractPeriod()
  {
    public PeriodType getPeriodType()
    {
      return PeriodType.time();
    }

    public int getValue(int paramAnonymousInt)
    {
      return 0;
    }
  };
  private static final long serialVersionUID = -2110953284060001145L;
  private final PeriodType iType;
  private final int[] iValues;

  protected BasePeriod(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, PeriodType paramPeriodType)
  {
    this.iType = checkPeriodType(paramPeriodType);
    this.iValues = setPeriodInternal(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
  }

  protected BasePeriod(long paramLong)
  {
    this.iType = PeriodType.standard();
    int[] arrayOfInt = ISOChronology.getInstanceUTC().get(DUMMY_PERIOD, paramLong);
    this.iValues = new int[8];
    System.arraycopy(arrayOfInt, 0, this.iValues, 4, 4);
  }

  protected BasePeriod(long paramLong1, long paramLong2, PeriodType paramPeriodType, Chronology paramChronology)
  {
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    this.iType = localPeriodType;
    this.iValues = localChronology.get(this, paramLong1, paramLong2);
  }

  protected BasePeriod(long paramLong, PeriodType paramPeriodType, Chronology paramChronology)
  {
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    this.iType = localPeriodType;
    this.iValues = localChronology.get(this, paramLong);
  }

  protected BasePeriod(Object paramObject, PeriodType paramPeriodType, Chronology paramChronology)
  {
    PeriodConverter localPeriodConverter = ConverterManager.getInstance().getPeriodConverter(paramObject);
    if (paramPeriodType == null)
      paramPeriodType = localPeriodConverter.getPeriodType(paramObject);
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    this.iType = localPeriodType;
    if ((this instanceof ReadWritablePeriod))
    {
      this.iValues = new int[size()];
      Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
      localPeriodConverter.setInto((ReadWritablePeriod)this, paramObject, localChronology);
      return;
    }
    this.iValues = new MutablePeriod(paramObject, localPeriodType, paramChronology).getValues();
  }

  protected BasePeriod(ReadableDuration paramReadableDuration, ReadableInstant paramReadableInstant, PeriodType paramPeriodType)
  {
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    long l1 = DateTimeUtils.getDurationMillis(paramReadableDuration);
    long l2 = DateTimeUtils.getInstantMillis(paramReadableInstant);
    long l3 = FieldUtils.safeSubtract(l2, l1);
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iType = localPeriodType;
    this.iValues = localChronology.get(this, l3, l2);
  }

  protected BasePeriod(ReadableInstant paramReadableInstant, ReadableDuration paramReadableDuration, PeriodType paramPeriodType)
  {
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    long l1 = DateTimeUtils.getInstantMillis(paramReadableInstant);
    long l2 = FieldUtils.safeAdd(l1, DateTimeUtils.getDurationMillis(paramReadableDuration));
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    this.iType = localPeriodType;
    this.iValues = localChronology.get(this, l1, l2);
  }

  protected BasePeriod(ReadableInstant paramReadableInstant1, ReadableInstant paramReadableInstant2, PeriodType paramPeriodType)
  {
    PeriodType localPeriodType = checkPeriodType(paramPeriodType);
    if ((paramReadableInstant1 == null) && (paramReadableInstant2 == null))
    {
      this.iType = localPeriodType;
      this.iValues = new int[size()];
      return;
    }
    long l1 = DateTimeUtils.getInstantMillis(paramReadableInstant1);
    long l2 = DateTimeUtils.getInstantMillis(paramReadableInstant2);
    Chronology localChronology = DateTimeUtils.getIntervalChronology(paramReadableInstant1, paramReadableInstant2);
    this.iType = localPeriodType;
    this.iValues = localChronology.get(this, l1, l2);
  }

  protected BasePeriod(ReadablePartial paramReadablePartial1, ReadablePartial paramReadablePartial2, PeriodType paramPeriodType)
  {
    if ((paramReadablePartial1 == null) || (paramReadablePartial2 == null))
      throw new IllegalArgumentException("ReadablePartial objects must not be null");
    if (((paramReadablePartial1 instanceof BaseLocal)) && ((paramReadablePartial2 instanceof BaseLocal)) && (paramReadablePartial1.getClass() == paramReadablePartial2.getClass()))
    {
      PeriodType localPeriodType = checkPeriodType(paramPeriodType);
      long l1 = ((BaseLocal)paramReadablePartial1).getLocalMillis();
      long l2 = ((BaseLocal)paramReadablePartial2).getLocalMillis();
      Chronology localChronology2 = DateTimeUtils.getChronology(paramReadablePartial1.getChronology());
      this.iType = localPeriodType;
      this.iValues = localChronology2.get(this, l1, l2);
      return;
    }
    if (paramReadablePartial1.size() != paramReadablePartial2.size())
      throw new IllegalArgumentException("ReadablePartial objects must have the same set of fields");
    int i = 0;
    int j = paramReadablePartial1.size();
    while (i < j)
    {
      if (paramReadablePartial1.getFieldType(i) != paramReadablePartial2.getFieldType(i))
        throw new IllegalArgumentException("ReadablePartial objects must have the same set of fields");
      i++;
    }
    if (!DateTimeUtils.isContiguous(paramReadablePartial1))
      throw new IllegalArgumentException("ReadablePartial objects must be contiguous");
    this.iType = checkPeriodType(paramPeriodType);
    Chronology localChronology1 = DateTimeUtils.getChronology(paramReadablePartial1.getChronology()).withUTC();
    this.iValues = localChronology1.get(this, localChronology1.set(paramReadablePartial1, 0L), localChronology1.set(paramReadablePartial2, 0L));
  }

  protected BasePeriod(int[] paramArrayOfInt, PeriodType paramPeriodType)
  {
    this.iType = paramPeriodType;
    this.iValues = paramArrayOfInt;
  }

  private void checkAndUpdate(DurationFieldType paramDurationFieldType, int[] paramArrayOfInt, int paramInt)
  {
    int i = indexOf(paramDurationFieldType);
    if (i == -1)
    {
      if (paramInt != 0)
        throw new IllegalArgumentException("Period does not support field '" + paramDurationFieldType.getName() + "'");
    }
    else
      paramArrayOfInt[i] = paramInt;
  }

  private void setPeriodInternal(ReadablePeriod paramReadablePeriod)
  {
    int[] arrayOfInt = new int[size()];
    int i = 0;
    int j = paramReadablePeriod.size();
    while (i < j)
    {
      checkAndUpdate(paramReadablePeriod.getFieldType(i), arrayOfInt, paramReadablePeriod.getValue(i));
      i++;
    }
    setValues(arrayOfInt);
  }

  private int[] setPeriodInternal(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8)
  {
    int[] arrayOfInt = new int[size()];
    checkAndUpdate(DurationFieldType.years(), arrayOfInt, paramInt1);
    checkAndUpdate(DurationFieldType.months(), arrayOfInt, paramInt2);
    checkAndUpdate(DurationFieldType.weeks(), arrayOfInt, paramInt3);
    checkAndUpdate(DurationFieldType.days(), arrayOfInt, paramInt4);
    checkAndUpdate(DurationFieldType.hours(), arrayOfInt, paramInt5);
    checkAndUpdate(DurationFieldType.minutes(), arrayOfInt, paramInt6);
    checkAndUpdate(DurationFieldType.seconds(), arrayOfInt, paramInt7);
    checkAndUpdate(DurationFieldType.millis(), arrayOfInt, paramInt8);
    return arrayOfInt;
  }

  protected void addField(DurationFieldType paramDurationFieldType, int paramInt)
  {
    addFieldInto(this.iValues, paramDurationFieldType, paramInt);
  }

  protected void addFieldInto(int[] paramArrayOfInt, DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOf(paramDurationFieldType);
    if (i == -1)
    {
      if ((paramInt != 0) || (paramDurationFieldType == null))
        throw new IllegalArgumentException("Period does not support field '" + paramDurationFieldType + "'");
    }
    else
      paramArrayOfInt[i] = FieldUtils.safeAdd(paramArrayOfInt[i], paramInt);
  }

  protected void addPeriod(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod != null)
      setValues(addPeriodInto(getValues(), paramReadablePeriod));
  }

  protected int[] addPeriodInto(int[] paramArrayOfInt, ReadablePeriod paramReadablePeriod)
  {
    int i = 0;
    int j = paramReadablePeriod.size();
    while (i < j)
    {
      DurationFieldType localDurationFieldType = paramReadablePeriod.getFieldType(i);
      int k = paramReadablePeriod.getValue(i);
      if (k != 0)
      {
        int m = indexOf(localDurationFieldType);
        if (m == -1)
          throw new IllegalArgumentException("Period does not support field '" + localDurationFieldType.getName() + "'");
        paramArrayOfInt[m] = FieldUtils.safeAdd(getValue(m), k);
      }
      i++;
    }
    return paramArrayOfInt;
  }

  protected PeriodType checkPeriodType(PeriodType paramPeriodType)
  {
    return DateTimeUtils.getPeriodType(paramPeriodType);
  }

  public PeriodType getPeriodType()
  {
    return this.iType;
  }

  public int getValue(int paramInt)
  {
    return this.iValues[paramInt];
  }

  protected void mergePeriod(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod != null)
      setValues(mergePeriodInto(getValues(), paramReadablePeriod));
  }

  protected int[] mergePeriodInto(int[] paramArrayOfInt, ReadablePeriod paramReadablePeriod)
  {
    int i = 0;
    int j = paramReadablePeriod.size();
    while (i < j)
    {
      checkAndUpdate(paramReadablePeriod.getFieldType(i), paramArrayOfInt, paramReadablePeriod.getValue(i));
      i++;
    }
    return paramArrayOfInt;
  }

  protected void setField(DurationFieldType paramDurationFieldType, int paramInt)
  {
    setFieldInto(this.iValues, paramDurationFieldType, paramInt);
  }

  protected void setFieldInto(int[] paramArrayOfInt, DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOf(paramDurationFieldType);
    if (i == -1)
    {
      if ((paramInt != 0) || (paramDurationFieldType == null))
        throw new IllegalArgumentException("Period does not support field '" + paramDurationFieldType + "'");
    }
    else
      paramArrayOfInt[i] = paramInt;
  }

  protected void setPeriod(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8)
  {
    setValues(setPeriodInternal(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8));
  }

  protected void setPeriod(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod == null)
    {
      setValues(new int[size()]);
      return;
    }
    setPeriodInternal(paramReadablePeriod);
  }

  protected void setValue(int paramInt1, int paramInt2)
  {
    this.iValues[paramInt1] = paramInt2;
  }

  protected void setValues(int[] paramArrayOfInt)
  {
    System.arraycopy(paramArrayOfInt, 0, this.iValues, 0, this.iValues.length);
  }

  public Duration toDurationFrom(ReadableInstant paramReadableInstant)
  {
    long l = DateTimeUtils.getInstantMillis(paramReadableInstant);
    return new Duration(l, DateTimeUtils.getInstantChronology(paramReadableInstant).add(this, l, 1));
  }

  public Duration toDurationTo(ReadableInstant paramReadableInstant)
  {
    long l = DateTimeUtils.getInstantMillis(paramReadableInstant);
    return new Duration(DateTimeUtils.getInstantChronology(paramReadableInstant).add(this, l, -1), l);
  }
}