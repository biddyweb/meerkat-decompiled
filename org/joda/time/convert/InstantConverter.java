package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;

public abstract interface InstantConverter extends Converter
{
  public abstract Chronology getChronology(Object paramObject, Chronology paramChronology);

  public abstract Chronology getChronology(Object paramObject, DateTimeZone paramDateTimeZone);

  public abstract long getInstantMillis(Object paramObject, Chronology paramChronology);
}