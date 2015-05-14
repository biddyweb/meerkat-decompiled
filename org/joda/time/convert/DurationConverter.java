package org.joda.time.convert;

public abstract interface DurationConverter extends Converter
{
  public abstract long getDurationMillis(Object paramObject);
}