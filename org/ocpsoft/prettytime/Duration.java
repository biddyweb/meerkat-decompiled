package org.ocpsoft.prettytime;

public abstract interface Duration
{
  public abstract long getDelta();

  public abstract long getQuantity();

  public abstract long getQuantityRounded(int paramInt);

  public abstract TimeUnit getUnit();

  public abstract boolean isInFuture();

  public abstract boolean isInPast();
}