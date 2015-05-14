package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationFieldType;
import org.joda.time.field.DelegatedDateTimeField;
import org.joda.time.field.DividedDateTimeField;
import org.joda.time.field.OffsetDateTimeField;
import org.joda.time.field.RemainderDateTimeField;
import org.joda.time.field.SkipUndoDateTimeField;
import org.joda.time.field.UnsupportedDurationField;

public final class BuddhistChronology extends AssembledChronology
{
  public static final int BE = 1;
  private static final int BUDDHIST_OFFSET = 543;
  private static final DateTimeField ERA_FIELD = new BasicSingleEraDateTimeField("BE");
  private static final BuddhistChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);
  private static final ConcurrentHashMap<DateTimeZone, BuddhistChronology> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -3474595157769370126L;

  private BuddhistChronology(Chronology paramChronology, Object paramObject)
  {
    super(paramChronology, paramObject);
  }

  public static BuddhistChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault());
  }

  public static BuddhistChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    BuddhistChronology localBuddhistChronology1 = (BuddhistChronology)cCache.get(paramDateTimeZone);
    BuddhistChronology localBuddhistChronology3;
    if (localBuddhistChronology1 == null)
    {
      BuddhistChronology localBuddhistChronology2 = new BuddhistChronology(GJChronology.getInstance(paramDateTimeZone, null), null);
      localBuddhistChronology3 = new BuddhistChronology(LimitChronology.getInstance(localBuddhistChronology2, new DateTime(1, 1, 1, 0, 0, 0, 0, localBuddhistChronology2), null), "");
      localBuddhistChronology1 = (BuddhistChronology)cCache.putIfAbsent(paramDateTimeZone, localBuddhistChronology3);
      if (localBuddhistChronology1 == null);
    }
    else
    {
      return localBuddhistChronology1;
    }
    return localBuddhistChronology3;
  }

  public static BuddhistChronology getInstanceUTC()
  {
    return INSTANCE_UTC;
  }

  private Object readResolve()
  {
    Chronology localChronology = getBase();
    if (localChronology == null)
      return getInstanceUTC();
    return getInstance(localChronology.getZone());
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    if (getParam() == null)
    {
      paramFields.eras = UnsupportedDurationField.getInstance(DurationFieldType.eras());
      paramFields.year = new OffsetDateTimeField(new SkipUndoDateTimeField(this, paramFields.year), 543);
      paramFields.yearOfEra = new DelegatedDateTimeField(paramFields.year, paramFields.eras, DateTimeFieldType.yearOfEra());
      paramFields.weekyear = new OffsetDateTimeField(new SkipUndoDateTimeField(this, paramFields.weekyear), 543);
      paramFields.centuryOfEra = new DividedDateTimeField(new OffsetDateTimeField(paramFields.yearOfEra, 99), paramFields.eras, DateTimeFieldType.centuryOfEra(), 100);
      paramFields.centuries = paramFields.centuryOfEra.getDurationField();
      paramFields.yearOfCentury = new OffsetDateTimeField(new RemainderDateTimeField((DividedDateTimeField)paramFields.centuryOfEra), DateTimeFieldType.yearOfCentury(), 1);
      paramFields.weekyearOfCentury = new OffsetDateTimeField(new RemainderDateTimeField(paramFields.weekyear, paramFields.centuries, DateTimeFieldType.weekyearOfCentury(), 100), DateTimeFieldType.weekyearOfCentury(), 1);
      paramFields.era = ERA_FIELD;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if ((paramObject instanceof BuddhistChronology))
    {
      BuddhistChronology localBuddhistChronology = (BuddhistChronology)paramObject;
      return getZone().equals(localBuddhistChronology.getZone());
    }
    return false;
  }

  public int hashCode()
  {
    return 11 * "Buddhist".hashCode() + getZone().hashCode();
  }

  public String toString()
  {
    String str = "BuddhistChronology";
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
}