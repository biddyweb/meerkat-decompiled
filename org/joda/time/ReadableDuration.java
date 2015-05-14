package org.joda.time;

public abstract interface ReadableDuration extends Comparable<ReadableDuration>
{
  public abstract boolean equals(Object paramObject);

  public abstract long getMillis();

  public abstract int hashCode();

  public abstract boolean isEqual(ReadableDuration paramReadableDuration);

  public abstract boolean isLongerThan(ReadableDuration paramReadableDuration);

  public abstract boolean isShorterThan(ReadableDuration paramReadableDuration);

  public abstract Duration toDuration();

  public abstract Period toPeriod();

  public abstract String toString();
}