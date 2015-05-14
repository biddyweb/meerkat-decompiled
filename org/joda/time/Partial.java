package org.joda.time;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import org.joda.time.base.AbstractPartial;
import org.joda.time.field.AbstractPartialFieldProperty;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public final class Partial extends AbstractPartial
  implements ReadablePartial, Serializable
{
  private static final long serialVersionUID = 12324121189002L;
  private final Chronology iChronology;
  private transient DateTimeFormatter[] iFormatter;
  private final DateTimeFieldType[] iTypes;
  private final int[] iValues;

  public Partial()
  {
    this((Chronology)null);
  }

  public Partial(Chronology paramChronology)
  {
    this.iChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    this.iTypes = new DateTimeFieldType[0];
    this.iValues = new int[0];
  }

  Partial(Chronology paramChronology, DateTimeFieldType[] paramArrayOfDateTimeFieldType, int[] paramArrayOfInt)
  {
    this.iChronology = paramChronology;
    this.iTypes = paramArrayOfDateTimeFieldType;
    this.iValues = paramArrayOfInt;
  }

  public Partial(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    this(paramDateTimeFieldType, paramInt, null);
  }

  public Partial(DateTimeFieldType paramDateTimeFieldType, int paramInt, Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    this.iChronology = localChronology;
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The field type must not be null");
    this.iTypes = new DateTimeFieldType[] { paramDateTimeFieldType };
    this.iValues = new int[] { paramInt };
    localChronology.validate(this, this.iValues);
  }

  Partial(Partial paramPartial, int[] paramArrayOfInt)
  {
    this.iChronology = paramPartial.iChronology;
    this.iTypes = paramPartial.iTypes;
    this.iValues = paramArrayOfInt;
  }

  public Partial(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("The partial must not be null");
    this.iChronology = DateTimeUtils.getChronology(paramReadablePartial.getChronology()).withUTC();
    this.iTypes = new DateTimeFieldType[paramReadablePartial.size()];
    this.iValues = new int[paramReadablePartial.size()];
    for (int i = 0; i < paramReadablePartial.size(); i++)
    {
      this.iTypes[i] = paramReadablePartial.getFieldType(i);
      this.iValues[i] = paramReadablePartial.getValue(i);
    }
  }

  public Partial(DateTimeFieldType[] paramArrayOfDateTimeFieldType, int[] paramArrayOfInt)
  {
    this(paramArrayOfDateTimeFieldType, paramArrayOfInt, null);
  }

  public Partial(DateTimeFieldType[] paramArrayOfDateTimeFieldType, int[] paramArrayOfInt, Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    this.iChronology = localChronology;
    if (paramArrayOfDateTimeFieldType == null)
      throw new IllegalArgumentException("Types array must not be null");
    if (paramArrayOfInt == null)
      throw new IllegalArgumentException("Values array must not be null");
    if (paramArrayOfInt.length != paramArrayOfDateTimeFieldType.length)
      throw new IllegalArgumentException("Values array must be the same length as the types array");
    if (paramArrayOfDateTimeFieldType.length == 0)
    {
      this.iTypes = paramArrayOfDateTimeFieldType;
      this.iValues = paramArrayOfInt;
      return;
    }
    for (int j = 0; j < paramArrayOfDateTimeFieldType.length; j++)
      if (paramArrayOfDateTimeFieldType[j] == null)
        throw new IllegalArgumentException("Types array must not contain null: index " + j);
    DurationField localDurationField1;
    for (Object localObject = null; i < paramArrayOfDateTimeFieldType.length; localObject = localDurationField1)
    {
      DateTimeFieldType localDateTimeFieldType = paramArrayOfDateTimeFieldType[i];
      localDurationField1 = localDateTimeFieldType.getDurationType().getField(this.iChronology);
      if (i > 0)
      {
        if (!localDurationField1.isSupported())
        {
          if (localObject.isSupported())
            throw new IllegalArgumentException("Types array must be in order largest-smallest: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " < " + localDateTimeFieldType.getName());
          throw new IllegalArgumentException("Types array must not contain duplicate unsupported: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " and " + localDateTimeFieldType.getName());
        }
        int k = localObject.compareTo(localDurationField1);
        if (k < 0)
          throw new IllegalArgumentException("Types array must be in order largest-smallest: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " < " + localDateTimeFieldType.getName());
        if (k == 0)
          if (localObject.equals(localDurationField1))
          {
            DurationFieldType localDurationFieldType1 = paramArrayOfDateTimeFieldType[(i - 1)].getRangeDurationType();
            DurationFieldType localDurationFieldType2 = localDateTimeFieldType.getRangeDurationType();
            if (localDurationFieldType1 == null)
            {
              if (localDurationFieldType2 == null)
                throw new IllegalArgumentException("Types array must not contain duplicate: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " and " + localDateTimeFieldType.getName());
            }
            else
            {
              if (localDurationFieldType2 == null)
                throw new IllegalArgumentException("Types array must be in order largest-smallest: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " < " + localDateTimeFieldType.getName());
              DurationField localDurationField2 = localDurationFieldType1.getField(this.iChronology);
              DurationField localDurationField3 = localDurationFieldType2.getField(this.iChronology);
              if (localDurationField2.compareTo(localDurationField3) < 0)
                throw new IllegalArgumentException("Types array must be in order largest-smallest: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " < " + localDateTimeFieldType.getName());
              if (localDurationField2.compareTo(localDurationField3) == 0)
                throw new IllegalArgumentException("Types array must not contain duplicate: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " and " + localDateTimeFieldType.getName());
            }
          }
          else if ((localObject.isSupported()) && (localObject.getType() != DurationFieldType.YEARS_TYPE))
          {
            throw new IllegalArgumentException("Types array must be in order largest-smallest, for year-based fields, years is defined as being largest: " + paramArrayOfDateTimeFieldType[(i - 1)].getName() + " < " + localDateTimeFieldType.getName());
          }
      }
      i++;
    }
    this.iTypes = ((DateTimeFieldType[])paramArrayOfDateTimeFieldType.clone());
    localChronology.validate(this, paramArrayOfInt);
    this.iValues = ((int[])paramArrayOfInt.clone());
  }

  public Chronology getChronology()
  {
    return this.iChronology;
  }

  protected DateTimeField getField(int paramInt, Chronology paramChronology)
  {
    return this.iTypes[paramInt].getField(paramChronology);
  }

  public DateTimeFieldType getFieldType(int paramInt)
  {
    return this.iTypes[paramInt];
  }

  public DateTimeFieldType[] getFieldTypes()
  {
    return (DateTimeFieldType[])this.iTypes.clone();
  }

  public DateTimeFormatter getFormatter()
  {
    DateTimeFormatter[] arrayOfDateTimeFormatter = this.iFormatter;
    if (arrayOfDateTimeFormatter == null)
    {
      if (size() == 0)
        return null;
      arrayOfDateTimeFormatter = new DateTimeFormatter[2];
    }
    try
    {
      ArrayList localArrayList = new ArrayList(Arrays.asList(this.iTypes));
      arrayOfDateTimeFormatter[0] = ISODateTimeFormat.forFields(localArrayList, true, false);
      if (localArrayList.size() == 0)
        arrayOfDateTimeFormatter[1] = arrayOfDateTimeFormatter[0];
      label62: this.iFormatter = arrayOfDateTimeFormatter;
      return arrayOfDateTimeFormatter[0];
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      break label62;
    }
  }

  public int getValue(int paramInt)
  {
    return this.iValues[paramInt];
  }

  public int[] getValues()
  {
    return (int[])this.iValues.clone();
  }

  public boolean isMatch(ReadableInstant paramReadableInstant)
  {
    long l = DateTimeUtils.getInstantMillis(paramReadableInstant);
    Chronology localChronology = DateTimeUtils.getInstantChronology(paramReadableInstant);
    for (int i = 0; i < this.iTypes.length; i++)
      if (this.iTypes[i].getField(localChronology).get(l) != this.iValues[i])
        return false;
    return true;
  }

  public boolean isMatch(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("The partial must not be null");
    for (int i = 0; i < this.iTypes.length; i++)
      if (paramReadablePartial.get(this.iTypes[i]) != this.iValues[i])
        return false;
    return true;
  }

  public Partial minus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, -1);
  }

  public Partial plus(ReadablePeriod paramReadablePeriod)
  {
    return withPeriodAdded(paramReadablePeriod, 1);
  }

  public Property property(DateTimeFieldType paramDateTimeFieldType)
  {
    return new Property(this, indexOfSupported(paramDateTimeFieldType));
  }

  public int size()
  {
    return this.iTypes.length;
  }

  public String toString()
  {
    DateTimeFormatter[] arrayOfDateTimeFormatter = this.iFormatter;
    if (arrayOfDateTimeFormatter == null)
    {
      getFormatter();
      arrayOfDateTimeFormatter = this.iFormatter;
      if (arrayOfDateTimeFormatter == null)
        return toStringList();
    }
    DateTimeFormatter localDateTimeFormatter = arrayOfDateTimeFormatter[1];
    if (localDateTimeFormatter == null)
      return toStringList();
    return localDateTimeFormatter.print(this);
  }

  public String toString(String paramString)
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).print(this);
  }

  public String toString(String paramString, Locale paramLocale)
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).withLocale(paramLocale).print(this);
  }

  public String toStringList()
  {
    int i = size();
    StringBuilder localStringBuilder = new StringBuilder(i * 20);
    localStringBuilder.append('[');
    for (int j = 0; j < i; j++)
    {
      if (j > 0)
        localStringBuilder.append(',').append(' ');
      localStringBuilder.append(this.iTypes[j].getName());
      localStringBuilder.append('=');
      localStringBuilder.append(this.iValues[j]);
    }
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public Partial with(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    if (paramDateTimeFieldType == null)
      throw new IllegalArgumentException("The field type must not be null");
    int i = indexOf(paramDateTimeFieldType);
    DateTimeFieldType[] arrayOfDateTimeFieldType;
    int[] arrayOfInt2;
    int j;
    DateTimeFieldType localDateTimeFieldType;
    int k;
    if (i == -1)
    {
      arrayOfDateTimeFieldType = new DateTimeFieldType[1 + this.iTypes.length];
      arrayOfInt2 = new int[arrayOfDateTimeFieldType.length];
      DurationField localDurationField1 = paramDateTimeFieldType.getDurationType().getField(this.iChronology);
      if (!localDurationField1.isSupported())
        break label335;
      j = 0;
      if (j < this.iTypes.length)
      {
        localDateTimeFieldType = this.iTypes[j];
        DurationField localDurationField2 = localDateTimeFieldType.getDurationType().getField(this.iChronology);
        if (!localDurationField2.isSupported())
          break label260;
        k = localDurationField1.compareTo(localDurationField2);
        if (k <= 0)
          break label240;
      }
    }
    while (true)
    {
      label123: System.arraycopy(this.iTypes, 0, arrayOfDateTimeFieldType, 0, j);
      System.arraycopy(this.iValues, 0, arrayOfInt2, 0, j);
      arrayOfDateTimeFieldType[j] = paramDateTimeFieldType;
      arrayOfInt2[j] = paramInt;
      System.arraycopy(this.iTypes, j, arrayOfDateTimeFieldType, j + 1, -1 + (arrayOfDateTimeFieldType.length - j));
      System.arraycopy(this.iValues, j, arrayOfInt2, j + 1, -1 + (arrayOfInt2.length - j));
      Partial localPartial = new Partial(arrayOfDateTimeFieldType, arrayOfInt2, this.iChronology);
      this.iChronology.validate(localPartial, arrayOfInt2);
      this = localPartial;
      label240: 
      do
      {
        return this;
        if (k == 0)
        {
          if (paramDateTimeFieldType.getRangeDurationType() == null)
            break label123;
          if (localDateTimeFieldType.getRangeDurationType() != null)
            break label266;
        }
        while (paramDateTimeFieldType.getRangeDurationType().getField(this.iChronology).compareTo(localDateTimeFieldType.getRangeDurationType().getField(this.iChronology)) <= 0)
        {
          j++;
          break;
        }
        break label123;
      }
      while (paramInt == getValue(i));
      label260: label266: int[] arrayOfInt1 = getValues();
      return new Partial(this, getField(i).set(this, i, arrayOfInt1, paramInt));
      label335: j = 0;
    }
  }

  public Partial withChronologyRetainFields(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology).withUTC();
    if (localChronology == getChronology())
      return this;
    Partial localPartial = new Partial(localChronology, this.iTypes, this.iValues);
    localChronology.validate(localPartial, this.iValues);
    return localPartial;
  }

  public Partial withField(DateTimeFieldType paramDateTimeFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDateTimeFieldType);
    if (paramInt == getValue(i))
      return this;
    int[] arrayOfInt = getValues();
    return new Partial(this, getField(i).set(this, i, arrayOfInt, paramInt));
  }

  public Partial withFieldAddWrapped(DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDurationFieldType);
    if (paramInt == 0)
      return this;
    int[] arrayOfInt = getValues();
    return new Partial(this, getField(i).addWrapPartial(this, i, arrayOfInt, paramInt));
  }

  public Partial withFieldAdded(DurationFieldType paramDurationFieldType, int paramInt)
  {
    int i = indexOfSupported(paramDurationFieldType);
    if (paramInt == 0)
      return this;
    int[] arrayOfInt = getValues();
    return new Partial(this, getField(i).add(this, i, arrayOfInt, paramInt));
  }

  public Partial withPeriodAdded(ReadablePeriod paramReadablePeriod, int paramInt)
  {
    if ((paramReadablePeriod == null) || (paramInt == 0))
      return this;
    int[] arrayOfInt = getValues();
    for (int i = 0; i < paramReadablePeriod.size(); i++)
    {
      int j = indexOf(paramReadablePeriod.getFieldType(i));
      if (j >= 0)
        arrayOfInt = getField(j).add(this, j, arrayOfInt, FieldUtils.safeMultiply(paramReadablePeriod.getValue(i), paramInt));
    }
    return new Partial(this, arrayOfInt);
  }

  public Partial without(DateTimeFieldType paramDateTimeFieldType)
  {
    int i = indexOf(paramDateTimeFieldType);
    if (i != -1)
    {
      DateTimeFieldType[] arrayOfDateTimeFieldType = new DateTimeFieldType[-1 + size()];
      int[] arrayOfInt = new int[-1 + size()];
      System.arraycopy(this.iTypes, 0, arrayOfDateTimeFieldType, 0, i);
      System.arraycopy(this.iTypes, i + 1, arrayOfDateTimeFieldType, i, arrayOfDateTimeFieldType.length - i);
      System.arraycopy(this.iValues, 0, arrayOfInt, 0, i);
      System.arraycopy(this.iValues, i + 1, arrayOfInt, i, arrayOfInt.length - i);
      Partial localPartial = new Partial(this.iChronology, arrayOfDateTimeFieldType, arrayOfInt);
      this.iChronology.validate(localPartial, arrayOfInt);
      this = localPartial;
    }
    return this;
  }

  public static class Property extends AbstractPartialFieldProperty
    implements Serializable
  {
    private static final long serialVersionUID = 53278362873888L;
    private final int iFieldIndex;
    private final Partial iPartial;

    Property(Partial paramPartial, int paramInt)
    {
      this.iPartial = paramPartial;
      this.iFieldIndex = paramInt;
    }

    public Partial addToCopy(int paramInt)
    {
      int[] arrayOfInt1 = this.iPartial.getValues();
      int[] arrayOfInt2 = getField().add(this.iPartial, this.iFieldIndex, arrayOfInt1, paramInt);
      return new Partial(this.iPartial, arrayOfInt2);
    }

    public Partial addWrapFieldToCopy(int paramInt)
    {
      int[] arrayOfInt1 = this.iPartial.getValues();
      int[] arrayOfInt2 = getField().addWrapField(this.iPartial, this.iFieldIndex, arrayOfInt1, paramInt);
      return new Partial(this.iPartial, arrayOfInt2);
    }

    public int get()
    {
      return this.iPartial.getValue(this.iFieldIndex);
    }

    public DateTimeField getField()
    {
      return this.iPartial.getField(this.iFieldIndex);
    }

    public Partial getPartial()
    {
      return this.iPartial;
    }

    protected ReadablePartial getReadablePartial()
    {
      return this.iPartial;
    }

    public Partial setCopy(int paramInt)
    {
      int[] arrayOfInt1 = this.iPartial.getValues();
      int[] arrayOfInt2 = getField().set(this.iPartial, this.iFieldIndex, arrayOfInt1, paramInt);
      return new Partial(this.iPartial, arrayOfInt2);
    }

    public Partial setCopy(String paramString)
    {
      return setCopy(paramString, null);
    }

    public Partial setCopy(String paramString, Locale paramLocale)
    {
      int[] arrayOfInt1 = this.iPartial.getValues();
      int[] arrayOfInt2 = getField().set(this.iPartial, this.iFieldIndex, arrayOfInt1, paramString, paramLocale);
      return new Partial(this.iPartial, arrayOfInt2);
    }

    public Partial withMaximumValue()
    {
      return setCopy(getMaximumValue());
    }

    public Partial withMinimumValue()
    {
      return setCopy(getMinimumValue());
    }
  }
}