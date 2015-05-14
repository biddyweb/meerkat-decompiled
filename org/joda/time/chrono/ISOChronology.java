package org.joda.time.chrono;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeZone;
import org.joda.time.field.DividedDateTimeField;
import org.joda.time.field.RemainderDateTimeField;

public final class ISOChronology extends AssembledChronology
{
  private static final ISOChronology INSTANCE_UTC;
  private static final ConcurrentHashMap<DateTimeZone, ISOChronology> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -6212696554273812441L;

  static
  {
    INSTANCE_UTC = new ISOChronology(GregorianChronology.getInstanceUTC());
    cCache.put(DateTimeZone.UTC, INSTANCE_UTC);
  }

  private ISOChronology(Chronology paramChronology)
  {
    super(paramChronology, null);
  }

  public static ISOChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault());
  }

  public static ISOChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    ISOChronology localISOChronology1 = (ISOChronology)cCache.get(paramDateTimeZone);
    ISOChronology localISOChronology2;
    if (localISOChronology1 == null)
    {
      localISOChronology2 = new ISOChronology(ZonedChronology.getInstance(INSTANCE_UTC, paramDateTimeZone));
      localISOChronology1 = (ISOChronology)cCache.putIfAbsent(paramDateTimeZone, localISOChronology2);
      if (localISOChronology1 == null);
    }
    else
    {
      return localISOChronology1;
    }
    return localISOChronology2;
  }

  public static ISOChronology getInstanceUTC()
  {
    return INSTANCE_UTC;
  }

  private Object writeReplace()
  {
    return new Stub(getZone());
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    if (getBase().getZone() == DateTimeZone.UTC)
    {
      paramFields.centuryOfEra = new DividedDateTimeField(ISOYearOfEraDateTimeField.INSTANCE, DateTimeFieldType.centuryOfEra(), 100);
      paramFields.centuries = paramFields.centuryOfEra.getDurationField();
      paramFields.yearOfCentury = new RemainderDateTimeField((DividedDateTimeField)paramFields.centuryOfEra, DateTimeFieldType.yearOfCentury());
      paramFields.weekyearOfCentury = new RemainderDateTimeField((DividedDateTimeField)paramFields.centuryOfEra, paramFields.weekyears, DateTimeFieldType.weekyearOfCentury());
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if ((paramObject instanceof ISOChronology))
    {
      ISOChronology localISOChronology = (ISOChronology)paramObject;
      return getZone().equals(localISOChronology.getZone());
    }
    return false;
  }

  public int hashCode()
  {
    return 11 * "ISO".hashCode() + getZone().hashCode();
  }

  public String toString()
  {
    String str = "ISOChronology";
    DateTimeZone localDateTimeZone = getZone();
    if (localDateTimeZone != null)
      str = str + '[' + localDateTimeZone.getID() + ']';
    return str;
  }

  public Chronology withUTC()
  {
    return INSTANCE_UTC;
  }

  public Chronology withZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    if (paramDateTimeZone == getZone())
      return this;
    return getInstance(paramDateTimeZone);
  }

  private static final class Stub
    implements Serializable
  {
    private static final long serialVersionUID = -6212696554273812441L;
    private transient DateTimeZone iZone;

    Stub(DateTimeZone paramDateTimeZone)
    {
      this.iZone = paramDateTimeZone;
    }

    private void readObject(ObjectInputStream paramObjectInputStream)
      throws IOException, ClassNotFoundException
    {
      this.iZone = ((DateTimeZone)paramObjectInputStream.readObject());
    }

    private Object readResolve()
    {
      return ISOChronology.getInstance(this.iZone);
    }

    private void writeObject(ObjectOutputStream paramObjectOutputStream)
      throws IOException
    {
      paramObjectOutputStream.writeObject(this.iZone);
    }
  }
}