package org.ocpsoft.prettytime.i18n;

import java.util.ListResourceBundle;
import java.util.ResourceBundle;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.impl.TimeFormatProvider;

public class Resources_ja extends ListResourceBundle
  implements TimeFormatProvider
{
  private static final Object[][] OBJECTS = { { "CenturyPattern", "%n%u" }, { "CenturyFuturePrefix", "\u4ECA\u304B\u3089" }, { "CenturyFutureSuffix", "\u4E16\u7D00\u306B\u3082\u308F\u305F\u3063" }, { "CenturyPastPrefix", "" }, { "CenturyPastSuffix", "\u4E16\u7D00\u524D" }, { "CenturySingularName", "" }, { "CenturyPluralName", "" }, { "DayPattern", "%n%u" }, { "DayFuturePrefix", "\u4ECA\u304B\u3089" }, { "DayFutureSuffix", "\u9593" }, { "DayPastPrefix", "" }, { "DayPastSuffix", "\u524D" }, { "DaySingularName", "\u65E5" }, { "DayPluralName", "\u65E5" }, { "DecadePattern", "%n%u" }, { "DecadeFuturePrefix", "\u4ECA\u304B\u3089" }, { "DecadeFutureSuffix", "\u5E74\u9593" }, { "DecadePastPrefix", "" }, { "DecadePastSuffix", "\u5E74\u524D" }, { "DecadeSingularName", "" }, { "DecadePluralName", "" }, { "HourPattern", "%n%u" }, { "HourFuturePrefix", "\u4ECA\u304B\u3089" }, { "HourFutureSuffix", "" }, { "HourPastPrefix", "" }, { "HourPastSuffix", "\u524D" }, { "HourSingularName", "\u6642\u9593" }, { "HourPluralName", "\u6642\u9593" }, { "JustNowPattern", "%u" }, { "JustNowFuturePrefix", "" }, { "JustNowFutureSuffix", "\u4ECA\u304B\u3089\u3059\u3050" }, { "JustNowPastPrefix", "" }, { "JustNowPastSuffix", "\u3055\u3063\u304D" }, { "JustNowSingularName", "" }, { "JustNowPluralName", "" }, { "MillenniumPattern", "%n %u" }, { "MillenniumFuturePrefix", "" }, { "MillenniumFutureSuffix", "\u4ECA\u304B\u3089" }, { "MillenniumPastPrefix", "" }, { "MillenniumPastSuffix", "\u524D" }, { "MillenniumSingularName", "\u5343\u5E74" }, { "MillenniumPluralName", "\u5343\u5E74" }, { "MillisecondPattern", "%n%u" }, { "MillisecondFuturePrefix", "" }, { "MillisecondFutureSuffix", "\u4ECA\u304B\u3089" }, { "MillisecondPastPrefix", "" }, { "MillisecondPastSuffix", "\u524D" }, { "MillisecondSingularName", "\u30DF\u30EA\u79D2" }, { "MillisecondPluralName", "\u30DF\u30EA\u79D2" }, { "MinutePattern", "%n%u" }, { "MinuteFuturePrefix", "\u4ECA\u304B\u3089" }, { "MinuteFutureSuffix", "" }, { "MinutePastPrefix", "" }, { "MinutePastSuffix", "\u524D" }, { "MinuteSingularName", "\u5206" }, { "MinutePluralName", "\u5206" }, { "MonthPattern", "%n%u" }, { "MonthFuturePrefix", "\u4ECA\u304B\u3089" }, { "MonthFutureSuffix", "" }, { "MonthPastPrefix", "" }, { "MonthPastSuffix", "\u524D" }, { "MonthSingularName", "\u30F6\u6708" }, { "MonthPluralName", "\u30F6\u6708" }, { "SecondPattern", "%n%u" }, { "SecondFuturePrefix", "" }, { "SecondFutureSuffix", "\u4ECA\u304B\u3089" }, { "SecondPastPrefix", "" }, { "SecondPastSuffix", "\u524D" }, { "SecondSingularName", "\u79D2" }, { "SecondPluralName", "\u79D2" }, { "WeekPattern", "%n%u" }, { "WeekFuturePrefix", "\u4ECA\u304B\u3089" }, { "WeekFutureSuffix", "\u9031\u9593" }, { "WeekPastPrefix", "" }, { "WeekPastSuffix", "\u9031\u9593\u524D" }, { "WeekSingularName", "" }, { "WeekPluralName", "" }, { "YearPattern", "%n%u" }, { "YearFuturePrefix", "" }, { "YearFutureSuffix", "\u5E74\u5F8C\u306E" }, { "YearPastPrefix", "" }, { "YearPastSuffix", "\u5E74\u524D" }, { "YearSingularName", "" }, { "YearPluralName", "" }, { "AbstractTimeUnitPattern", "" }, { "AbstractTimeUnitFuturePrefix", "" }, { "AbstractTimeUnitFutureSuffix", "" }, { "AbstractTimeUnitPastPrefix", "" }, { "AbstractTimeUnitPastSuffix", "" }, { "AbstractTimeUnitSingularName", "" }, { "AbstractTimeUnitPluralName", "" } };
  private volatile ConcurrentMap<TimeUnit, TimeFormat> formatMap = new ConcurrentHashMap();

  public Object[][] getContents()
  {
    return OBJECTS;
  }

  public TimeFormat getFormatFor(TimeUnit paramTimeUnit)
  {
    if (!this.formatMap.containsKey(paramTimeUnit))
      this.formatMap.putIfAbsent(paramTimeUnit, new JaTimeFormat(this, paramTimeUnit));
    return (TimeFormat)this.formatMap.get(paramTimeUnit);
  }

  private static class JaTimeFormat
    implements TimeFormat
  {
    private static final String NEGATIVE = "-";
    public static final String QUANTITY = "%n";
    public static final String SIGN = "%s";
    public static final String UNIT = "%u";
    private final ResourceBundle bundle;
    private String futurePluralName = "";
    private String futurePrefix = "";
    private String futureSingularName = "";
    private String futureSuffix = "";
    private String pastPluralName = "";
    private String pastPrefix = "";
    private String pastSingularName = "";
    private String pastSuffix = "";
    private String pattern = "";
    private String pluralName = "";
    private int roundingTolerance = 50;
    private String singularName = "";

    public JaTimeFormat(ResourceBundle paramResourceBundle, TimeUnit paramTimeUnit)
    {
      this.bundle = paramResourceBundle;
      setPattern(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "Pattern"));
      setFuturePrefix(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "FuturePrefix"));
      setFutureSuffix(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "FutureSuffix"));
      setPastPrefix(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "PastPrefix"));
      setPastSuffix(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "PastSuffix"));
      setSingularName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "SingularName"));
      setPluralName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "PluralName"));
      try
      {
        setFuturePluralName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "FuturePluralName"));
        try
        {
          label337: setFutureSingularName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "FutureSingularName"));
          try
          {
            label369: setPastPluralName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "PastPluralName"));
            try
            {
              label401: setPastSingularName(paramResourceBundle.getString(getUnitName(paramTimeUnit) + "PastSingularName"));
              return;
            }
            catch (Exception localException4)
            {
            }
          }
          catch (Exception localException3)
          {
            break label401;
          }
        }
        catch (Exception localException2)
        {
          break label369;
        }
      }
      catch (Exception localException1)
      {
        break label337;
      }
    }

    private String applyPattern(String paramString1, String paramString2, long paramLong)
    {
      return getPattern(paramLong).replaceAll("%s", paramString1).replaceAll("%n", String.valueOf(paramLong)).replaceAll("%u", paramString2);
    }

    private String format(Duration paramDuration, boolean paramBoolean)
    {
      return applyPattern(getSign(paramDuration), getGramaticallyCorrectName(paramDuration, paramBoolean), getQuantity(paramDuration, paramBoolean));
    }

    private String getPluralName(Duration paramDuration)
    {
      if ((paramDuration.isInFuture()) && (this.futurePluralName != null) && (this.futureSingularName.length() > 0))
        return this.futurePluralName;
      if ((paramDuration.isInPast()) && (this.pastPluralName != null) && (this.pastSingularName.length() > 0))
        return this.pastPluralName;
      return this.pluralName;
    }

    private String getSign(Duration paramDuration)
    {
      if (paramDuration.getQuantity() < 0L)
        return "-";
      return "";
    }

    private String getSingularName(Duration paramDuration)
    {
      if ((paramDuration.isInFuture()) && (this.futureSingularName != null) && (this.futureSingularName.length() > 0))
        return this.futureSingularName;
      if ((paramDuration.isInPast()) && (this.pastSingularName != null) && (this.pastSingularName.length() > 0))
        return this.pastSingularName;
      return this.singularName;
    }

    private String getUnitName(TimeUnit paramTimeUnit)
    {
      return paramTimeUnit.getClass().getSimpleName();
    }

    public String decorate(Duration paramDuration, String paramString)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      if (paramDuration.isInPast())
        localStringBuilder.append(this.pastPrefix).append(paramString).append(this.pastSuffix);
      while (true)
      {
        return localStringBuilder.toString().replaceAll("\\s+", " ").trim();
        localStringBuilder.append(this.futurePrefix).append(paramString).append(this.futureSuffix);
      }
    }

    public String decorateUnrounded(Duration paramDuration, String paramString)
    {
      return decorate(paramDuration, paramString);
    }

    public String format(Duration paramDuration)
    {
      return format(paramDuration, true);
    }

    public String formatUnrounded(Duration paramDuration)
    {
      return format(paramDuration, false);
    }

    protected String getGramaticallyCorrectName(Duration paramDuration, boolean paramBoolean)
    {
      String str = getSingularName(paramDuration);
      if ((Math.abs(getQuantity(paramDuration, paramBoolean)) == 0L) || (Math.abs(getQuantity(paramDuration, paramBoolean)) > 1L))
        str = getPluralName(paramDuration);
      return str;
    }

    public String getPattern()
    {
      return this.pattern;
    }

    protected String getPattern(long paramLong)
    {
      return this.pattern;
    }

    protected long getQuantity(Duration paramDuration, boolean paramBoolean)
    {
      if (paramBoolean);
      for (long l = paramDuration.getQuantityRounded(this.roundingTolerance); ; l = paramDuration.getQuantity())
        return Math.abs(l);
    }

    public JaTimeFormat setFuturePluralName(String paramString)
    {
      this.futurePluralName = paramString;
      return this;
    }

    public JaTimeFormat setFuturePrefix(String paramString)
    {
      this.futurePrefix = paramString.trim();
      return this;
    }

    public JaTimeFormat setFutureSingularName(String paramString)
    {
      this.futureSingularName = paramString;
      return this;
    }

    public JaTimeFormat setFutureSuffix(String paramString)
    {
      this.futureSuffix = paramString.trim();
      return this;
    }

    public JaTimeFormat setPastPluralName(String paramString)
    {
      this.pastPluralName = paramString;
      return this;
    }

    public JaTimeFormat setPastPrefix(String paramString)
    {
      this.pastPrefix = paramString.trim();
      return this;
    }

    public JaTimeFormat setPastSingularName(String paramString)
    {
      this.pastSingularName = paramString;
      return this;
    }

    public JaTimeFormat setPastSuffix(String paramString)
    {
      this.pastSuffix = paramString.trim();
      return this;
    }

    public JaTimeFormat setPattern(String paramString)
    {
      this.pattern = paramString;
      return this;
    }

    public JaTimeFormat setPluralName(String paramString)
    {
      this.pluralName = paramString;
      return this;
    }

    public JaTimeFormat setRoundingTolerance(int paramInt)
    {
      this.roundingTolerance = paramInt;
      return this;
    }

    public JaTimeFormat setSingularName(String paramString)
    {
      this.singularName = paramString;
      return this;
    }

    public String toString()
    {
      return "JaTimeFormat [pattern=" + this.pattern + ", futurePrefix=" + this.futurePrefix + ", futureSuffix=" + this.futureSuffix + ", pastPrefix=" + this.pastPrefix + ", pastSuffix=" + this.pastSuffix + ", roundingTolerance=" + this.roundingTolerance + "]";
    }
  }
}