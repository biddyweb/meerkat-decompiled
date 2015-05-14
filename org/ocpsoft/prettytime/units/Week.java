package org.ocpsoft.prettytime.units;

import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.impl.ResourcesTimeUnit;

public class Week extends ResourcesTimeUnit
  implements TimeUnit
{
  public Week()
  {
    setMillisPerUnit(604800000L);
  }

  protected String getResourceKeyPrefix()
  {
    return "Week";
  }
}