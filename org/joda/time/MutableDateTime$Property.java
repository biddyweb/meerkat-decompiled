package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Locale;
import org.joda.time.field.AbstractReadableInstantFieldProperty;

public final class MutableDateTime$Property extends AbstractReadableInstantFieldProperty
{
  private static final long serialVersionUID = -4481126543819298617L;
  private DateTimeField iField;
  private MutableDateTime iInstant;

  MutableDateTime$Property(MutableDateTime paramMutableDateTime, DateTimeField paramDateTimeField)
  {
    this.iInstant = paramMutableDateTime;
    this.iField = paramDateTimeField;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.iInstant = ((MutableDateTime)paramObjectInputStream.readObject());
    this.iField = ((DateTimeFieldType)paramObjectInputStream.readObject()).getField(this.iInstant.getChronology());
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(this.iInstant);
    paramObjectOutputStream.writeObject(this.iField.getType());
  }

  public MutableDateTime add(int paramInt)
  {
    this.iInstant.setMillis(getField().add(this.iInstant.getMillis(), paramInt));
    return this.iInstant;
  }

  public MutableDateTime add(long paramLong)
  {
    this.iInstant.setMillis(getField().add(this.iInstant.getMillis(), paramLong));
    return this.iInstant;
  }

  public MutableDateTime addWrapField(int paramInt)
  {
    this.iInstant.setMillis(getField().addWrapField(this.iInstant.getMillis(), paramInt));
    return this.iInstant;
  }

  protected Chronology getChronology()
  {
    return this.iInstant.getChronology();
  }

  public DateTimeField getField()
  {
    return this.iField;
  }

  protected long getMillis()
  {
    return this.iInstant.getMillis();
  }

  public MutableDateTime getMutableDateTime()
  {
    return this.iInstant;
  }

  public MutableDateTime roundCeiling()
  {
    this.iInstant.setMillis(getField().roundCeiling(this.iInstant.getMillis()));
    return this.iInstant;
  }

  public MutableDateTime roundFloor()
  {
    this.iInstant.setMillis(getField().roundFloor(this.iInstant.getMillis()));
    return this.iInstant;
  }

  public MutableDateTime roundHalfCeiling()
  {
    this.iInstant.setMillis(getField().roundHalfCeiling(this.iInstant.getMillis()));
    return this.iInstant;
  }

  public MutableDateTime roundHalfEven()
  {
    this.iInstant.setMillis(getField().roundHalfEven(this.iInstant.getMillis()));
    return this.iInstant;
  }

  public MutableDateTime roundHalfFloor()
  {
    this.iInstant.setMillis(getField().roundHalfFloor(this.iInstant.getMillis()));
    return this.iInstant;
  }

  public MutableDateTime set(int paramInt)
  {
    this.iInstant.setMillis(getField().set(this.iInstant.getMillis(), paramInt));
    return this.iInstant;
  }

  public MutableDateTime set(String paramString)
  {
    set(paramString, null);
    return this.iInstant;
  }

  public MutableDateTime set(String paramString, Locale paramLocale)
  {
    this.iInstant.setMillis(getField().set(this.iInstant.getMillis(), paramString, paramLocale));
    return this.iInstant;
  }
}