package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class DateTime$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = -6983323811635733510L;
  private DateTimeField iField;
  private DateTime iInstant;

  DateTime$Property(DateTime paramDateTime, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramDateTime;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((DateTime)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public DateTime addToCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.add(this.iInstant.getMillis(), paramInt));
  }

  public DateTime addToCopy(long paramLong)
  {
    return this.iInstant.withMillis(this.iField.add(this.iInstant.getMillis(), paramLong));
  }

  public DateTime addWrapFieldToCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.addWrapField(this.iInstant.getMillis(), paramInt));
  }

  protected Chronology getChronology()
  {
    return this.iInstant.getChronology();
  }

  public DateTime getDateTime()
  {
    return this.iInstant;
  }

  public DateTimeField getField()
  {
    return this.iField;
  }

  protected long getMillis()
  {
    return this.iInstant.getMillis();
  }

  public DateTime roundCeilingCopy()
  {
    return this.iInstant.withMillis(this.iField.roundCeiling(this.iInstant.getMillis()));
  }

  public DateTime roundFloorCopy()
  {
    return this.iInstant.withMillis(this.iField.roundFloor(this.iInstant.getMillis()));
  }

  public DateTime roundHalfCeilingCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfCeiling(this.iInstant.getMillis()));
  }

  public DateTime roundHalfEvenCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfEven(this.iInstant.getMillis()));
  }

  public DateTime roundHalfFloorCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfFloor(this.iInstant.getMillis()));
  }

  public DateTime setCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.set(this.iInstant.getMillis(), paramInt));
  }

  public DateTime setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public DateTime setCopy(String paramString, Locale paramLocale)
  {
    return this.iInstant.withMillis(this.iField.set(this.iInstant.getMillis(), paramString, paramLocale));
  }

  public DateTime withMaximumValue()
  {
    try
    {
      DateTime localDateTime = setCopy(getMaximumValue());
      return localDateTime;
    }
    catch (RuntimeException localRuntimeException)
    {
      if (IllegalInstantException.isIllegalInstant(localRuntimeException))
        return new DateTime(getChronology().getZone().previousTransition(86400000L + getMillis()), getChronology());
      throw localRuntimeException;
    }
  }

  public DateTime withMinimumValue()
  {
    try
    {
      DateTime localDateTime = setCopy(getMinimumValue());
      return localDateTime;
    }
    catch (RuntimeException localRuntimeException)
    {
      if (IllegalInstantException.isIllegalInstant(localRuntimeException))
        return new DateTime(getChronology().getZone().nextTransition(getMillis() - 86400000L), getChronology());
      throw localRuntimeException;
    }
  }
}