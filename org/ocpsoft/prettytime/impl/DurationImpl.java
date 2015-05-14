package org.ocpsoft.prettytime.impl;

import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeUnit;

public class DurationImpl
  implements Duration
{
  private long delta;
  private long quantity;
  private TimeUnit unit;

  public long getDelta()
  {
    return this.delta;
  }

  public long getQuantity()
  {
    return this.quantity;
  }

  public long getQuantityRounded(int paramInt)
  {
    long l = Math.abs(getQuantity());
    if ((getDelta() != 0L) && (Math.abs(100.0D * (getDelta() / getUnit().getMillisPerUnit())) > paramInt))
      l += 1L;
    return l;
  }

  public TimeUnit getUnit()
  {
    return this.unit;
  }

  public boolean isInFuture()
  {
    return !isInPast();
  }

  public boolean isInPast()
  {
    return getQuantity() < 0L;
  }

  public void setDelta(long paramLong)
  {
    this.delta = paramLong;
  }

  public void setQuantity(long paramLong)
  {
    this.quantity = paramLong;
  }

  public void setUnit(TimeUnit paramTimeUnit)
  {
    this.unit = paramTimeUnit;
  }

  public String toString()
  {
    return "DurationImpl [" + this.quantity + " " + this.unit + ", delta=" + this.delta + "]";
  }
}