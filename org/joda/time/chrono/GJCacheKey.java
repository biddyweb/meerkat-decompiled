package org.joda.time.chrono;

import org.joda.time.DateTimeZone;
import org.joda.time.Instant;

class GJCacheKey
{
  private final Instant cutoverInstant;
  private final int minDaysInFirstWeek;
  private final DateTimeZone zone;

  GJCacheKey(DateTimeZone paramDateTimeZone, Instant paramInstant, int paramInt)
  {
    this.zone = paramDateTimeZone;
    this.cutoverInstant = paramInstant;
    this.minDaysInFirstWeek = paramInt;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    GJCacheKey localGJCacheKey;
    do
    {
      do
      {
        return true;
        if (paramObject == null)
          return false;
        if (!(paramObject instanceof GJCacheKey))
          return false;
        localGJCacheKey = (GJCacheKey)paramObject;
        if (this.cutoverInstant == null)
        {
          if (localGJCacheKey.cutoverInstant != null)
            return false;
        }
        else if (!this.cutoverInstant.equals(localGJCacheKey.cutoverInstant))
          return false;
        if (this.minDaysInFirstWeek != localGJCacheKey.minDaysInFirstWeek)
          return false;
        if (this.zone != null)
          break;
      }
      while (localGJCacheKey.zone == null);
      return false;
    }
    while (this.zone.equals(localGJCacheKey.zone));
    return false;
  }

  public int hashCode()
  {
    int i;
    int j;
    int k;
    if (this.cutoverInstant == null)
    {
      i = 0;
      j = 31 * (31 * (i + 31) + this.minDaysInFirstWeek);
      DateTimeZone localDateTimeZone = this.zone;
      k = 0;
      if (localDateTimeZone != null)
        break label53;
    }
    while (true)
    {
      return j + k;
      i = this.cutoverInstant.hashCode();
      break;
      label53: k = this.zone.hashCode();
    }
  }
}