package org.joda.time;

import java.lang.reflect.Method;
import java.text.DateFormatSymbols;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.joda.time.chrono.ISOChronology;

public class DateTimeUtils
{
  private static final SystemMillisProvider SYSTEM_MILLIS_PROVIDER = new SystemMillisProvider();
  private static volatile MillisProvider cMillisProvider = SYSTEM_MILLIS_PROVIDER;
  private static final AtomicReference<Map<String, DateTimeZone>> cZoneNames = new AtomicReference();

  private static Map<String, DateTimeZone> buildDefaultTimeZoneNames()
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    localLinkedHashMap.put("UT", DateTimeZone.UTC);
    localLinkedHashMap.put("UTC", DateTimeZone.UTC);
    localLinkedHashMap.put("GMT", DateTimeZone.UTC);
    put(localLinkedHashMap, "EST", "America/New_York");
    put(localLinkedHashMap, "EDT", "America/New_York");
    put(localLinkedHashMap, "CST", "America/Chicago");
    put(localLinkedHashMap, "CDT", "America/Chicago");
    put(localLinkedHashMap, "MST", "America/Denver");
    put(localLinkedHashMap, "MDT", "America/Denver");
    put(localLinkedHashMap, "PST", "America/Los_Angeles");
    put(localLinkedHashMap, "PDT", "America/Los_Angeles");
    return Collections.unmodifiableMap(localLinkedHashMap);
  }

  private static void checkPermission()
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("CurrentTime.setProvider"));
  }

  public static final long currentTimeMillis()
  {
    return cMillisProvider.getMillis();
  }

  public static final long fromJulianDay(double paramDouble)
  {
    return ()(86400000.0D * (paramDouble - 2440587.5D));
  }

  public static final Chronology getChronology(Chronology paramChronology)
  {
    if (paramChronology == null)
      paramChronology = ISOChronology.getInstance();
    return paramChronology;
  }

  public static final DateFormatSymbols getDateFormatSymbols(Locale paramLocale)
  {
    try
    {
      DateFormatSymbols localDateFormatSymbols = (DateFormatSymbols)DateFormatSymbols.class.getMethod("getInstance", new Class[] { Locale.class }).invoke(null, new Object[] { paramLocale });
      return localDateFormatSymbols;
    }
    catch (Exception localException)
    {
    }
    return new DateFormatSymbols(paramLocale);
  }

  public static final Map<String, DateTimeZone> getDefaultTimeZoneNames()
  {
    Map localMap = (Map)cZoneNames.get();
    if (localMap == null)
    {
      localMap = buildDefaultTimeZoneNames();
      if (!cZoneNames.compareAndSet(null, localMap))
        localMap = (Map)cZoneNames.get();
    }
    return localMap;
  }

  public static final long getDurationMillis(ReadableDuration paramReadableDuration)
  {
    if (paramReadableDuration == null)
      return 0L;
    return paramReadableDuration.getMillis();
  }

  public static final Chronology getInstantChronology(ReadableInstant paramReadableInstant)
  {
    Object localObject;
    if (paramReadableInstant == null)
      localObject = ISOChronology.getInstance();
    do
    {
      return localObject;
      localObject = paramReadableInstant.getChronology();
    }
    while (localObject != null);
    return ISOChronology.getInstance();
  }

  public static final long getInstantMillis(ReadableInstant paramReadableInstant)
  {
    if (paramReadableInstant == null)
      return currentTimeMillis();
    return paramReadableInstant.getMillis();
  }

  public static final Chronology getIntervalChronology(ReadableInstant paramReadableInstant1, ReadableInstant paramReadableInstant2)
  {
    Object localObject;
    if (paramReadableInstant1 != null)
      localObject = paramReadableInstant1.getChronology();
    while (true)
    {
      if (localObject == null)
        localObject = ISOChronology.getInstance();
      return localObject;
      localObject = null;
      if (paramReadableInstant2 != null)
        localObject = paramReadableInstant2.getChronology();
    }
  }

  public static final Chronology getIntervalChronology(ReadableInterval paramReadableInterval)
  {
    Object localObject;
    if (paramReadableInterval == null)
      localObject = ISOChronology.getInstance();
    do
    {
      return localObject;
      localObject = paramReadableInterval.getChronology();
    }
    while (localObject != null);
    return ISOChronology.getInstance();
  }

  public static final PeriodType getPeriodType(PeriodType paramPeriodType)
  {
    if (paramPeriodType == null)
      paramPeriodType = PeriodType.standard();
    return paramPeriodType;
  }

  public static final ReadableInterval getReadableInterval(ReadableInterval paramReadableInterval)
  {
    if (paramReadableInterval == null)
    {
      long l = currentTimeMillis();
      paramReadableInterval = new Interval(l, l);
    }
    return paramReadableInterval;
  }

  public static final DateTimeZone getZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    return paramDateTimeZone;
  }

  public static final boolean isContiguous(ReadablePartial paramReadablePartial)
  {
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("Partial must not be null");
    DurationFieldType localDurationFieldType = null;
    for (int i = 0; i < paramReadablePartial.size(); i++)
    {
      DateTimeField localDateTimeField = paramReadablePartial.getField(i);
      if ((i > 0) && ((localDateTimeField.getRangeDurationField() == null) || (localDateTimeField.getRangeDurationField().getType() != localDurationFieldType)))
        return false;
      localDurationFieldType = localDateTimeField.getDurationField().getType();
    }
    return true;
  }

  private static void put(Map<String, DateTimeZone> paramMap, String paramString1, String paramString2)
  {
    try
    {
      paramMap.put(paramString1, DateTimeZone.forID(paramString2));
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
    }
  }

  public static final void setCurrentMillisFixed(long paramLong)
    throws SecurityException
  {
    checkPermission();
    cMillisProvider = new FixedMillisProvider(paramLong);
  }

  public static final void setCurrentMillisOffset(long paramLong)
    throws SecurityException
  {
    checkPermission();
    if (paramLong == 0L)
    {
      cMillisProvider = SYSTEM_MILLIS_PROVIDER;
      return;
    }
    cMillisProvider = new OffsetMillisProvider(paramLong);
  }

  public static final void setCurrentMillisProvider(MillisProvider paramMillisProvider)
    throws SecurityException
  {
    if (paramMillisProvider == null)
      throw new IllegalArgumentException("The MillisProvider must not be null");
    checkPermission();
    cMillisProvider = paramMillisProvider;
  }

  public static final void setCurrentMillisSystem()
    throws SecurityException
  {
    checkPermission();
    cMillisProvider = SYSTEM_MILLIS_PROVIDER;
  }

  public static final void setDefaultTimeZoneNames(Map<String, DateTimeZone> paramMap)
  {
    cZoneNames.set(Collections.unmodifiableMap(new HashMap(paramMap)));
  }

  public static final double toJulianDay(long paramLong)
  {
    return 2440587.5D + paramLong / 86400000.0D;
  }

  public static final long toJulianDayNumber(long paramLong)
  {
    return ()Math.floor(0.5D + toJulianDay(paramLong));
  }

  static class FixedMillisProvider
    implements DateTimeUtils.MillisProvider
  {
    private final long iMillis;

    FixedMillisProvider(long paramLong)
    {
      this.iMillis = paramLong;
    }

    public long getMillis()
    {
      return this.iMillis;
    }
  }

  public static abstract interface MillisProvider
  {
    public abstract long getMillis();
  }

  static class OffsetMillisProvider
    implements DateTimeUtils.MillisProvider
  {
    private final long iMillis;

    OffsetMillisProvider(long paramLong)
    {
      this.iMillis = paramLong;
    }

    public long getMillis()
    {
      return System.currentTimeMillis() + this.iMillis;
    }
  }

  static class SystemMillisProvider
    implements DateTimeUtils.MillisProvider
  {
    public long getMillis()
    {
      return System.currentTimeMillis();
    }
  }
}