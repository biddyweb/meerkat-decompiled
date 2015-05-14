package org.joda.time.chrono;

import java.text.DateFormatSymbols;
import java.util.Locale;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.IllegalFieldValueException;

class GJLocaleSymbols
{
  private static ConcurrentMap<Locale, GJLocaleSymbols> cCache = new ConcurrentHashMap();
  private final String[] iDaysOfWeek;
  private final String[] iEras;
  private final String[] iHalfday;
  private final int iMaxDayOfWeekLength;
  private final int iMaxEraLength;
  private final int iMaxHalfdayLength;
  private final int iMaxMonthLength;
  private final int iMaxShortDayOfWeekLength;
  private final int iMaxShortMonthLength;
  private final String[] iMonths;
  private final TreeMap<String, Integer> iParseDaysOfWeek;
  private final TreeMap<String, Integer> iParseEras;
  private final TreeMap<String, Integer> iParseMonths;
  private final String[] iShortDaysOfWeek;
  private final String[] iShortMonths;

  private GJLocaleSymbols(Locale paramLocale)
  {
    DateFormatSymbols localDateFormatSymbols = DateTimeUtils.getDateFormatSymbols(paramLocale);
    this.iEras = localDateFormatSymbols.getEras();
    this.iDaysOfWeek = realignDaysOfWeek(localDateFormatSymbols.getWeekdays());
    this.iShortDaysOfWeek = realignDaysOfWeek(localDateFormatSymbols.getShortWeekdays());
    this.iMonths = realignMonths(localDateFormatSymbols.getMonths());
    this.iShortMonths = realignMonths(localDateFormatSymbols.getShortMonths());
    this.iHalfday = localDateFormatSymbols.getAmPmStrings();
    Integer[] arrayOfInteger = new Integer[13];
    for (int i = 0; i < 13; i++)
      arrayOfInteger[i] = Integer.valueOf(i);
    this.iParseEras = new TreeMap(String.CASE_INSENSITIVE_ORDER);
    addSymbols(this.iParseEras, this.iEras, arrayOfInteger);
    if ("en".equals(paramLocale.getLanguage()))
    {
      this.iParseEras.put("BCE", arrayOfInteger[0]);
      this.iParseEras.put("CE", arrayOfInteger[1]);
    }
    this.iParseDaysOfWeek = new TreeMap(String.CASE_INSENSITIVE_ORDER);
    addSymbols(this.iParseDaysOfWeek, this.iDaysOfWeek, arrayOfInteger);
    addSymbols(this.iParseDaysOfWeek, this.iShortDaysOfWeek, arrayOfInteger);
    addNumerals(this.iParseDaysOfWeek, 1, 7, arrayOfInteger);
    this.iParseMonths = new TreeMap(String.CASE_INSENSITIVE_ORDER);
    addSymbols(this.iParseMonths, this.iMonths, arrayOfInteger);
    addSymbols(this.iParseMonths, this.iShortMonths, arrayOfInteger);
    addNumerals(this.iParseMonths, 1, 12, arrayOfInteger);
    this.iMaxEraLength = maxLength(this.iEras);
    this.iMaxDayOfWeekLength = maxLength(this.iDaysOfWeek);
    this.iMaxShortDayOfWeekLength = maxLength(this.iShortDaysOfWeek);
    this.iMaxMonthLength = maxLength(this.iMonths);
    this.iMaxShortMonthLength = maxLength(this.iShortMonths);
    this.iMaxHalfdayLength = maxLength(this.iHalfday);
  }

  private static void addNumerals(TreeMap<String, Integer> paramTreeMap, int paramInt1, int paramInt2, Integer[] paramArrayOfInteger)
  {
    while (paramInt1 <= paramInt2)
    {
      paramTreeMap.put(String.valueOf(paramInt1).intern(), paramArrayOfInteger[paramInt1]);
      paramInt1++;
    }
  }

  private static void addSymbols(TreeMap<String, Integer> paramTreeMap, String[] paramArrayOfString, Integer[] paramArrayOfInteger)
  {
    int i = paramArrayOfString.length;
    while (true)
    {
      i--;
      if (i < 0)
        break;
      String str = paramArrayOfString[i];
      if (str != null)
        paramTreeMap.put(str, paramArrayOfInteger[i]);
    }
  }

  static GJLocaleSymbols forLocale(Locale paramLocale)
  {
    if (paramLocale == null)
      paramLocale = Locale.getDefault();
    GJLocaleSymbols localGJLocaleSymbols1 = (GJLocaleSymbols)cCache.get(paramLocale);
    GJLocaleSymbols localGJLocaleSymbols2;
    if (localGJLocaleSymbols1 == null)
    {
      localGJLocaleSymbols2 = new GJLocaleSymbols(paramLocale);
      localGJLocaleSymbols1 = (GJLocaleSymbols)cCache.putIfAbsent(paramLocale, localGJLocaleSymbols2);
      if (localGJLocaleSymbols1 == null);
    }
    else
    {
      return localGJLocaleSymbols1;
    }
    return localGJLocaleSymbols2;
  }

  private static int maxLength(String[] paramArrayOfString)
  {
    int i = 0;
    int j = paramArrayOfString.length;
    int k = j - 1;
    int m;
    if (k >= 0)
    {
      String str = paramArrayOfString[k];
      if (str == null)
        break label46;
      m = str.length();
      if (m <= i)
        break label46;
    }
    while (true)
    {
      i = m;
      j = k;
      break;
      return i;
      label46: m = i;
    }
  }

  private static String[] realignDaysOfWeek(String[] paramArrayOfString)
  {
    String[] arrayOfString = new String[8];
    int i = 1;
    if (i < 8)
    {
      if (i < 7);
      for (int j = i + 1; ; j = 1)
      {
        arrayOfString[i] = paramArrayOfString[j];
        i++;
        break;
      }
    }
    return arrayOfString;
  }

  private static String[] realignMonths(String[] paramArrayOfString)
  {
    String[] arrayOfString = new String[13];
    for (int i = 1; i < 13; i++)
      arrayOfString[i] = paramArrayOfString[(i - 1)];
    return arrayOfString;
  }

  public int dayOfWeekTextToValue(String paramString)
  {
    Integer localInteger = (Integer)this.iParseDaysOfWeek.get(paramString);
    if (localInteger != null)
      return localInteger.intValue();
    throw new IllegalFieldValueException(DateTimeFieldType.dayOfWeek(), paramString);
  }

  public String dayOfWeekValueToShortText(int paramInt)
  {
    return this.iShortDaysOfWeek[paramInt];
  }

  public String dayOfWeekValueToText(int paramInt)
  {
    return this.iDaysOfWeek[paramInt];
  }

  public int eraTextToValue(String paramString)
  {
    Integer localInteger = (Integer)this.iParseEras.get(paramString);
    if (localInteger != null)
      return localInteger.intValue();
    throw new IllegalFieldValueException(DateTimeFieldType.era(), paramString);
  }

  public String eraValueToText(int paramInt)
  {
    return this.iEras[paramInt];
  }

  public int getDayOfWeekMaxShortTextLength()
  {
    return this.iMaxShortDayOfWeekLength;
  }

  public int getDayOfWeekMaxTextLength()
  {
    return this.iMaxDayOfWeekLength;
  }

  public int getEraMaxTextLength()
  {
    return this.iMaxEraLength;
  }

  public int getHalfdayMaxTextLength()
  {
    return this.iMaxHalfdayLength;
  }

  public int getMonthMaxShortTextLength()
  {
    return this.iMaxShortMonthLength;
  }

  public int getMonthMaxTextLength()
  {
    return this.iMaxMonthLength;
  }

  public int halfdayTextToValue(String paramString)
  {
    String[] arrayOfString = this.iHalfday;
    int i = arrayOfString.length;
    do
    {
      i--;
      if (i < 0)
        break;
    }
    while (!arrayOfString[i].equalsIgnoreCase(paramString));
    return i;
    throw new IllegalFieldValueException(DateTimeFieldType.halfdayOfDay(), paramString);
  }

  public String halfdayValueToText(int paramInt)
  {
    return this.iHalfday[paramInt];
  }

  public int monthOfYearTextToValue(String paramString)
  {
    Integer localInteger = (Integer)this.iParseMonths.get(paramString);
    if (localInteger != null)
      return localInteger.intValue();
    throw new IllegalFieldValueException(DateTimeFieldType.monthOfYear(), paramString);
  }

  public String monthOfYearValueToShortText(int paramInt)
  {
    return this.iShortMonths[paramInt];
  }

  public String monthOfYearValueToText(int paramInt)
  {
    return this.iMonths[paramInt];
  }
}