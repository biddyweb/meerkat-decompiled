package org.ocpsoft.prettytime.i18n;

import java.util.ListResourceBundle;
import java.util.ResourceBundle;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.format.SimpleTimeFormat;
import org.ocpsoft.prettytime.impl.TimeFormatProvider;
import org.ocpsoft.prettytime.units.Day;

public class Resources_fi extends ListResourceBundle
  implements TimeFormatProvider
{
  private static Object[][] CONTENTS = { { "JustNowPattern", "%u" }, { "JustNowPastSingularName", "hetki" }, { "JustNowFutureSingularName", "hetken" }, { "JustNowPastSuffix", "sitten" }, { "JustNowFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "MillisecondPattern", "%u" }, { "MillisecondPluralPattern", "%n %u" }, { "MillisecondPastSingularName", "millisekunti" }, { "MillisecondPastPluralName", "millisekuntia" }, { "MillisecondFutureSingularName", "millisekunnin" }, { "MillisecondPastSuffix", "sitten" }, { "MillisecondFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "SecondPattern", "%u" }, { "SecondPluralPattern", "%n %u" }, { "SecondPastSingularName", "sekunti" }, { "SecondPastPluralName", "sekuntia" }, { "SecondFutureSingularName", "sekunnin" }, { "SecondPastSuffix", "sitten" }, { "SecondFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "MinutePattern", "%u" }, { "MinutePluralPattern", "%n %u" }, { "MinutePastSingularName", "minuutti" }, { "MinutePastPluralName", "minuuttia" }, { "MinuteFutureSingularName", "minuutin" }, { "MinutePastSuffix", "sitten" }, { "MinuteFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "HourPattern", "%u" }, { "HourPluralPattern", "%n %u" }, { "HourPastSingularName", "tunti" }, { "HourPastPluralName", "tuntia" }, { "HourFutureSingularName", "tunnin" }, { "HourPastSuffix", "sitten" }, { "HourFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "DayPattern", "%u" }, { "DayPluralPattern", "%n %u" }, { "DayPastSingularName", "eilen" }, { "DayPastPluralName", "p\u00E4iv\u00E4\u00E4" }, { "DayFutureSingularName", "huomenna" }, { "DayFuturePluralName", "p\u00E4iv\u00E4n" }, { "DayPastSuffix", "sitten" }, { "DayFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "WeekPattern", "%u" }, { "WeekPluralPattern", "%n %u" }, { "WeekPastSingularName", "viikko" }, { "WeekPastPluralName", "viikkoa" }, { "WeekFutureSingularName", "viikon" }, { "WeekFuturePluralName", "viikon" }, { "WeekPastSuffix", "sitten" }, { "WeekFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "MonthPattern", "%u" }, { "MonthPluralPattern", "%n %u" }, { "MonthPastSingularName", "kuukausi" }, { "MonthPastPluralName", "kuukautta" }, { "MonthFutureSingularName", "kuukauden" }, { "MonthPastSuffix", "sitten" }, { "MonthFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "YearPattern", "%u" }, { "YearPluralPattern", "%n %u" }, { "YearPastSingularName", "vuosi" }, { "YearPastPluralName", "vuotta" }, { "YearFutureSingularName", "vuoden" }, { "YearPastSuffix", "sitten" }, { "YearFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "DecadePattern", "%u" }, { "DecadePluralPattern", "%n %u" }, { "DecadePastSingularName", "vuosikymmen" }, { "DecadePastPluralName", "vuosikymment\u00E4" }, { "DecadeFutureSingularName", "vuosikymmenen" }, { "DecadePastSuffix", "sitten" }, { "DecadeFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "CenturyPattern", "%u" }, { "CenturyPluralPattern", "%n %u" }, { "CenturyPastSingularName", "vuosisata" }, { "CenturyPastPluralName", "vuosisataa" }, { "CenturyFutureSingularName", "vuosisadan" }, { "CenturyPastSuffix", "sitten" }, { "CenturyFutureSuffix", "p\u00E4\u00E4st\u00E4" }, { "MillenniumPattern", "%u" }, { "MillenniumPluralPattern", "%n %u" }, { "MillenniumPastSingularName", "vuosituhat" }, { "MillenniumPastPluralName", "vuosituhatta" }, { "MillenniumFutureSingularName", "vuosituhannen" }, { "MillenniumPastSuffix", "sitten" }, { "MillenniumFutureSuffix", "p\u00E4\u00E4st\u00E4" } };
  private static final int tolerance = 50;
  private volatile ConcurrentMap<TimeUnit, TimeFormat> formatMap = new ConcurrentHashMap();

  protected Object[][] getContents()
  {
    return CONTENTS;
  }

  public TimeFormat getFormatFor(TimeUnit paramTimeUnit)
  {
    if (!this.formatMap.containsKey(paramTimeUnit))
      this.formatMap.putIfAbsent(paramTimeUnit, new FiTimeFormat(this, paramTimeUnit));
    return (TimeFormat)this.formatMap.get(paramTimeUnit);
  }

  private static class FiTimeFormat extends SimpleTimeFormat
  {
    private final ResourceBundle bundle;
    private String futureName = "";
    private String futurePluralName = "";
    private String pastName = "";
    private String pastPluralName = "";
    private String pluralPattern = "";

    public FiTimeFormat(ResourceBundle paramResourceBundle, TimeUnit paramTimeUnit)
    {
      this.bundle = paramResourceBundle;
      if (this.bundle.containsKey(getUnitName(paramTimeUnit) + "PastSingularName"))
      {
        setPastName(this.bundle.getString(getUnitName(paramTimeUnit) + "PastSingularName")).setFutureName(this.bundle.getString(getUnitName(paramTimeUnit) + "FutureSingularName")).setPastPluralName(this.bundle.getString(getUnitName(paramTimeUnit) + "PastSingularName")).setFuturePluralName(this.bundle.getString(getUnitName(paramTimeUnit) + "FutureSingularName")).setPluralPattern(this.bundle.getString(getUnitName(paramTimeUnit) + "Pattern"));
        if (this.bundle.containsKey(getUnitName(paramTimeUnit) + "PastPluralName"))
          setPastPluralName(this.bundle.getString(getUnitName(paramTimeUnit) + "PastPluralName"));
        if (this.bundle.containsKey(getUnitName(paramTimeUnit) + "FuturePluralName"))
          setFuturePluralName(this.bundle.getString(getUnitName(paramTimeUnit) + "FuturePluralName"));
        if (this.bundle.containsKey(getUnitName(paramTimeUnit) + "PluralPattern"))
          setPluralPattern(this.bundle.getString(getUnitName(paramTimeUnit) + "PluralPattern"));
        setPattern(this.bundle.getString(getUnitName(paramTimeUnit) + "Pattern")).setPastSuffix(this.bundle.getString(getUnitName(paramTimeUnit) + "PastSuffix")).setFutureSuffix(this.bundle.getString(getUnitName(paramTimeUnit) + "FutureSuffix")).setFuturePrefix("").setPastPrefix("").setSingularName("").setPluralName("");
      }
    }

    private String getUnitName(TimeUnit paramTimeUnit)
    {
      return paramTimeUnit.getClass().getSimpleName();
    }

    public String decorate(Duration paramDuration, String paramString)
    {
      if (((paramDuration.getUnit() instanceof Day)) && (Math.abs(paramDuration.getQuantityRounded(50)) == 1L))
        return paramString;
      return super.decorate(paramDuration, paramString);
    }

    public String getFutureName()
    {
      return this.futureName;
    }

    public String getFuturePluralName()
    {
      return this.futurePluralName;
    }

    protected String getGramaticallyCorrectName(Duration paramDuration, boolean paramBoolean)
    {
      if (paramDuration.isInPast());
      for (String str = getPastName(); ; str = getFutureName())
      {
        if ((Math.abs(getQuantity(paramDuration, paramBoolean)) == 0L) || (Math.abs(getQuantity(paramDuration, paramBoolean)) > 1L))
        {
          if (!paramDuration.isInPast())
            break;
          str = getPastPluralName();
        }
        return str;
      }
      return getFuturePluralName();
    }

    public String getPastName()
    {
      return this.pastName;
    }

    public String getPastPluralName()
    {
      return this.pastPluralName;
    }

    protected String getPattern(long paramLong)
    {
      if (Math.abs(paramLong) == 1L)
        return getPattern();
      return getPluralPattern();
    }

    public String getPluralPattern()
    {
      return this.pluralPattern;
    }

    public FiTimeFormat setFutureName(String paramString)
    {
      this.futureName = paramString;
      return this;
    }

    public FiTimeFormat setFuturePluralName(String paramString)
    {
      this.futurePluralName = paramString;
      return this;
    }

    public FiTimeFormat setPastName(String paramString)
    {
      this.pastName = paramString;
      return this;
    }

    public FiTimeFormat setPastPluralName(String paramString)
    {
      this.pastPluralName = paramString;
      return this;
    }

    public FiTimeFormat setPluralPattern(String paramString)
    {
      this.pluralPattern = paramString;
      return this;
    }
  }
}