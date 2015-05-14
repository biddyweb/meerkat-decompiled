package org.ocpsoft.prettytime;

public abstract interface TimeUnit
{
  public abstract long getMaxQuantity();

  public abstract long getMillisPerUnit();
}