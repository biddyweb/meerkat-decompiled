package org.ocpsoft.prettytime.units;

import java.io.Serializable;
import java.util.Comparator;
import org.ocpsoft.prettytime.TimeUnit;

public class TimeUnitComparator
  implements Comparator<TimeUnit>, Serializable
{
  private static final long serialVersionUID = 1L;

  public int compare(TimeUnit paramTimeUnit1, TimeUnit paramTimeUnit2)
  {
    if (paramTimeUnit1.getMillisPerUnit() < paramTimeUnit2.getMillisPerUnit())
      return -1;
    if (paramTimeUnit1.getMillisPerUnit() > paramTimeUnit2.getMillisPerUnit())
      return 1;
    return 0;
  }
}