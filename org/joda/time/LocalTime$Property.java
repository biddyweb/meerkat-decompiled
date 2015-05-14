package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class LocalTime$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = -325842547277223L;
  private transient DateTimeField iField;
  private transient LocalTime iInstant;

  LocalTime$Property(LocalTime paramLocalTime, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramLocalTime;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((LocalTime)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public LocalTime addCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.add(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalTime addCopy(long paramLong)
  {
    return this.iInstant.withLocalMillis(this.iField.add(this.iInstant.getLocalMillis(), paramLong));
  }

  public LocalTime addNoWrapToCopy(int paramInt)
  {
    long l = this.iField.add(this.iInstant.getLocalMillis(), paramInt);
    if (this.iInstant.getChronology().millisOfDay().get(l) != l)
      throw new IllegalArgumentException("The addition exceeded the boundaries of LocalTime");
    return this.iInstant.withLocalMillis(l);
  }

  public LocalTime addWrapFieldToCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.addWrapField(this.iInstant.getLocalMillis(), paramInt));
  }

  protected Chronology getChronology()
  {
    return this.iInstant.getChronology();
  }

  public DateTimeField getField()
  {
    return this.iField;
  }

  public LocalTime getLocalTime()
  {
    return this.iInstant;
  }

  protected long getMillis()
  {
    return this.iInstant.getLocalMillis();
  }

  public LocalTime roundCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalTime roundFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundFloor(this.iInstant.getLocalMillis()));
  }

  public LocalTime roundHalfCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalTime roundHalfEvenCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfEven(this.iInstant.getLocalMillis()));
  }

  public LocalTime roundHalfFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfFloor(this.iInstant.getLocalMillis()));
  }

  public LocalTime setCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalTime setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public LocalTime setCopy(String paramString, Locale paramLocale)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramString, paramLocale));
  }

  public LocalTime withMaximumValue()
  {
    return setCopy(getMaximumValue());
  }

  public LocalTime withMinimumValue()
  {
    return setCopy(getMinimumValue());
  }
}