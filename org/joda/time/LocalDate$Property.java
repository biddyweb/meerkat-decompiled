package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class LocalDate$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = -3193829732634L;
  private transient DateTimeField iField;
  private transient LocalDate iInstant;

  LocalDate$Property(LocalDate paramLocalDate, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramLocalDate;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((LocalDate)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public LocalDate addToCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.add(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalDate addWrapFieldToCopy(int paramInt)
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

  public LocalDate getLocalDate()
  {
    return this.iInstant;
  }

  protected long getMillis()
  {
    return this.iInstant.getLocalMillis();
  }

  public LocalDate roundCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalDate roundFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundFloor(this.iInstant.getLocalMillis()));
  }

  public LocalDate roundHalfCeilingCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfCeiling(this.iInstant.getLocalMillis()));
  }

  public LocalDate roundHalfEvenCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfEven(this.iInstant.getLocalMillis()));
  }

  public LocalDate roundHalfFloorCopy()
  {
    return this.iInstant.withLocalMillis(this.iField.roundHalfFloor(this.iInstant.getLocalMillis()));
  }

  public LocalDate setCopy(int paramInt)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramInt));
  }

  public LocalDate setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public LocalDate setCopy(String paramString, Locale paramLocale)
  {
    return this.iInstant.withLocalMillis(this.iField.set(this.iInstant.getLocalMillis(), paramString, paramLocale));
  }

  public LocalDate withMaximumValue()
  {
    return setCopy(getMaximumValue());
  }

  public LocalDate withMinimumValue()
  {
    return setCopy(getMinimumValue());
  }
}