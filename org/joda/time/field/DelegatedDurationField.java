package org.joda.time.field;

import java.io.Serializable;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;

public class DelegatedDurationField extends DurationField
  implements Serializable
{
  private static final long serialVersionUID = -5576443481242007829L;
  private final DurationField iField;
  private final DurationFieldType iType;

  protected DelegatedDurationField(DurationField paramDurationField)
  {
    this(paramDurationField, null);
  }

  protected DelegatedDurationField(DurationField paramDurationField, DurationFieldType paramDurationFieldType)
  {
    if (paramDurationField == null)
      throw new IllegalArgumentException("The field must not be null");
    this.iField = paramDurationField;
    if (paramDurationFieldType == null)
      paramDurationFieldType = paramDurationField.getType();
    this.iType = paramDurationFieldType;
  }

  public long add(long paramLong, int paramInt)
  {
    return this.iField.add(paramLong, paramInt);
  }

  public long add(long paramLong1, long paramLong2)
  {
    return this.iField.add(paramLong1, paramLong2);
  }

  public int compareTo(DurationField paramDurationField)
  {
    return this.iField.compareTo(paramDurationField);
  }

  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof DelegatedDurationField))
      return this.iField.equals(((DelegatedDurationField)paramObject).iField);
    return false;
  }

  public int getDifference(long paramLong1, long paramLong2)
  {
    return this.iField.getDifference(paramLong1, paramLong2);
  }

  public long getDifferenceAsLong(long paramLong1, long paramLong2)
  {
    return this.iField.getDifferenceAsLong(paramLong1, paramLong2);
  }

  public long getMillis(int paramInt)
  {
    return this.iField.getMillis(paramInt);
  }

  public long getMillis(int paramInt, long paramLong)
  {
    return this.iField.getMillis(paramInt, paramLong);
  }

  public long getMillis(long paramLong)
  {
    return this.iField.getMillis(paramLong);
  }

  public long getMillis(long paramLong1, long paramLong2)
  {
    return this.iField.getMillis(paramLong1, paramLong2);
  }

  public String getName()
  {
    return this.iType.getName();
  }

  public DurationFieldType getType()
  {
    return this.iType;
  }

  public long getUnitMillis()
  {
    return this.iField.getUnitMillis();
  }

  public int getValue(long paramLong)
  {
    return this.iField.getValue(paramLong);
  }

  public int getValue(long paramLong1, long paramLong2)
  {
    return this.iField.getValue(paramLong1, paramLong2);
  }

  public long getValueAsLong(long paramLong)
  {
    return this.iField.getValueAsLong(paramLong);
  }

  public long getValueAsLong(long paramLong1, long paramLong2)
  {
    return this.iField.getValueAsLong(paramLong1, paramLong2);
  }

  public final DurationField getWrappedField()
  {
    return this.iField;
  }

  public int hashCode()
  {
    return this.iField.hashCode() ^ this.iType.hashCode();
  }

  public boolean isPrecise()
  {
    return this.iField.isPrecise();
  }

  public boolean isSupported()
  {
    return this.iField.isSupported();
  }

  public String toString()
  {
    if (this.iType == null)
      return this.iField.toString();
    return "DurationField[" + this.iType + ']';
  }
}