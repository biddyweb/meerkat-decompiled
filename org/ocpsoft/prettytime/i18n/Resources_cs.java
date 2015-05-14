package org.ocpsoft.prettytime.i18n;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.ListResourceBundle;
import java.util.ResourceBundle;
import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.TimeUnit;
import org.ocpsoft.prettytime.format.SimpleTimeFormat;
import org.ocpsoft.prettytime.impl.TimeFormatProvider;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;

public class Resources_cs extends ListResourceBundle
  implements TimeFormatProvider
{
  private static final Object[][] OBJECTS = { { "CenturyPattern", "%n %u" }, { "CenturyFuturePrefix", "za " }, { "CenturyFutureSuffix", "" }, { "CenturyPastPrefix", "p\u0159ed " }, { "CenturyPastSuffix", "" }, { "CenturySingularName", "stolet\u00ED" }, { "CenturyPluralName", "stolet\u00ED" }, { "CenturyPastSingularName", "stolet\u00EDm" }, { "CenturyPastPluralName", "stolet\u00EDmi" }, { "CenturyFutureSingularName", "stolet\u00ED" }, { "CenturyFuturePluralName", "stolet\u00ED" }, { "DayPattern", "%n %u" }, { "DayFuturePrefix", "za " }, { "DayFutureSuffix", "" }, { "DayPastPrefix", "p\u0159ed " }, { "DayPastSuffix", "" }, { "DaySingularName", "den" }, { "DayPluralName", "dny" }, { "DecadePattern", "%n %u" }, { "DecadeFuturePrefix", "za " }, { "DecadeFutureSuffix", "" }, { "DecadePastPrefix", "p\u0159ed " }, { "DecadePastSuffix", "" }, { "DecadeSingularName", "desetilet\u00ED" }, { "DecadePluralName", "desetilet\u00ED" }, { "DecadePastSingularName", "desetilet\u00EDm" }, { "DecadePastPluralName", "desetilet\u00EDmi" }, { "DecadeFutureSingularName", "desetilet\u00ED" }, { "DecadeFuturePluralName", "desetilet\u00ED" }, { "HourPattern", "%n %u" }, { "HourFuturePrefix", "za " }, { "HourFutureSuffix", "" }, { "HourPastPrefix", "p\u0159ed" }, { "HourPastSuffix", "" }, { "HourSingularName", "hodina" }, { "HourPluralName", "hodiny" }, { "JustNowPattern", "%u" }, { "JustNowFuturePrefix", "" }, { "JustNowFutureSuffix", "za chv\u00EDli" }, { "JustNowPastPrefix", "p\u0159ed chv\u00EDl\u00ED" }, { "JustNowPastSuffix", "" }, { "JustNowSingularName", "" }, { "JustNowPluralName", "" }, { "MillenniumPattern", "%n %u" }, { "MillenniumFuturePrefix", "za " }, { "MillenniumFutureSuffix", "" }, { "MillenniumPastPrefix", "p\u0159ed " }, { "MillenniumPastSuffix", "" }, { "MillenniumSingularName", "tis\u00EDcilet\u00ED" }, { "MillenniumPluralName", "tis\u00EDcilet\u00ED" }, { "MillisecondPattern", "%n %u" }, { "MillisecondFuturePrefix", "za " }, { "MillisecondFutureSuffix", "" }, { "MillisecondPastPrefix", "p\u0159ed " }, { "MillisecondPastSuffix", "" }, { "MillisecondSingularName", "milisekunda" }, { "MillisecondPluralName", "milisekundy" }, { "MillisecondPastSingularName", "milisekundou" }, { "MillisecondPastPluralName", "milisekundami" }, { "MillisecondFutureSingularName", "milisekundu" }, { "MillisecondFuturePluralName", "milisekund" }, { "MinutePattern", "%n %u" }, { "MinuteFuturePrefix", "za " }, { "MinuteFutureSuffix", "" }, { "MinutePastPrefix", "p\u0159ed " }, { "MinutePastSuffix", "" }, { "MinuteSingularName", "minuta" }, { "MinutePluralName", "minuty" }, { "MonthPattern", "%n %u" }, { "MonthFuturePrefix", "za " }, { "MonthFutureSuffix", "" }, { "MonthPastPrefix", "p\u0159ed " }, { "MonthPastSuffix", "" }, { "MonthSingularName", "m\u011Bs\u00EDc" }, { "MonthPluralName", "m\u011Bs\u00EDce" }, { "SecondPattern", "%n %u" }, { "SecondFuturePrefix", "za " }, { "SecondFutureSuffix", "" }, { "SecondPastPrefix", "p\u0159ed " }, { "SecondPastSuffix", "" }, { "SecondSingularName", "sekunda" }, { "SecondPluralName", "sekundy" }, { "WeekPattern", "%n %u" }, { "WeekFuturePrefix", "za " }, { "WeekFutureSuffix", "" }, { "WeekPastPrefix", "p\u0159ed " }, { "WeekPastSuffix", "" }, { "WeekSingularName", "t\u00FDden" }, { "WeekPluralName", "t\u00FDdny" }, { "YearPattern", "%n %u" }, { "YearFuturePrefix", "za " }, { "YearFutureSuffix", "" }, { "YearPastPrefix", "p\u0159ed " }, { "YearPastSuffix", "" }, { "YearSingularName", "rok" }, { "YearPluralName", "roky" }, { "AbstractTimeUnitPattern", "" }, { "AbstractTimeUnitFuturePrefix", "" }, { "AbstractTimeUnitFutureSuffix", "" }, { "AbstractTimeUnitPastPrefix", "" }, { "AbstractTimeUnitPastSuffix", "" }, { "AbstractTimeUnitSingularName", "" }, { "AbstractTimeUnitPluralName", "" } };

  public Object[][] getContents()
  {
    return OBJECTS;
  }

  public TimeFormat getFormatFor(TimeUnit paramTimeUnit)
  {
    if ((paramTimeUnit instanceof Minute))
      return new CsTimeFormatBuilder("Minute").addFutureName("minutu", 1L).addFutureName("minuty", 4L).addFutureName("minut", 9223372036854775807L).addPastName("minutou", 1L).addPastName("minutami", 9223372036854775807L).build(this);
    if ((paramTimeUnit instanceof Hour))
      return new CsTimeFormatBuilder("Hour").addFutureName("hodinu", 1L).addFutureName("hodiny", 4L).addFutureName("hodin", 9223372036854775807L).addPastName("hodinou", 1L).addPastName("hodinami", 9223372036854775807L).build(this);
    if ((paramTimeUnit instanceof Day))
      return new CsTimeFormatBuilder("Day").addFutureName("den", 1L).addFutureName("dny", 4L).addFutureName("dn\u00ED", 9223372036854775807L).addPastName("dnem", 1L).addPastName("dny", 9223372036854775807L).build(this);
    if ((paramTimeUnit instanceof Week))
      return new CsTimeFormatBuilder("Week").addFutureName("t\u00FDden", 1L).addFutureName("t\u00FDdny", 4L).addFutureName("t\u00FDdn\u016F", 9223372036854775807L).addPastName("t\u00FDdnem", 1L).addPastName("t\u00FDdny", 9223372036854775807L).build(this);
    if ((paramTimeUnit instanceof Month))
      return new CsTimeFormatBuilder("Month").addFutureName("m\u011Bs\u00EDc", 1L).addFutureName("m\u011Bs\u00EDce", 4L).addFutureName("m\u011Bs\u00EDc\u016F", 9223372036854775807L).addPastName("m\u011Bs\u00EDcem", 1L).addPastName("m\u011Bs\u00EDci", 9223372036854775807L).build(this);
    if ((paramTimeUnit instanceof Year))
      return new CsTimeFormatBuilder("Year").addFutureName("rok", 1L).addFutureName("roky", 4L).addFutureName("let", 9223372036854775807L).addPastName("rokem", 1L).addPastName("roky", 9223372036854775807L).build(this);
    return null;
  }

  private static class CsName
    implements Comparable<CsName>
  {
    private final boolean isFuture;
    private final Long threshold;
    private final String value;

    public CsName(boolean paramBoolean, String paramString, Long paramLong)
    {
      this.isFuture = paramBoolean;
      this.value = paramString;
      this.threshold = paramLong;
    }

    public int compareTo(CsName paramCsName)
    {
      return this.threshold.compareTo(Long.valueOf(paramCsName.getThreshold()));
    }

    public String get()
    {
      return this.value;
    }

    public long getThreshold()
    {
      return this.threshold.longValue();
    }

    public boolean isFuture()
    {
      return this.isFuture;
    }
  }

  private static class CsTimeFormat extends SimpleTimeFormat
    implements TimeFormat
  {
    private final List<Resources_cs.CsName> futureNames = new ArrayList();
    private final List<Resources_cs.CsName> pastNames = new ArrayList();

    public CsTimeFormat(String paramString, ResourceBundle paramResourceBundle, Collection<Resources_cs.CsName> paramCollection)
    {
      setPattern(paramResourceBundle.getString(paramString + "Pattern"));
      setFuturePrefix(paramResourceBundle.getString(paramString + "FuturePrefix"));
      setFutureSuffix(paramResourceBundle.getString(paramString + "FutureSuffix"));
      setPastPrefix(paramResourceBundle.getString(paramString + "PastPrefix"));
      setPastSuffix(paramResourceBundle.getString(paramString + "PastSuffix"));
      setSingularName(paramResourceBundle.getString(paramString + "SingularName"));
      setPluralName(paramResourceBundle.getString(paramString + "PluralName"));
      try
      {
        setFuturePluralName(paramResourceBundle.getString(paramString + "FuturePluralName"));
        try
        {
          label250: setFutureSingularName(paramResourceBundle.getString(paramString + "FutureSingularName"));
          try
          {
            label278: setPastPluralName(paramResourceBundle.getString(paramString + "PastPluralName"));
            try
            {
              label306: setPastSingularName(paramResourceBundle.getString(paramString + "PastSingularName"));
              label334: Iterator localIterator = paramCollection.iterator();
              while (localIterator.hasNext())
              {
                Resources_cs.CsName localCsName = (Resources_cs.CsName)localIterator.next();
                if (localCsName.isFuture())
                  this.futureNames.add(localCsName);
                else
                  this.pastNames.add(localCsName);
              }
              Collections.sort(this.futureNames);
              Collections.sort(this.pastNames);
              return;
            }
            catch (Exception localException4)
            {
              break label334;
            }
          }
          catch (Exception localException3)
          {
            break label306;
          }
        }
        catch (Exception localException2)
        {
          break label278;
        }
      }
      catch (Exception localException1)
      {
        break label250;
      }
    }

    private String getGramaticallyCorrectName(long paramLong, List<Resources_cs.CsName> paramList)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Resources_cs.CsName localCsName = (Resources_cs.CsName)localIterator.next();
        if (localCsName.getThreshold() >= paramLong)
          return localCsName.get();
      }
      throw new IllegalStateException("Invalid resource bundle configuration");
    }

    protected String getGramaticallyCorrectName(Duration paramDuration, boolean paramBoolean)
    {
      long l = Math.abs(getQuantity(paramDuration, paramBoolean));
      if (paramDuration.isInFuture())
        return getGramaticallyCorrectName(l, this.futureNames);
      return getGramaticallyCorrectName(l, this.pastNames);
    }
  }

  private static class CsTimeFormatBuilder
  {
    private List<Resources_cs.CsName> names = new ArrayList();
    private String resourceKeyPrefix;

    CsTimeFormatBuilder(String paramString)
    {
      this.resourceKeyPrefix = paramString;
    }

    private CsTimeFormatBuilder addName(boolean paramBoolean, String paramString, long paramLong)
    {
      if (paramString == null)
        throw new IllegalArgumentException();
      this.names.add(new Resources_cs.CsName(paramBoolean, paramString, Long.valueOf(paramLong)));
      return this;
    }

    CsTimeFormatBuilder addFutureName(String paramString, long paramLong)
    {
      return addName(true, paramString, paramLong);
    }

    CsTimeFormatBuilder addPastName(String paramString, long paramLong)
    {
      return addName(false, paramString, paramLong);
    }

    Resources_cs.CsTimeFormat build(ResourceBundle paramResourceBundle)
    {
      return new Resources_cs.CsTimeFormat(this.resourceKeyPrefix, paramResourceBundle, this.names);
    }
  }
}