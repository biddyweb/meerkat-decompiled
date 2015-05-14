package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class DateMidnight$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = 257629620L;
  private DateTimeField iField;
  private DateMidnight iInstant;

  DateMidnight$Property(DateMidnight paramDateMidnight, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramDateMidnight;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((DateMidnight)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public DateMidnight addToCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.add(this.iInstant.getMillis(), paramInt));
  }

  public DateMidnight addToCopy(long paramLong)
  {
    return this.iInstant.withMillis(this.iField.add(this.iInstant.getMillis(), paramLong));
  }

  public DateMidnight addWrapFieldToCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.addWrapField(this.iInstant.getMillis(), paramInt));
  }

  protected Chronology getChronology()
  {
    return this.iInstant.getChronology();
  }

  public DateMidnight getDateMidnight()
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

  public DateMidnight roundCeilingCopy()
  {
    return this.iInstant.withMillis(this.iField.roundCeiling(this.iInstant.getMillis()));
  }

  public DateMidnight roundFloorCopy()
  {
    return this.iInstant.withMillis(this.iField.roundFloor(this.iInstant.getMillis()));
  }

  public DateMidnight roundHalfCeilingCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfCeiling(this.iInstant.getMillis()));
  }

  public DateMidnight roundHalfEvenCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfEven(this.iInstant.getMillis()));
  }

  public DateMidnight roundHalfFloorCopy()
  {
    return this.iInstant.withMillis(this.iField.roundHalfFloor(this.iInstant.getMillis()));
  }

  public DateMidnight setCopy(int paramInt)
  {
    return this.iInstant.withMillis(this.iField.set(this.iInstant.getMillis(), paramInt));
  }

  public DateMidnight setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public DateMidnight setCopy(String paramString, Locale paramLocale)
  {
    return this.iInstant.withMillis(this.iField.set(this.iInstant.getMillis(), paramString, paramLocale));
  }

  public DateMidnight withMaximumValue()
  {
    return setCopy(getMaximumValue());
  }

  public DateMidnight withMinimumValue()
  {
    return setCopy(getMinimumValue());
  }
}