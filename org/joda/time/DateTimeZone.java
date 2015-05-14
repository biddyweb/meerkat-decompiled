package org.joda.time;

import java.io.File;
import java.io.ObjectStreamException;
import java.io.Serializable;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicReference;
import org.joda.convert.FromString;
import org.joda.convert.ToString;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.FormatUtils;
import org.joda.time.tz.DefaultNameProvider;
import org.joda.time.tz.FixedDateTimeZone;
import org.joda.time.tz.NameProvider;
import org.joda.time.tz.Provider;
import org.joda.time.tz.UTCProvider;
import org.joda.time.tz.ZoneInfoProvider;

public abstract class DateTimeZone
  implements Serializable
{
  private static final int MAX_MILLIS = 86399999;
  public static final DateTimeZone UTC = UTCDateTimeZone.INSTANCE;
  private static final AtomicReference<DateTimeZone> cDefault = new AtomicReference();
  private static final AtomicReference<NameProvider> cNameProvider;
  private static final AtomicReference<Provider> cProvider = new AtomicReference();
  private static final long serialVersionUID = 5546345482340108586L;
  private final String iID;

  static
  {
    cNameProvider = new AtomicReference();
  }

  protected DateTimeZone(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Id must not be null");
    this.iID = paramString;
  }

  private static DateTimeZone fixedOffsetZone(String paramString, int paramInt)
  {
    if (paramInt == 0)
      return UTC;
    return new FixedDateTimeZone(paramString, null, paramInt, paramInt);
  }

  @FromString
  public static DateTimeZone forID(String paramString)
  {
    DateTimeZone localDateTimeZone;
    if (paramString == null)
      localDateTimeZone = getDefault();
    do
    {
      return localDateTimeZone;
      if (paramString.equals("UTC"))
        return UTC;
      localDateTimeZone = getProvider().getZone(paramString);
    }
    while (localDateTimeZone != null);
    if ((paramString.startsWith("+")) || (paramString.startsWith("-")))
    {
      int i = parseOffset(paramString);
      if (i == 0L)
        return UTC;
      return fixedOffsetZone(printOffset(i), i);
    }
    throw new IllegalArgumentException("The datetime zone id '" + paramString + "' is not recognised");
  }

  public static DateTimeZone forOffsetHours(int paramInt)
    throws IllegalArgumentException
  {
    return forOffsetHoursMinutes(paramInt, 0);
  }

  public static DateTimeZone forOffsetHoursMinutes(int paramInt1, int paramInt2)
    throws IllegalArgumentException
  {
    if ((paramInt1 == 0) && (paramInt2 == 0))
      return UTC;
    if ((paramInt1 < -23) || (paramInt1 > 23))
      throw new IllegalArgumentException("Hours out of range: " + paramInt1);
    if ((paramInt2 < -59) || (paramInt2 > 59))
      throw new IllegalArgumentException("Minutes out of range: " + paramInt2);
    if ((paramInt1 > 0) && (paramInt2 < 0))
      throw new IllegalArgumentException("Positive hours must not have negative minutes: " + paramInt2);
    int i = paramInt1 * 60;
    if (i < 0);
    try
    {
      for (int j = i - Math.abs(paramInt2); ; j = i + paramInt2)
      {
        int k = FieldUtils.safeMultiply(j, 60000);
        return forOffsetMillis(k);
      }
    }
    catch (ArithmeticException localArithmeticException)
    {
    }
    throw new IllegalArgumentException("Offset is too large");
  }

  public static DateTimeZone forOffsetMillis(int paramInt)
  {
    if ((paramInt < -86399999) || (paramInt > 86399999))
      throw new IllegalArgumentException("Millis out of range: " + paramInt);
    return fixedOffsetZone(printOffset(paramInt), paramInt);
  }

  public static DateTimeZone forTimeZone(TimeZone paramTimeZone)
  {
    DateTimeZone localDateTimeZone;
    if (paramTimeZone == null)
      localDateTimeZone = getDefault();
    String str1;
    String str2;
    do
    {
      return localDateTimeZone;
      str1 = paramTimeZone.getID();
      if (str1 == null)
        throw new IllegalArgumentException("The TimeZone id must not be null");
      if (str1.equals("UTC"))
        return UTC;
      str2 = getConvertedId(str1);
      Provider localProvider = getProvider();
      localDateTimeZone = null;
      if (str2 != null)
        localDateTimeZone = localProvider.getZone(str2);
      if (localDateTimeZone == null)
        localDateTimeZone = localProvider.getZone(str1);
    }
    while (localDateTimeZone != null);
    if ((str2 == null) && ((str1.startsWith("GMT+")) || (str1.startsWith("GMT-"))))
    {
      int i = parseOffset(str1.substring(3));
      if (i == 0L)
        return UTC;
      return fixedOffsetZone(printOffset(i), i);
    }
    throw new IllegalArgumentException("The datetime zone id '" + str1 + "' is not recognised");
  }

  public static Set<String> getAvailableIDs()
  {
    return getProvider().getAvailableIDs();
  }

  private static String getConvertedId(String paramString)
  {
    return (String)DateTimeZone.LazyInit.CONVERSION_MAP.get(paramString);
  }

  public static DateTimeZone getDefault()
  {
    Object localObject = (DateTimeZone)cDefault.get();
    if (localObject == null);
    try
    {
      String str = System.getProperty("user.timezone");
      if (str != null)
      {
        DateTimeZone localDateTimeZone2 = forID(str);
        localObject = localDateTimeZone2;
      }
      label36: if (localObject == null)
      {
        DateTimeZone localDateTimeZone1 = forTimeZone(TimeZone.getDefault());
        localObject = localDateTimeZone1;
      }
      label49: if (localObject == null)
        localObject = UTC;
      if (!cDefault.compareAndSet(null, localObject))
        localObject = (DateTimeZone)cDefault.get();
      return localObject;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      break label49;
    }
    catch (RuntimeException localRuntimeException)
    {
      break label36;
    }
  }

  private static NameProvider getDefaultNameProvider()
  {
    try
    {
      String str = System.getProperty("org.joda.time.DateTimeZone.NameProvider");
      if (str != null)
        try
        {
          localObject = (NameProvider)Class.forName(str).newInstance();
          if (localObject == null)
            localObject = new DefaultNameProvider();
          return localObject;
        }
        catch (Exception localException)
        {
          throw new RuntimeException(localException);
        }
    }
    catch (SecurityException localSecurityException)
    {
      while (true)
      {
        Object localObject = null;
        continue;
        localObject = null;
      }
    }
  }

  private static Provider getDefaultProvider()
  {
    try
    {
      String str2 = System.getProperty("org.joda.time.DateTimeZone.Provider");
      if (str2 != null)
        try
        {
          Provider localProvider3 = validateProvider((Provider)Class.forName(str2).newInstance());
          return localProvider3;
        }
        catch (Exception localException3)
        {
          throw new RuntimeException(localException3);
        }
    }
    catch (SecurityException localSecurityException1)
    {
      try
      {
        String str1 = System.getProperty("org.joda.time.DateTimeZone.Folder");
        if (str1 != null)
          try
          {
            Provider localProvider2 = validateProvider(new ZoneInfoProvider(new File(str1)));
            return localProvider2;
          }
          catch (Exception localException2)
          {
            throw new RuntimeException(localException2);
          }
      }
      catch (SecurityException localSecurityException2)
      {
        try
        {
          Provider localProvider1 = validateProvider(new ZoneInfoProvider("org/joda/time/tz/data"));
          return localProvider1;
        }
        catch (Exception localException1)
        {
          localException1.printStackTrace();
        }
      }
    }
    return new UTCProvider();
  }

  public static NameProvider getNameProvider()
  {
    NameProvider localNameProvider = (NameProvider)cNameProvider.get();
    if (localNameProvider == null)
    {
      localNameProvider = getDefaultNameProvider();
      if (!cNameProvider.compareAndSet(null, localNameProvider))
        localNameProvider = (NameProvider)cNameProvider.get();
    }
    return localNameProvider;
  }

  public static Provider getProvider()
  {
    Provider localProvider = (Provider)cProvider.get();
    if (localProvider == null)
    {
      localProvider = getDefaultProvider();
      if (!cProvider.compareAndSet(null, localProvider))
        localProvider = (Provider)cProvider.get();
    }
    return localProvider;
  }

  private static int parseOffset(String paramString)
  {
    return -(int)DateTimeZone.LazyInit.OFFSET_FORMATTER.parseMillis(paramString);
  }

  private static String printOffset(int paramInt)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (paramInt >= 0)
      localStringBuffer.append('+');
    int m;
    while (true)
    {
      int i = paramInt / 3600000;
      FormatUtils.appendPaddedInteger(localStringBuffer, i, 2);
      int j = paramInt - i * 3600000;
      int k = j / 60000;
      localStringBuffer.append(':');
      FormatUtils.appendPaddedInteger(localStringBuffer, k, 2);
      m = j - k * 60000;
      if (m != 0)
        break;
      return localStringBuffer.toString();
      localStringBuffer.append('-');
      paramInt = -paramInt;
    }
    int n = m / 1000;
    localStringBuffer.append(':');
    FormatUtils.appendPaddedInteger(localStringBuffer, n, 2);
    int i1 = m - n * 1000;
    if (i1 == 0)
      return localStringBuffer.toString();
    localStringBuffer.append('.');
    FormatUtils.appendPaddedInteger(localStringBuffer, i1, 3);
    return localStringBuffer.toString();
  }

  public static void setDefault(DateTimeZone paramDateTimeZone)
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("DateTimeZone.setDefault"));
    if (paramDateTimeZone == null)
      throw new IllegalArgumentException("The datetime zone must not be null");
    cDefault.set(paramDateTimeZone);
  }

  public static void setNameProvider(NameProvider paramNameProvider)
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("DateTimeZone.setNameProvider"));
    if (paramNameProvider == null)
      paramNameProvider = getDefaultNameProvider();
    cNameProvider.set(paramNameProvider);
  }

  public static void setProvider(Provider paramProvider)
    throws SecurityException
  {
    SecurityManager localSecurityManager = System.getSecurityManager();
    if (localSecurityManager != null)
      localSecurityManager.checkPermission(new JodaTimePermission("DateTimeZone.setProvider"));
    if (paramProvider == null)
      paramProvider = getDefaultProvider();
    while (true)
    {
      cProvider.set(paramProvider);
      return;
      validateProvider(paramProvider);
    }
  }

  private static Provider validateProvider(Provider paramProvider)
  {
    Set localSet = paramProvider.getAvailableIDs();
    if ((localSet == null) || (localSet.size() == 0))
      throw new IllegalArgumentException("The provider doesn't have any available ids");
    if (!localSet.contains("UTC"))
      throw new IllegalArgumentException("The provider doesn't support UTC");
    if (!UTC.equals(paramProvider.getZone("UTC")))
      throw new IllegalArgumentException("Invalid UTC zone provided");
    return paramProvider;
  }

  public long adjustOffset(long paramLong, boolean paramBoolean)
  {
    long l1 = paramLong - 10800000L;
    long l2 = 10800000L + paramLong;
    long l3 = getOffset(l1);
    long l4 = getOffset(l2);
    if (l3 <= l4);
    long l5;
    do
    {
      do
      {
        long l7;
        long l8;
        do
        {
          return paramLong;
          l5 = l3 - l4;
          long l6 = nextTransition(l1);
          l7 = l6 - l5;
          l8 = l6 + l5;
        }
        while ((paramLong < l7) || (paramLong >= l8));
        if (paramLong - l7 < l5)
          break;
      }
      while (paramBoolean);
      return paramLong - l5;
    }
    while (!paramBoolean);
    return paramLong + l5;
  }

  public long convertLocalToUTC(long paramLong, boolean paramBoolean)
  {
    long l1 = 9223372036854775807L;
    int i = getOffset(paramLong);
    int j = getOffset(paramLong - i);
    long l3;
    long l4;
    if ((i != j) && ((paramBoolean) || (i < 0)))
    {
      l3 = nextTransition(paramLong - i);
      if (l3 == paramLong - i)
        l3 = l1;
      l4 = nextTransition(paramLong - j);
      if (l4 != paramLong - j)
        break label163;
    }
    while (true)
    {
      if (l3 != l1)
        if (paramBoolean)
          throw new IllegalInstantException(paramLong, getID());
      for (int k = i; ; k = j)
      {
        long l2 = paramLong - k;
        if (((paramLong ^ l2) < 0L) && ((paramLong ^ k) < 0L))
          throw new ArithmeticException("Subtracting time zone offset caused overflow");
        return l2;
      }
      label163: l1 = l4;
    }
  }

  public long convertLocalToUTC(long paramLong1, boolean paramBoolean, long paramLong2)
  {
    int i = getOffset(paramLong2);
    long l = paramLong1 - i;
    if (getOffset(l) == i)
      return l;
    return convertLocalToUTC(paramLong1, paramBoolean);
  }

  public long convertUTCToLocal(long paramLong)
  {
    int i = getOffset(paramLong);
    long l = paramLong + i;
    if (((paramLong ^ l) < 0L) && ((paramLong ^ i) >= 0L))
      throw new ArithmeticException("Adding time zone offset caused overflow");
    return l;
  }

  public abstract boolean equals(Object paramObject);

  @ToString
  public final String getID()
  {
    return this.iID;
  }

  public long getMillisKeepLocal(DateTimeZone paramDateTimeZone, long paramLong)
  {
    if (paramDateTimeZone == null);
    for (DateTimeZone localDateTimeZone = getDefault(); ; localDateTimeZone = paramDateTimeZone)
    {
      if (localDateTimeZone == this)
        return paramLong;
      return localDateTimeZone.convertLocalToUTC(convertUTCToLocal(paramLong), false, paramLong);
    }
  }

  public final String getName(long paramLong)
  {
    return getName(paramLong, null);
  }

  public String getName(long paramLong, Locale paramLocale)
  {
    if (paramLocale == null)
      paramLocale = Locale.getDefault();
    String str1 = getNameKey(paramLong);
    String str2;
    if (str1 == null)
      str2 = this.iID;
    while (true)
    {
      return str2;
      NameProvider localNameProvider = getNameProvider();
      if ((localNameProvider instanceof DefaultNameProvider));
      for (str2 = ((DefaultNameProvider)localNameProvider).getName(paramLocale, this.iID, str1, isStandardOffset(paramLong)); str2 == null; str2 = localNameProvider.getName(paramLocale, this.iID, str1))
        return printOffset(getOffset(paramLong));
    }
  }

  public abstract String getNameKey(long paramLong);

  public abstract int getOffset(long paramLong);

  public final int getOffset(ReadableInstant paramReadableInstant)
  {
    if (paramReadableInstant == null)
      return getOffset(DateTimeUtils.currentTimeMillis());
    return getOffset(paramReadableInstant.getMillis());
  }

  public int getOffsetFromLocal(long paramLong)
  {
    long l1 = 9223372036854775807L;
    int i = getOffset(paramLong);
    long l2 = paramLong - i;
    int j = getOffset(l2);
    long l4;
    long l5;
    if (i != j)
    {
      if (i - j >= 0)
        break label147;
      l4 = nextTransition(l2);
      if (l4 == paramLong - i)
        l4 = l1;
      l5 = nextTransition(paramLong - j);
      if (l5 != paramLong - j)
        break label150;
    }
    while (true)
    {
      if (l4 != l1)
      {
        int k = i;
        long l3;
        int m;
        do
        {
          return k;
          if (i < 0)
            break;
          l3 = previousTransition(l2);
          if (l3 >= l2)
            break;
          k = getOffset(l3);
          m = k - i;
        }
        while (l2 - l3 <= m);
      }
      label147: return j;
      label150: l1 = l5;
    }
  }

  public final String getShortName(long paramLong)
  {
    return getShortName(paramLong, null);
  }

  public String getShortName(long paramLong, Locale paramLocale)
  {
    if (paramLocale == null)
      paramLocale = Locale.getDefault();
    String str1 = getNameKey(paramLong);
    String str2;
    if (str1 == null)
      str2 = this.iID;
    while (true)
    {
      return str2;
      NameProvider localNameProvider = getNameProvider();
      if ((localNameProvider instanceof DefaultNameProvider));
      for (str2 = ((DefaultNameProvider)localNameProvider).getShortName(paramLocale, this.iID, str1, isStandardOffset(paramLong)); str2 == null; str2 = localNameProvider.getShortName(paramLocale, this.iID, str1))
        return printOffset(getOffset(paramLong));
    }
  }

  public abstract int getStandardOffset(long paramLong);

  public int hashCode()
  {
    return 57 + getID().hashCode();
  }

  public abstract boolean isFixed();

  public boolean isLocalDateTimeGap(LocalDateTime paramLocalDateTime)
  {
    if (isFixed())
      return false;
    try
    {
      paramLocalDateTime.toDateTime(this);
      return false;
    }
    catch (IllegalInstantException localIllegalInstantException)
    {
    }
    return true;
  }

  public boolean isStandardOffset(long paramLong)
  {
    return getOffset(paramLong) == getStandardOffset(paramLong);
  }

  public abstract long nextTransition(long paramLong);

  public abstract long previousTransition(long paramLong);

  public String toString()
  {
    return getID();
  }

  public TimeZone toTimeZone()
  {
    return TimeZone.getTimeZone(this.iID);
  }

  protected Object writeReplace()
    throws ObjectStreamException
  {
    return new DateTimeZone.Stub(this.iID);
  }
}