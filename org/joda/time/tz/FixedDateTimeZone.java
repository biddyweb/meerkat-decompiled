package org.joda.time.tz;

import java.util.SimpleTimeZone;
import java.util.TimeZone;
import org.joda.time.DateTimeZone;

public final class FixedDateTimeZone extends DateTimeZone
{
  private static final long serialVersionUID = -3513011772763289092L;
  private final String iNameKey;
  private final int iStandardOffset;
  private final int iWallOffset;

  public FixedDateTimeZone(String paramString1, String paramString2, int paramInt1, int paramInt2)
  {
    super(paramString1);
    this.iNameKey = paramString2;
    this.iWallOffset = paramInt1;
    this.iStandardOffset = paramInt2;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    FixedDateTimeZone localFixedDateTimeZone;
    do
    {
      return true;
      if (!(paramObject instanceof FixedDateTimeZone))
        break;
      localFixedDateTimeZone = (FixedDateTimeZone)paramObject;
    }
    while ((getID().equals(localFixedDateTimeZone.getID())) && (this.iStandardOffset == localFixedDateTimeZone.iStandardOffset) && (this.iWallOffset == localFixedDateTimeZone.iWallOffset));
    return false;
    return false;
  }

  public String getNameKey(long paramLong)
  {
    return this.iNameKey;
  }

  public int getOffset(long paramLong)
  {
    return this.iWallOffset;
  }

  public int getOffsetFromLocal(long paramLong)
  {
    return this.iWallOffset;
  }

  public int getStandardOffset(long paramLong)
  {
    return this.iStandardOffset;
  }

  public int hashCode()
  {
    return getID().hashCode() + 37 * this.iStandardOffset + 31 * this.iWallOffset;
  }

  public boolean isFixed()
  {
    return true;
  }

  public long nextTransition(long paramLong)
  {
    return paramLong;
  }

  public long previousTransition(long paramLong)
  {
    return paramLong;
  }

  public TimeZone toTimeZone()
  {
    String str = getID();
    if ((str.length() == 6) && ((str.startsWith("+")) || (str.startsWith("-"))))
      return TimeZone.getTimeZone("GMT" + getID());
    return new SimpleTimeZone(this.iWallOffset, getID());
  }
}