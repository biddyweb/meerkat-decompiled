package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Enumeration;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePeriod;

public class PeriodFormat
{
  private static final String BUNDLE_NAME = "org.joda.time.format.messages";
  private static final ConcurrentMap<Locale, PeriodFormatter> FORMATTERS = new ConcurrentHashMap();

  private static PeriodFormatter buildNonRegExFormatter(ResourceBundle paramResourceBundle, Locale paramLocale)
  {
    String[] arrayOfString = retrieveVariants(paramResourceBundle);
    return new PeriodFormatterBuilder().appendYears().appendSuffix(paramResourceBundle.getString("PeriodFormat.year"), paramResourceBundle.getString("PeriodFormat.years")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendMonths().appendSuffix(paramResourceBundle.getString("PeriodFormat.month"), paramResourceBundle.getString("PeriodFormat.months")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendWeeks().appendSuffix(paramResourceBundle.getString("PeriodFormat.week"), paramResourceBundle.getString("PeriodFormat.weeks")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendDays().appendSuffix(paramResourceBundle.getString("PeriodFormat.day"), paramResourceBundle.getString("PeriodFormat.days")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendHours().appendSuffix(paramResourceBundle.getString("PeriodFormat.hour"), paramResourceBundle.getString("PeriodFormat.hours")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendMinutes().appendSuffix(paramResourceBundle.getString("PeriodFormat.minute"), paramResourceBundle.getString("PeriodFormat.minutes")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendSeconds().appendSuffix(paramResourceBundle.getString("PeriodFormat.second"), paramResourceBundle.getString("PeriodFormat.seconds")).appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString).appendMillis().appendSuffix(paramResourceBundle.getString("PeriodFormat.millisecond"), paramResourceBundle.getString("PeriodFormat.milliseconds")).toFormatter().withLocale(paramLocale);
  }

  private static PeriodFormatter buildRegExFormatter(ResourceBundle paramResourceBundle, Locale paramLocale)
  {
    String[] arrayOfString = retrieveVariants(paramResourceBundle);
    String str = paramResourceBundle.getString("PeriodFormat.regex.separator");
    PeriodFormatterBuilder localPeriodFormatterBuilder = new PeriodFormatterBuilder();
    localPeriodFormatterBuilder.appendYears();
    if (containsKey(paramResourceBundle, "PeriodFormat.years.regex"))
    {
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.years.regex").split(str), paramResourceBundle.getString("PeriodFormat.years.list").split(str));
      localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendMonths();
      if (!containsKey(paramResourceBundle, "PeriodFormat.months.regex"))
        break label513;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.months.regex").split(str), paramResourceBundle.getString("PeriodFormat.months.list").split(str));
      label122: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendWeeks();
      if (!containsKey(paramResourceBundle, "PeriodFormat.weeks.regex"))
        break label534;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.weeks.regex").split(str), paramResourceBundle.getString("PeriodFormat.weeks.list").split(str));
      label182: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendDays();
      if (!containsKey(paramResourceBundle, "PeriodFormat.days.regex"))
        break label555;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.days.regex").split(str), paramResourceBundle.getString("PeriodFormat.days.list").split(str));
      label242: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendHours();
      if (!containsKey(paramResourceBundle, "PeriodFormat.hours.regex"))
        break label576;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.hours.regex").split(str), paramResourceBundle.getString("PeriodFormat.hours.list").split(str));
      label302: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendMinutes();
      if (!containsKey(paramResourceBundle, "PeriodFormat.minutes.regex"))
        break label597;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.minutes.regex").split(str), paramResourceBundle.getString("PeriodFormat.minutes.list").split(str));
      label362: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendSeconds();
      if (!containsKey(paramResourceBundle, "PeriodFormat.seconds.regex"))
        break label618;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.seconds.regex").split(str), paramResourceBundle.getString("PeriodFormat.seconds.list").split(str));
      label422: localPeriodFormatterBuilder.appendSeparator(paramResourceBundle.getString("PeriodFormat.commaspace"), paramResourceBundle.getString("PeriodFormat.spaceandspace"), arrayOfString);
      localPeriodFormatterBuilder.appendMillis();
      if (!containsKey(paramResourceBundle, "PeriodFormat.milliseconds.regex"))
        break label639;
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.milliseconds.regex").split(str), paramResourceBundle.getString("PeriodFormat.milliseconds.list").split(str));
    }
    while (true)
    {
      return localPeriodFormatterBuilder.toFormatter().withLocale(paramLocale);
      localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.year"), paramResourceBundle.getString("PeriodFormat.years"));
      break;
      label513: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.month"), paramResourceBundle.getString("PeriodFormat.months"));
      break label122;
      label534: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.week"), paramResourceBundle.getString("PeriodFormat.weeks"));
      break label182;
      label555: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.day"), paramResourceBundle.getString("PeriodFormat.days"));
      break label242;
      label576: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.hour"), paramResourceBundle.getString("PeriodFormat.hours"));
      break label302;
      label597: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.minute"), paramResourceBundle.getString("PeriodFormat.minutes"));
      break label362;
      label618: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.second"), paramResourceBundle.getString("PeriodFormat.seconds"));
      break label422;
      label639: localPeriodFormatterBuilder.appendSuffix(paramResourceBundle.getString("PeriodFormat.millisecond"), paramResourceBundle.getString("PeriodFormat.milliseconds"));
    }
  }

  private static PeriodFormatter buildWordBased(Locale paramLocale)
  {
    ResourceBundle localResourceBundle = ResourceBundle.getBundle("org.joda.time.format.messages", paramLocale);
    if (containsKey(localResourceBundle, "PeriodFormat.regex.separator"))
      return buildRegExFormatter(localResourceBundle, paramLocale);
    return buildNonRegExFormatter(localResourceBundle, paramLocale);
  }

  private static boolean containsKey(ResourceBundle paramResourceBundle, String paramString)
  {
    Enumeration localEnumeration = paramResourceBundle.getKeys();
    while (localEnumeration.hasMoreElements())
      if (((String)localEnumeration.nextElement()).equals(paramString))
        return true;
    return false;
  }

  public static PeriodFormatter getDefault()
  {
    return wordBased(Locale.ENGLISH);
  }

  private static String[] retrieveVariants(ResourceBundle paramResourceBundle)
  {
    String[] arrayOfString = new String[4];
    arrayOfString[0] = paramResourceBundle.getString("PeriodFormat.space");
    arrayOfString[1] = paramResourceBundle.getString("PeriodFormat.comma");
    arrayOfString[2] = paramResourceBundle.getString("PeriodFormat.commandand");
    arrayOfString[3] = paramResourceBundle.getString("PeriodFormat.commaspaceand");
    return arrayOfString;
  }

  public static PeriodFormatter wordBased()
  {
    return wordBased(Locale.getDefault());
  }

  public static PeriodFormatter wordBased(Locale paramLocale)
  {
    PeriodFormatter localPeriodFormatter1 = (PeriodFormatter)FORMATTERS.get(paramLocale);
    PeriodFormatter localPeriodFormatter2;
    if (localPeriodFormatter1 == null)
    {
      DynamicWordBased localDynamicWordBased = new DynamicWordBased(buildWordBased(paramLocale));
      localPeriodFormatter2 = new PeriodFormatter(localDynamicWordBased, localDynamicWordBased, paramLocale, null);
      localPeriodFormatter1 = (PeriodFormatter)FORMATTERS.putIfAbsent(paramLocale, localPeriodFormatter2);
      if (localPeriodFormatter1 == null);
    }
    else
    {
      return localPeriodFormatter1;
    }
    return localPeriodFormatter2;
  }

  static class DynamicWordBased
    implements PeriodPrinter, PeriodParser
  {
    private final PeriodFormatter iFormatter;

    DynamicWordBased(PeriodFormatter paramPeriodFormatter)
    {
      this.iFormatter = paramPeriodFormatter;
    }

    private PeriodParser getParser(Locale paramLocale)
    {
      if ((paramLocale != null) && (!paramLocale.equals(this.iFormatter.getLocale())))
        return PeriodFormat.wordBased(paramLocale).getParser();
      return this.iFormatter.getParser();
    }

    private PeriodPrinter getPrinter(Locale paramLocale)
    {
      if ((paramLocale != null) && (!paramLocale.equals(this.iFormatter.getLocale())))
        return PeriodFormat.wordBased(paramLocale).getPrinter();
      return this.iFormatter.getPrinter();
    }

    public int calculatePrintedLength(ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      return getPrinter(paramLocale).calculatePrintedLength(paramReadablePeriod, paramLocale);
    }

    public int countFieldsToPrint(ReadablePeriod paramReadablePeriod, int paramInt, Locale paramLocale)
    {
      return getPrinter(paramLocale).countFieldsToPrint(paramReadablePeriod, paramInt, paramLocale);
    }

    public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale)
    {
      return getParser(paramLocale).parseInto(paramReadWritablePeriod, paramString, paramInt, paramLocale);
    }

    public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod, Locale paramLocale)
      throws IOException
    {
      getPrinter(paramLocale).printTo(paramWriter, paramReadablePeriod, paramLocale);
    }

    public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod, Locale paramLocale)
    {
      getPrinter(paramLocale).printTo(paramStringBuffer, paramReadablePeriod, paramLocale);
    }
  }
}