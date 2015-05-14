package org.ocpsoft.prettytime.units;

import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.impl.ResourcesTimeUnit;

public class Minute extends ResourcesTimeUnit
  implements TimeUnit
{
  public Minute()
  {
    setMillisPerUnit(60000L);
  }

  protected String getResourceKeyPrefix()
  {
    return "Minute";
  }
}