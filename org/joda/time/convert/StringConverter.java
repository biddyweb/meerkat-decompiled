package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.ReadWritableInterval;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePartial;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;
import org.joda.time.format.ISOPeriodFormat;
import org.joda.time.format.PeriodFormatter;

class StringConverter extends AbstractConverter
  implements InstantConverter, PartialConverter, DurationConverter, PeriodConverter, IntervalConverter
{
  static final StringConverter INSTANCE = new StringConverter();

  public long getDurationMillis(Object paramObject)
  {
    int i = 1;
    String str1 = (String)paramObject;
    int j = str1.length();
    String str2;
    int k;
    int m;
    int n;
    if ((j >= 4) && ((str1.charAt(0) == 'P') || (str1.charAt(0) == 'p')) && ((str1.charAt(i) == 'T') || (str1.charAt(i) == 't')) && ((str1.charAt(j - 1) == 'S') || (str1.charAt(j - 1) == 's')))
    {
      str2 = str1.substring(2, j - 1);
      k = 0;
      m = 0;
      n = -1;
      if (k >= str2.length())
        break label277;
      if ((str2.charAt(k) < '0') || (str2.charAt(k) > '9'))
        break label177;
    }
    while (true)
    {
      k++;
      break;
      throw new IllegalArgumentException("Invalid format: \"" + str1 + '"');
      label177: if ((k != 0) || (str2.charAt(0) != '-'))
        break label199;
      m = i;
    }
    label199: if (m != 0);
    for (int i1 = i; ; i1 = 0)
    {
      if ((k <= i1) || (str2.charAt(k) != '.') || (n != -1))
        break label245;
      n = k;
      break;
    }
    label245: throw new IllegalArgumentException("Invalid format: \"" + str1 + '"');
    label277: long l2;
    long l1;
    if (m != 0)
    {
      if (n <= 0)
        break label385;
      long l3 = Long.parseLong(str2.substring(i, n));
      String str3 = str2.substring(n + 1);
      if (str3.length() != 3)
        str3 = (str3 + "000").substring(0, 3);
      l2 = Integer.parseInt(str3);
      l1 = l3;
    }
    while (true)
    {
      if (m == 0)
        break label425;
      return FieldUtils.safeAdd(FieldUtils.safeMultiply(-l1, 1000), -l2);
      i = 0;
      break;
      label385: if (m != 0)
      {
        l1 = Long.parseLong(str2.substring(i, str2.length()));
        l2 = 0L;
      }
      else
      {
        l1 = Long.parseLong(str2);
        l2 = 0L;
      }
    }
    label425: return FieldUtils.safeAdd(FieldUtils.safeMultiply(l1, 1000), l2);
  }

  public long getInstantMillis(Object paramObject, Chronology paramChronology)
  {
    String str = (String)paramObject;
    return ISODateTimeFormat.dateTimeParser().withChronology(paramChronology).parseMillis(str);
  }

  public int[] getPartialValues(ReadablePartial paramReadablePartial, Object paramObject, Chronology paramChronology, DateTimeFormatter paramDateTimeFormatter)
  {
    if (paramDateTimeFormatter.getZone() != null)
      paramChronology = paramChronology.withZone(paramDateTimeFormatter.getZone());
    return paramChronology.get(paramReadablePartial, paramDateTimeFormatter.withChronology(paramChronology).parseMillis((String)paramObject));
  }

  public Class<?> getSupportedType()
  {
    return String.class;
  }

  public void setInto(ReadWritableInterval paramReadWritableInterval, Object paramObject, Chronology paramChronology)
  {
    String str1 = (String)paramObject;
    int i = str1.indexOf('/');
    if (i < 0)
      throw new IllegalArgumentException("Format requires a '/' separator: " + str1);
    String str2 = str1.substring(0, i);
    if (str2.length() <= 0)
      throw new IllegalArgumentException("Format invalid: " + str1);
    String str3 = str1.substring(i + 1);
    if (str3.length() <= 0)
      throw new IllegalArgumentException("Format invalid: " + str1);
    DateTimeFormatter localDateTimeFormatter = ISODateTimeFormat.dateTimeParser().withChronology(paramChronology);
    PeriodFormatter localPeriodFormatter = ISOPeriodFormat.standard();
    long l1 = 0L;
    int j = str2.charAt(0);
    Period localPeriod1;
    Chronology localChronology;
    if ((j == 80) || (j == 112))
    {
      localPeriod1 = localPeriodFormatter.withParseType(getPeriodType(str2)).parsePeriod(str2);
      localChronology = null;
    }
    while (true)
    {
      int k = str3.charAt(0);
      if ((k != 80) && (k != 112))
        break label342;
      if (localPeriod1 == null)
        break;
      throw new IllegalArgumentException("Interval composed of two durations: " + str1);
      DateTime localDateTime2 = localDateTimeFormatter.parseDateTime(str2);
      l1 = localDateTime2.getMillis();
      localChronology = localDateTime2.getChronology();
      localPeriod1 = null;
    }
    Period localPeriod2 = localPeriodFormatter.withParseType(getPeriodType(str3)).parsePeriod(str3);
    long l2;
    if (paramChronology != null)
      l2 = paramChronology.add(localPeriod2, l1, 1);
    while (true)
    {
      paramReadWritableInterval.setInterval(l1, l2);
      paramReadWritableInterval.setChronology(paramChronology);
      return;
      paramChronology = localChronology;
      break;
      label342: DateTime localDateTime1 = localDateTimeFormatter.parseDateTime(str3);
      long l3 = localDateTime1.getMillis();
      if (localChronology != null)
        label363: if (paramChronology == null)
          break label400;
      while (true)
      {
        if (localPeriod1 == null)
          break label406;
        l1 = paramChronology.add(localPeriod1, l3, -1);
        l2 = l3;
        break;
        localChronology = localDateTime1.getChronology();
        break label363;
        label400: paramChronology = localChronology;
      }
      label406: l2 = l3;
    }
  }

  public void setInto(ReadWritablePeriod paramReadWritablePeriod, Object paramObject, Chronology paramChronology)
  {
    String str = (String)paramObject;
    PeriodFormatter localPeriodFormatter = ISOPeriodFormat.standard();
    paramReadWritablePeriod.clear();
    int i = localPeriodFormatter.parseInto(paramReadWritablePeriod, str, 0);
    if (i < str.length())
    {
      if (i < 0)
        localPeriodFormatter.withParseType(paramReadWritablePeriod.getPeriodType()).parseMutablePeriod(str);
      throw new IllegalArgumentException("Invalid format: \"" + str + '"');
    }
  }
}