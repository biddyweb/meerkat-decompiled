package org.joda.time.tz;

import java.util.Set;
import org.joda.time.DateTimeZone;

public abstract interface Provider
{
  public abstract Set<String> getAvailableIDs();

  public abstract DateTimeZone getZone(String paramString);
}