package org.joda.time.base;

import java.io.Serializable;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeUtils;
import org.joda.time.ReadablePartial;
import org.joda.time.convert.ConverterManager;
import org.joda.time.convert.PartialConverter;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public abstract class BasePartial extends AbstractPartial
  implements ReadablePartial, Serializable
{
  private static final long serialVersionUID = 2353678632973660L;
  private final Chronology iChronology;
  private final int[] iValues;

  protected BasePartial()
  {
    this(DateTimeUtils.currentTimeMillis(), null);
  }

  protected BasePartial(long paramLong)
  {
    this(paramLong, null);
  }

  protected BasePartial(long paramLong, Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    this.iChronology = localChronology.withUTC();
    this.iValues = localChronology.get(this, paramLong);
  }

  protected BasePartial(Object paramObject, Chronology paramChronology)
  {
    PartialConverter localPartialConverter = ConverterManager.getInstance().getPartialConverter(paramObject);
    Chronology localChronology = DateTimeUtils.getChronology(localPartialConverter.getChronology(paramObject, paramChronology));
    this.iChronology = localChronology.withUTC();
    this.iValues = localPartialConverter.getPartialValues(this, paramObject, localChronology);
  }

  protected BasePartial(Object paramObject, Chronology paramChronology, DateTimeFormatter paramDateTimeFormatter)
  {
    PartialConverter localPartialConverter = ConverterManager.getInstance().getPartialConverter(paramObject);
    Chronology localChronology = DateTimeUtils.getChronology(localPartialConverter.getChronology(paramObject, paramChronology));
    this.iChronology = localChronology.withUTC();
    this.iValues = localPartialConverter.getPartialValues(this, paramObject, localChronology, paramDateTimeFormatter);
  }

  protected BasePartial(Chronology paramChronology)
  {
    this(DateTimeUtils.currentTimeMillis(), paramChronology);
  }

  protected BasePartial(BasePartial paramBasePartial, Chronology paramChronology)
  {
    this.iChronology = paramChronology.withUTC();
    this.iValues = paramBasePartial.iValues;
  }

  protected BasePartial(BasePartial paramBasePartial, int[] paramArrayOfInt)
  {
    this.iChronology = paramBasePartial.iChronology;
    this.iValues = paramArrayOfInt;
  }

  protected BasePartial(int[] paramArrayOfInt, Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    this.iChronology = localChronology.withUTC();
    localChronology.validate(this, paramArrayOfInt);
    this.iValues = paramArrayOfInt;
  }

  public Chronology getChronology()
  {
    return this.iChronology;
  }

  public int getValue(int paramInt)
  {
    return this.iValues[paramInt];
  }

  public int[] getValues()
  {
    return (int[])this.iValues.clone();
  }

  protected void setValue(int paramInt1, int paramInt2)
  {
    System.arraycopy(getField(paramInt1).set(this, paramInt1, this.iValues, paramInt2), 0, this.iValues, 0, this.iValues.length);
  }

  protected void setValues(int[] paramArrayOfInt)
  {
    getChronology().validate(this, paramArrayOfInt);
    System.arraycopy(paramArrayOfInt, 0, this.iValues, 0, this.iValues.length);
  }

  public String toString(String paramString)
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).print(this);
  }

  public String toString(String paramString, Locale paramLocale)
    throws IllegalArgumentException
  {
    if (paramString == null)
      return toString();
    return DateTimeFormat.forPattern(paramString).withLocale(paramLocale).print(this);
  }
}