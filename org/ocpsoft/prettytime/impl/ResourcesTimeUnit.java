package org.ocpsoft.prettytime.impl;

import org.ocpsoft.prettytime.TimeUnit;

public abstract class ResourcesTimeUnit
  implements TimeUnit
{
  private long maxQuantity = 0L;
  private long millisPerUnit = 1L;

  public long getMaxQuantity()
  {
    return this.maxQuantity;
  }

  public long getMillisPerUnit()
  {
    return this.millisPerUnit;
  }

  protected String getResourceBundleName()
  {
    return "org.ocpsoft.prettytime.i18n.Resources";
  }

  protected abstract String getResourceKeyPrefix();

  public void setMaxQuantity(long paramLong)
  {
    this.maxQuantity = paramLong;
  }

  public void setMillisPerUnit(long paramLong)
  {
    this.millisPerUnit = paramLong;
  }

  public String toString()
  {
    return getResourceKeyPrefix();
  }
}