package org.ocpsoft.prettytime;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.ocpsoft.prettytime.impl.DurationImpl;
import org.ocpsoft.prettytime.impl.ResourcesTimeFormat;
import org.ocpsoft.prettytime.impl.ResourcesTimeUnit;
import org.ocpsoft.prettytime.units.Century;
import org.ocpsoft.prettytime.units.Day;
import org.ocpsoft.prettytime.units.Decade;
import org.ocpsoft.prettytime.units.Hour;
import org.ocpsoft.prettytime.units.JustNow;
import org.ocpsoft.prettytime.units.Millennium;
import org.ocpsoft.prettytime.units.Millisecond;
import org.ocpsoft.prettytime.units.Minute;
import org.ocpsoft.prettytime.units.Month;
import org.ocpsoft.prettytime.units.Second;
import org.ocpsoft.prettytime.units.TimeUnitComparator;
import org.ocpsoft.prettytime.units.Week;
import org.ocpsoft.prettytime.units.Year;

public class PrettyTime
{
  private volatile Locale locale = Locale.getDefault();
  private List<TimeUnit> mCachedUnits;
  private volatile Date reference;
  private volatile Map<TimeUnit, TimeFormat> units = new LinkedHashMap();

  public PrettyTime()
  {
    initTimeUnits();
  }

  public PrettyTime(Date paramDate)
  {
    this();
    setReference(paramDate);
  }

  public PrettyTime(Date paramDate, Locale paramLocale)
  {
    this(paramLocale);
    setReference(paramDate);
  }

  public PrettyTime(Locale paramLocale)
  {
    setLocale(paramLocale);
    initTimeUnits();
  }

  private void addUnit(ResourcesTimeUnit paramResourcesTimeUnit)
  {
    registerUnit(paramResourcesTimeUnit, new ResourcesTimeFormat(paramResourcesTimeUnit));
  }

  private Duration calculateDuration(long paramLong)
  {
    long l1 = Math.abs(paramLong);
    List localList = getUnits();
    DurationImpl localDurationImpl = new DurationImpl();
    label179: label212: for (int i = 0; ; i++)
    {
      TimeUnit localTimeUnit;
      long l2;
      long l3;
      if (i < localList.size())
      {
        localTimeUnit = (TimeUnit)localList.get(i);
        l2 = Math.abs(localTimeUnit.getMillisPerUnit());
        l3 = Math.abs(localTimeUnit.getMaxQuantity());
        if (i != -1 + localList.size())
          break label179;
      }
      for (int j = 1; ; j = 0)
      {
        if ((0L == l3) && (j == 0))
          l3 = ((TimeUnit)localList.get(i + 1)).getMillisPerUnit() / localTimeUnit.getMillisPerUnit();
        if ((l2 * l3 <= l1) && (j == 0))
          break label212;
        localDurationImpl.setUnit(localTimeUnit);
        if (l2 <= l1)
          break;
        localDurationImpl.setQuantity(getSign(paramLong));
        localDurationImpl.setDelta(0L);
        return localDurationImpl;
      }
      localDurationImpl.setQuantity(paramLong / l2);
      localDurationImpl.setDelta(paramLong - l2 * localDurationImpl.getQuantity());
      return localDurationImpl;
    }
  }

  private long getSign(long paramLong)
  {
    if (0L > paramLong)
      return -1L;
    return 1L;
  }

  private void initTimeUnits()
  {
    addUnit(new JustNow());
    addUnit(new Millisecond());
    addUnit(new Second());
    addUnit(new Minute());
    addUnit(new Hour());
    addUnit(new Day());
    addUnit(new Week());
    addUnit(new Month());
    addUnit(new Year());
    addUnit(new Decade());
    addUnit(new Century());
    addUnit(new Millennium());
  }

  public Duration approximateDuration(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("Date to approximate must not be null.");
    Date localDate = this.reference;
    if (localDate == null)
      localDate = new Date();
    return calculateDuration(paramDate.getTime() - localDate.getTime());
  }

  public List<Duration> calculatePreciseDuration(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("Date to calculate must not be null.");
    if (this.reference == null)
      this.reference = new Date();
    ArrayList localArrayList = new ArrayList();
    Duration localDuration = calculateDuration(paramDate.getTime() - this.reference.getTime());
    localArrayList.add(localDuration);
    while (true)
    {
      if (0L != localDuration.getDelta())
      {
        localDuration = calculateDuration(localDuration.getDelta());
        if ((localArrayList.size() <= 0) || (!((Duration)localArrayList.get(-1 + localArrayList.size())).getUnit().equals(localDuration.getUnit())));
      }
      else
      {
        return localArrayList;
      }
      localArrayList.add(localDuration);
    }
  }

  public List<TimeUnit> clearUnits()
  {
    List localList = getUnits();
    this.mCachedUnits = null;
    this.units.clear();
    return localList;
  }

  public String format(Calendar paramCalendar)
  {
    if (paramCalendar == null)
      throw new IllegalArgumentException("Provided Calendar must not be null.");
    return format(paramCalendar.getTime());
  }

  public String format(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("Date to format must not be null.");
    return format(approximateDuration(paramDate));
  }

  public String format(List<Duration> paramList)
  {
    if (paramList == null)
      throw new IllegalArgumentException("Duration list must not be null.");
    String str = null;
    if (paramList != null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      Duration localDuration = null;
      TimeFormat localTimeFormat = null;
      for (int i = 0; i < paramList.size(); i++)
      {
        localDuration = (Duration)paramList.get(i);
        localTimeFormat = getFormat(localDuration.getUnit());
        localStringBuilder.append(localTimeFormat.formatUnrounded(localDuration));
        localStringBuilder.append(" ");
      }
      str = localTimeFormat.decorateUnrounded(localDuration, localStringBuilder.toString());
    }
    return str;
  }

  public String format(Duration paramDuration)
  {
    if (paramDuration == null)
      throw new IllegalArgumentException("Duration to format must not be null.");
    TimeFormat localTimeFormat = getFormat(paramDuration.getUnit());
    return localTimeFormat.decorate(paramDuration, localTimeFormat.format(paramDuration));
  }

  public String formatApproximateDuration(Date paramDate)
  {
    return formatDuration(approximateDuration(paramDate));
  }

  public String formatDuration(Duration paramDuration)
  {
    return getFormat(paramDuration.getUnit()).format(paramDuration);
  }

  public String formatUnrounded(Date paramDate)
  {
    if (paramDate == null)
      throw new IllegalArgumentException("Date to format must not be null.");
    return formatUnrounded(approximateDuration(paramDate));
  }

  public String formatUnrounded(Duration paramDuration)
  {
    if (paramDuration == null)
      throw new IllegalArgumentException("Duration to format must not be null.");
    TimeFormat localTimeFormat = getFormat(paramDuration.getUnit());
    return localTimeFormat.decorateUnrounded(paramDuration, localTimeFormat.formatUnrounded(paramDuration));
  }

  public TimeFormat getFormat(TimeUnit paramTimeUnit)
  {
    if (paramTimeUnit == null)
      throw new IllegalArgumentException("Time unit must not be null.");
    if (this.units.get(paramTimeUnit) != null)
      return (TimeFormat)this.units.get(paramTimeUnit);
    return null;
  }

  public Locale getLocale()
  {
    return this.locale;
  }

  public Date getReference()
  {
    return this.reference;
  }

  public <UNIT extends TimeUnit> UNIT getUnit(Class<UNIT> paramClass)
  {
    if (paramClass == null)
      throw new IllegalArgumentException("Unit type to get must not be null.");
    Iterator localIterator = this.units.keySet().iterator();
    while (localIterator.hasNext())
    {
      TimeUnit localTimeUnit = (TimeUnit)localIterator.next();
      if (paramClass.isAssignableFrom(localTimeUnit.getClass()))
        return localTimeUnit;
    }
    return null;
  }

  public List<TimeUnit> getUnits()
  {
    if (this.mCachedUnits == null)
    {
      ArrayList localArrayList = new ArrayList(this.units.keySet());
      Collections.sort(localArrayList, new TimeUnitComparator());
      this.mCachedUnits = Collections.unmodifiableList(localArrayList);
    }
    return this.mCachedUnits;
  }

  public PrettyTime registerUnit(TimeUnit paramTimeUnit, TimeFormat paramTimeFormat)
  {
    if (paramTimeUnit == null)
      throw new IllegalArgumentException("Unit to register must not be null.");
    if (paramTimeFormat == null)
      throw new IllegalArgumentException("Format to register must not be null.");
    this.mCachedUnits = null;
    this.units.put(paramTimeUnit, paramTimeFormat);
    if ((paramTimeUnit instanceof LocaleAware))
      ((LocaleAware)paramTimeUnit).setLocale(this.locale);
    if ((paramTimeFormat instanceof LocaleAware))
      ((LocaleAware)paramTimeFormat).setLocale(this.locale);
    return this;
  }

  public <UNIT extends TimeUnit> TimeFormat removeUnit(Class<UNIT> paramClass)
  {
    if (paramClass == null)
      throw new IllegalArgumentException("Unit type to remove must not be null.");
    Iterator localIterator = this.units.keySet().iterator();
    TimeUnit localTimeUnit;
    do
    {
      boolean bool = localIterator.hasNext();
      localTimeFormat = null;
      if (!bool)
        break;
      localTimeUnit = (TimeUnit)localIterator.next();
    }
    while (!paramClass.isAssignableFrom(localTimeUnit.getClass()));
    this.mCachedUnits = null;
    TimeFormat localTimeFormat = (TimeFormat)this.units.remove(localTimeUnit);
    return localTimeFormat;
  }

  public TimeFormat removeUnit(TimeUnit paramTimeUnit)
  {
    if (paramTimeUnit == null)
      throw new IllegalArgumentException("Unit to remove must not be null.");
    this.mCachedUnits = null;
    return (TimeFormat)this.units.remove(paramTimeUnit);
  }

  public PrettyTime setLocale(Locale paramLocale)
  {
    this.locale = paramLocale;
    Iterator localIterator1 = this.units.keySet().iterator();
    while (localIterator1.hasNext())
    {
      TimeUnit localTimeUnit = (TimeUnit)localIterator1.next();
      if ((localTimeUnit instanceof LocaleAware))
        ((LocaleAware)localTimeUnit).setLocale(paramLocale);
    }
    Iterator localIterator2 = this.units.values().iterator();
    while (localIterator2.hasNext())
    {
      TimeFormat localTimeFormat = (TimeFormat)localIterator2.next();
      if ((localTimeFormat instanceof LocaleAware))
        ((LocaleAware)localTimeFormat).setLocale(paramLocale);
    }
    return this;
  }

  public PrettyTime setReference(Date paramDate)
  {
    this.reference = paramDate;
    return this;
  }

  public String toString()
  {
    return "PrettyTime [reference=" + this.reference + ", locale=" + this.locale + "]";
  }
}