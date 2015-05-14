package org.joda.time.tz;

import org.joda.time.DateTimeZone;

public class CachedDateTimeZone extends DateTimeZone
{
  private static final int cInfoCacheMask = 0;
  private static final long serialVersionUID = 5472298452022250685L;
  private final transient Info[] iInfoCache = new Info[1 + cInfoCacheMask];
  private final DateTimeZone iZone;

  static
  {
    try
    {
      Integer localInteger2 = Integer.getInteger("org.joda.time.tz.CachedDateTimeZone.size");
      localInteger1 = localInteger2;
      if (localInteger1 == null)
      {
        k = 512;
        cInfoCacheMask = k - 1;
        return;
      }
    }
    catch (SecurityException localSecurityException)
    {
      while (true)
      {
        Integer localInteger1 = null;
        continue;
        int i = -1 + localInteger1.intValue();
        int j = 0;
        while (i > 0)
        {
          j++;
          i >>= 1;
        }
        int k = 1 << j;
      }
    }
  }

  private CachedDateTimeZone(DateTimeZone paramDateTimeZone)
  {
    super(paramDateTimeZone.getID());
    this.iZone = paramDateTimeZone;
  }

  private Info createInfo(long paramLong)
  {
    long l1 = paramLong & 0x0;
    Info localInfo1 = new Info(this.iZone, l1);
    long l2 = l1 | 0xFFFFFFFF;
    Object localObject = localInfo1;
    while (true)
    {
      long l3 = this.iZone.nextTransition(l1);
      if ((l3 == l1) || (l3 > l2))
        return localInfo1;
      Info localInfo2 = new Info(this.iZone, l3);
      ((Info)localObject).iNextInfo = localInfo2;
      localObject = localInfo2;
      l1 = l3;
    }
  }

  public static CachedDateTimeZone forZone(DateTimeZone paramDateTimeZone)
  {
    if ((paramDateTimeZone instanceof CachedDateTimeZone))
      return (CachedDateTimeZone)paramDateTimeZone;
    return new CachedDateTimeZone(paramDateTimeZone);
  }

  private Info getInfo(long paramLong)
  {
    int i = (int)(paramLong >> 32);
    Info[] arrayOfInfo = this.iInfoCache;
    int j = i & cInfoCacheMask;
    Info localInfo = arrayOfInfo[j];
    if ((localInfo == null) || ((int)(localInfo.iPeriodStart >> 32) != i))
    {
      localInfo = createInfo(paramLong);
      arrayOfInfo[j] = localInfo;
    }
    return localInfo;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if ((paramObject instanceof CachedDateTimeZone))
      return this.iZone.equals(((CachedDateTimeZone)paramObject).iZone);
    return false;
  }

  public String getNameKey(long paramLong)
  {
    return getInfo(paramLong).getNameKey(paramLong);
  }

  public int getOffset(long paramLong)
  {
    return getInfo(paramLong).getOffset(paramLong);
  }

  public int getStandardOffset(long paramLong)
  {
    return getInfo(paramLong).getStandardOffset(paramLong);
  }

  public DateTimeZone getUncachedZone()
  {
    return this.iZone;
  }

  public int hashCode()
  {
    return this.iZone.hashCode();
  }

  public boolean isFixed()
  {
    return this.iZone.isFixed();
  }

  public long nextTransition(long paramLong)
  {
    return this.iZone.nextTransition(paramLong);
  }

  public long previousTransition(long paramLong)
  {
    return this.iZone.previousTransition(paramLong);
  }

  private static final class Info
  {
    private String iNameKey;
    Info iNextInfo;
    private int iOffset = -2147483648;
    public final long iPeriodStart;
    private int iStandardOffset = -2147483648;
    public final DateTimeZone iZoneRef;

    Info(DateTimeZone paramDateTimeZone, long paramLong)
    {
      this.iPeriodStart = paramLong;
      this.iZoneRef = paramDateTimeZone;
    }

    public String getNameKey(long paramLong)
    {
      if ((this.iNextInfo == null) || (paramLong < this.iNextInfo.iPeriodStart))
      {
        if (this.iNameKey == null)
          this.iNameKey = this.iZoneRef.getNameKey(this.iPeriodStart);
        return this.iNameKey;
      }
      return this.iNextInfo.getNameKey(paramLong);
    }

    public int getOffset(long paramLong)
    {
      if ((this.iNextInfo == null) || (paramLong < this.iNextInfo.iPeriodStart))
      {
        if (this.iOffset == -2147483648)
          this.iOffset = this.iZoneRef.getOffset(this.iPeriodStart);
        return this.iOffset;
      }
      return this.iNextInfo.getOffset(paramLong);
    }

    public int getStandardOffset(long paramLong)
    {
      if ((this.iNextInfo == null) || (paramLong < this.iNextInfo.iPeriodStart))
      {
        if (this.iStandardOffset == -2147483648)
          this.iStandardOffset = this.iZoneRef.getStandardOffset(this.iPeriodStart);
        return this.iStandardOffset;
      }
      return this.iNextInfo.getStandardOffset(paramLong);
    }
  }
}