package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class LocalDateTime$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = -358138762846288L;
  private transient DateTimeField iField;
  private transient LocalDateTime iInstant;

  LocalDateTime$Property(LocalDateTime paramLocalDateTime, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramLocalDateTime;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((LocalDateTime)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public LocalDateTime addToCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.add(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalDateTime addToCopy(long paramLong)
  {
    return this.iInstant.withLocalMillis(this.iField.add(this.iInstant.getLocalMillis(), paramLong));
  }

  public LocalDateTime addWrapFieldToCopy(int paramInt)
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

  public LocalDateTime getLocalDateTime()
  {
    return this.iInstant;
  }

  protected long getMillis()
  {
    return this.iInstant.getLocalMillis();
  }

  public LocalDateTime roundCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalDateTime roundFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundFloor(this.iInstant.getLocalMillis()));
  }

  public LocalDateTime roundHalfCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalDateTime roundHalfEvenCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfEven(this.iInstant.getLocalMillis()));
  }

  public LocalDateTime roundHalfFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfFloor(this.iInstant.getLocalMillis()));
  }

  public LocalDateTime setCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalDateTime setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public LocalDateTime setCopy(String paramString, Locale paramLocale)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramString, paramLocale));
  }

  public LocalDateTime withMaximumValue()
  {
    return setCopy(getMaximumValue());
  }

  public LocalDateTime withMinimumValue()
  {
    return setCopy(getMinimumValue());
  }
}