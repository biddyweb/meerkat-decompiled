package org.joda.time.format;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReferenceArray;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadablePartial;

public class DateTimeFormat
{
  static final int DATE = 0;
  static final int DATETIME = 2;
  static final int FULL = 0;
  static final int LONG = 1;
  static final int MEDIUM = 2;
  static final int NONE = 4;
  private static final int PATTERN_CACHE_SIZE = 500;
  static final int SHORT = 3;
  static final int TIME = 1;
  private static final ConcurrentHashMap<String, DateTimeFormatter> cPatternCache = new ConcurrentHashMap();
  private static final AtomicReferenceArray<DateTimeFormatter> cStyleCache = new AtomicReferenceArray(25);

  static void appendPatternTo(DateTimeFormatterBuilder paramDateTimeFormatterBuilder, String paramString)
  {
    parsePatternTo(paramDateTimeFormatterBuilder, paramString);
  }

  private static DateTimeFormatter createDateTimeFormatter(int paramInt1, int paramInt2)
  {
    int i = 2;
    if (paramInt1 == 4)
      i = 1;
    while (true)
    {
      StyleFormatter localStyleFormatter = new StyleFormatter(paramInt1, paramInt2, i);
      return new DateTimeFormatter(localStyleFormatter, localStyleFormatter);
      if (paramInt2 == 4)
        i = 0;
    }
  }

  private static DateTimeFormatter createFormatterForPattern(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0))
      throw new IllegalArgumentException("Invalid pattern specification");
    DateTimeFormatter localDateTimeFormatter1 = (DateTimeFormatter)cPatternCache.get(paramString);
    DateTimeFormatter localDateTimeFormatter2;
    if (localDateTimeFormatter1 == null)
    {
      DateTimeFormatterBuilder localDateTimeFormatterBuilder = new DateTimeFormatterBuilder();
      parsePatternTo(localDateTimeFormatterBuilder, paramString);
      localDateTimeFormatter2 = localDateTimeFormatterBuilder.toFormatter();
      if (cPatternCache.size() < 500)
      {
        localDateTimeFormatter1 = (DateTimeFormatter)cPatternCache.putIfAbsent(paramString, localDateTimeFormatter2);
        if (localDateTimeFormatter1 == null);
      }
    }
    else
    {
      return localDateTimeFormatter1;
    }
    return localDateTimeFormatter2;
  }

  private static DateTimeFormatter createFormatterForStyle(String paramString)
  {
    if ((paramString == null) || (paramString.length() != 2))
      throw new IllegalArgumentException("Invalid style specification: " + paramString);
    int i = selectStyle(paramString.charAt(0));
    int j = selectStyle(paramString.charAt(1));
    if ((i == 4) && (j == 4))
      throw new IllegalArgumentException("Style '--' is invalid");
    return createFormatterForStyleIndex(i, j);
  }

  private static DateTimeFormatter createFormatterForStyleIndex(int paramInt1, int paramInt2)
  {
    int i = paramInt2 + (paramInt1 + (paramInt1 << 2));
    DateTimeFormatter localDateTimeFormatter;
    if (i >= cStyleCache.length())
      localDateTimeFormatter = createDateTimeFormatter(paramInt1, paramInt2);
    do
    {
      do
      {
        return localDateTimeFormatter;
        localDateTimeFormatter = (DateTimeFormatter)cStyleCache.get(i);
      }
      while (localDateTimeFormatter != null);
      localDateTimeFormatter = createDateTimeFormatter(paramInt1, paramInt2);
    }
    while (cStyleCache.compareAndSet(i, null, localDateTimeFormatter));
    return (DateTimeFormatter)cStyleCache.get(i);
  }

  public static DateTimeFormatter forPattern(String paramString)
  {
    return createFormatterForPattern(paramString);
  }

  public static DateTimeFormatter forStyle(String paramString)
  {
    return createFormatterForStyle(paramString);
  }

  public static DateTimeFormatter fullDate()
  {
    return createFormatterForStyleIndex(0, 4);
  }

  public static DateTimeFormatter fullDateTime()
  {
    return createFormatterForStyleIndex(0, 0);
  }

  public static DateTimeFormatter fullTime()
  {
    return createFormatterForStyleIndex(4, 0);
  }

  private static boolean isNumericToken(String paramString)
  {
    boolean bool = true;
    int i = paramString.length();
    if (i > 0)
      switch (paramString.charAt(0))
      {
      default:
      case 'C':
      case 'D':
      case 'F':
      case 'H':
      case 'K':
      case 'S':
      case 'W':
      case 'Y':
      case 'c':
      case 'd':
      case 'e':
      case 'h':
      case 'k':
      case 'm':
      case 's':
      case 'w':
      case 'x':
      case 'y':
      case 'M':
      }
    do
    {
      bool = false;
      return bool;
    }
    while (i > 2);
    return bool;
  }

  public static DateTimeFormatter longDate()
  {
    return createFormatterForStyleIndex(1, 4);
  }

  public static DateTimeFormatter longDateTime()
  {
    return createFormatterForStyleIndex(1, 1);
  }

  public static DateTimeFormatter longTime()
  {
    return createFormatterForStyleIndex(4, 1);
  }

  public static DateTimeFormatter mediumDate()
  {
    return createFormatterForStyleIndex(2, 4);
  }

  public static DateTimeFormatter mediumDateTime()
  {
    return createFormatterForStyleIndex(2, 2);
  }

  public static DateTimeFormatter mediumTime()
  {
    return createFormatterForStyleIndex(4, 2);
  }

  private static void parsePatternTo(DateTimeFormatterBuilder paramDateTimeFormatterBuilder, String paramString)
  {
    int i = paramString.length();
    int[] arrayOfInt = new int[1];
    int j = 0;
    String str1;
    int k;
    int m;
    if (j < i)
    {
      arrayOfInt[0] = j;
      str1 = parseToken(paramString, arrayOfInt);
      k = arrayOfInt[0];
      m = str1.length();
      if (m != 0);
    }
    else
    {
      return;
    }
    int n = str1.charAt(0);
    switch (n)
    {
    default:
      throw new IllegalArgumentException("Illegal pattern component: " + str1);
    case 71:
      paramDateTimeFormatterBuilder.appendEraText();
    case 67:
    case 89:
    case 120:
    case 121:
    case 77:
    case 100:
    case 97:
    case 104:
    case 72:
    case 107:
    case 75:
    case 109:
    case 115:
    case 83:
    case 101:
    case 69:
    case 68:
    case 119:
    case 122:
    case 90:
    case 39:
    }
    while (true)
    {
      j = k + 1;
      break;
      paramDateTimeFormatterBuilder.appendCenturyOfEra(m, m);
      continue;
      if (m == 2)
      {
        boolean bool = true;
        if (k + 1 < i)
        {
          arrayOfInt[0] = (1 + arrayOfInt[0]);
          if (isNumericToken(parseToken(paramString, arrayOfInt)))
            bool = false;
          arrayOfInt[0] = (-1 + arrayOfInt[0]);
        }
        switch (n)
        {
        default:
          paramDateTimeFormatterBuilder.appendTwoDigitYear(-30 + new DateTime().getYear(), bool);
          break;
        case 120:
          paramDateTimeFormatterBuilder.appendTwoDigitWeekyear(-30 + new DateTime().getWeekyear(), bool);
          break;
        }
      }
      else
      {
        int i1 = 9;
        if (k + 1 < i)
        {
          arrayOfInt[0] = (1 + arrayOfInt[0]);
          if (isNumericToken(parseToken(paramString, arrayOfInt)))
            i1 = m;
          arrayOfInt[0] = (-1 + arrayOfInt[0]);
        }
        switch (n)
        {
        default:
          break;
        case 89:
          paramDateTimeFormatterBuilder.appendYearOfEra(m, i1);
          break;
        case 120:
          paramDateTimeFormatterBuilder.appendWeekyear(m, i1);
          break;
        case 121:
          paramDateTimeFormatterBuilder.appendYear(m, i1);
          continue;
          if (m >= 3)
          {
            if (m >= 4)
              paramDateTimeFormatterBuilder.appendMonthOfYearText();
            else
              paramDateTimeFormatterBuilder.appendMonthOfYearShortText();
          }
          else
          {
            paramDateTimeFormatterBuilder.appendMonthOfYear(m);
            continue;
            paramDateTimeFormatterBuilder.appendDayOfMonth(m);
            continue;
            paramDateTimeFormatterBuilder.appendHalfdayOfDayText();
            continue;
            paramDateTimeFormatterBuilder.appendClockhourOfHalfday(m);
            continue;
            paramDateTimeFormatterBuilder.appendHourOfDay(m);
            continue;
            paramDateTimeFormatterBuilder.appendClockhourOfDay(m);
            continue;
            paramDateTimeFormatterBuilder.appendHourOfHalfday(m);
            continue;
            paramDateTimeFormatterBuilder.appendMinuteOfHour(m);
            continue;
            paramDateTimeFormatterBuilder.appendSecondOfMinute(m);
            continue;
            paramDateTimeFormatterBuilder.appendFractionOfSecond(m, m);
            continue;
            paramDateTimeFormatterBuilder.appendDayOfWeek(m);
            continue;
            if (m >= 4)
            {
              paramDateTimeFormatterBuilder.appendDayOfWeekText();
            }
            else
            {
              paramDateTimeFormatterBuilder.appendDayOfWeekShortText();
              continue;
              paramDateTimeFormatterBuilder.appendDayOfYear(m);
              continue;
              paramDateTimeFormatterBuilder.appendWeekOfWeekyear(m);
              continue;
              if (m >= 4)
              {
                paramDateTimeFormatterBuilder.appendTimeZoneName();
              }
              else
              {
                paramDateTimeFormatterBuilder.appendTimeZoneShortName(null);
                continue;
                if (m == 1)
                {
                  paramDateTimeFormatterBuilder.appendTimeZoneOffset(null, "Z", false, 2, 2);
                }
                else if (m == 2)
                {
                  paramDateTimeFormatterBuilder.appendTimeZoneOffset(null, "Z", true, 2, 2);
                }
                else
                {
                  paramDateTimeFormatterBuilder.appendTimeZoneId();
                  continue;
                  String str2 = str1.substring(1);
                  if (str2.length() == 1)
                    paramDateTimeFormatterBuilder.appendLiteral(str2.charAt(0));
                  else
                    paramDateTimeFormatterBuilder.appendLiteral(new String(str2));
                }
              }
            }
          }
          break;
        }
      }
    }
  }

  private static String parseToken(String paramString, int[] paramArrayOfInt)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramArrayOfInt[0];
    int j = paramString.length();
    char c1 = paramString.charAt(i);
    if (((c1 >= 'A') && (c1 <= 'Z')) || ((c1 >= 'a') && (c1 <= 'z')))
      localStringBuilder.append(c1);
    int k;
    char c2;
    while (true)
      if ((i + 1 < j) && (paramString.charAt(i + 1) == c1))
      {
        localStringBuilder.append(c1);
        i++;
        continue;
        localStringBuilder.append('\'');
        k = 0;
        if (i < j)
        {
          c2 = paramString.charAt(i);
          if (c2 == '\'')
            if ((i + 1 < j) && (paramString.charAt(i + 1) == '\''))
            {
              i++;
              localStringBuilder.append(c2);
            }
        }
      }
    while (true)
    {
      i++;
      break;
      if (k == 0)
      {
        k = 1;
      }
      else
      {
        k = 0;
        continue;
        if ((k == 0) && (((c2 >= 'A') && (c2 <= 'Z')) || ((c2 >= 'a') && (c2 <= 'z'))))
        {
          i--;
          paramArrayOfInt[0] = i;
          return localStringBuilder.toString();
        }
        localStringBuilder.append(c2);
      }
    }
  }

  public static String patternForStyle(String paramString, Locale paramLocale)
  {
    DateTimeFormatter localDateTimeFormatter = createFormatterForStyle(paramString);
    if (paramLocale == null)
      paramLocale = Locale.getDefault();
    return ((StyleFormatter)localDateTimeFormatter.getPrinter0()).getPattern(paramLocale);
  }

  private static int selectStyle(char paramChar)
  {
    switch (paramChar)
    {
    default:
      throw new IllegalArgumentException("Invalid style character: " + paramChar);
    case 'S':
      return 3;
    case 'M':
      return 2;
    case 'L':
      return 1;
    case 'F':
      return 0;
    case '-':
    }
    return 4;
  }

  public static DateTimeFormatter shortDate()
  {
    return createFormatterForStyleIndex(3, 4);
  }

  public static DateTimeFormatter shortDateTime()
  {
    return createFormatterForStyleIndex(3, 3);
  }

  public static DateTimeFormatter shortTime()
  {
    return createFormatterForStyleIndex(4, 3);
  }

  static class StyleFormatter
    implements InternalPrinter, InternalParser
  {
    private static final ConcurrentHashMap<DateTimeFormat.StyleFormatterCacheKey, DateTimeFormatter> cCache = new ConcurrentHashMap();
    private final int iDateStyle;
    private final int iTimeStyle;
    private final int iType;

    StyleFormatter(int paramInt1, int paramInt2, int paramInt3)
    {
      this.iDateStyle = paramInt1;
      this.iTimeStyle = paramInt2;
      this.iType = paramInt3;
    }

    private DateTimeFormatter getFormatter(Locale paramLocale)
    {
      if (paramLocale == null)
        paramLocale = Locale.getDefault();
      DateTimeFormat.StyleFormatterCacheKey localStyleFormatterCacheKey = new DateTimeFormat.StyleFormatterCacheKey(this.iType, this.iDateStyle, this.iTimeStyle, paramLocale);
      DateTimeFormatter localDateTimeFormatter1 = (DateTimeFormatter)cCache.get(localStyleFormatterCacheKey);
      DateTimeFormatter localDateTimeFormatter2;
      if (localDateTimeFormatter1 == null)
      {
        localDateTimeFormatter2 = DateTimeFormat.forPattern(getPattern(paramLocale));
        localDateTimeFormatter1 = (DateTimeFormatter)cCache.putIfAbsent(localStyleFormatterCacheKey, localDateTimeFormatter2);
        if (localDateTimeFormatter1 == null);
      }
      else
      {
        return localDateTimeFormatter1;
      }
      return localDateTimeFormatter2;
    }

    public int estimateParsedLength()
    {
      return 40;
    }

    public int estimatePrintedLength()
    {
      return 40;
    }

    String getPattern(Locale paramLocale)
    {
      int i = this.iType;
      DateFormat localDateFormat = null;
      switch (i)
      {
      default:
      case 0:
      case 1:
      case 2:
      }
      while (!(localDateFormat instanceof SimpleDateFormat))
      {
        throw new IllegalArgumentException("No datetime pattern for locale: " + paramLocale);
        localDateFormat = DateFormat.getDateInstance(this.iDateStyle, paramLocale);
        continue;
        localDateFormat = DateFormat.getTimeInstance(this.iTimeStyle, paramLocale);
        continue;
        localDateFormat = DateFormat.getDateTimeInstance(this.iDateStyle, this.iTimeStyle, paramLocale);
      }
      return ((SimpleDateFormat)localDateFormat).toPattern();
    }

    public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
    {
      return getFormatter(paramDateTimeParserBucket.getLocale()).getParser0().parseInto(paramDateTimeParserBucket, paramCharSequence, paramInt);
    }

    public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
      throws IOException
    {
      getFormatter(paramLocale).getPrinter0().printTo(paramAppendable, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
    }

    public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
      throws IOException
    {
      getFormatter(paramLocale).getPrinter0().printTo(paramAppendable, paramReadablePartial, paramLocale);
    }
  }

  static class StyleFormatterCacheKey
  {
    private final int combinedTypeAndStyle;
    private final Locale locale;

    public StyleFormatterCacheKey(int paramInt1, int paramInt2, int paramInt3, Locale paramLocale)
    {
      this.locale = paramLocale;
      this.combinedTypeAndStyle = (paramInt1 + (paramInt2 << 4) + (paramInt3 << 8));
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      StyleFormatterCacheKey localStyleFormatterCacheKey;
      do
      {
        do
        {
          return true;
          if (paramObject == null)
            return false;
          if (!(paramObject instanceof StyleFormatterCacheKey))
            return false;
          localStyleFormatterCacheKey = (StyleFormatterCacheKey)paramObject;
          if (this.combinedTypeAndStyle != localStyleFormatterCacheKey.combinedTypeAndStyle)
            return false;
          if (this.locale != null)
            break;
        }
        while (localStyleFormatterCacheKey.locale == null);
        return false;
      }
      while (this.locale.equals(localStyleFormatterCacheKey.locale));
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (31 + this.combinedTypeAndStyle);
      if (this.locale == null);
      for (int j = 0; ; j = this.locale.hashCode())
        return j + i;
    }
  }
}