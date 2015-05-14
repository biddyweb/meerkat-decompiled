package org.joda.time.chrono;

import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.Instant;
import org.joda.time.LocalDate;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadablePartial;
import org.joda.time.field.BaseDateTimeField;
import org.joda.time.field.DecoratedDurationField;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public final class GJChronology extends AssembledChronology
{
  static final Instant DEFAULT_CUTOVER = new Instant(-12219292800000L);
  private static final ConcurrentHashMap<GJCacheKey, GJChronology> cCache = new ConcurrentHashMap();
  private static final long serialVersionUID = -2545574827706931671L;
  private Instant iCutoverInstant;
  private long iCutoverMillis;
  private long iGapDuration;
  private GregorianChronology iGregorianChronology;
  private JulianChronology iJulianChronology;

  private GJChronology(Chronology paramChronology, JulianChronology paramJulianChronology, GregorianChronology paramGregorianChronology, Instant paramInstant)
  {
    super(paramChronology, new Object[] { paramJulianChronology, paramGregorianChronology, paramInstant });
  }

  private GJChronology(JulianChronology paramJulianChronology, GregorianChronology paramGregorianChronology, Instant paramInstant)
  {
    super(null, new Object[] { paramJulianChronology, paramGregorianChronology, paramInstant });
  }

  private static long convertByWeekyear(long paramLong, Chronology paramChronology1, Chronology paramChronology2)
  {
    long l1 = paramChronology2.weekyear().set(0L, paramChronology1.weekyear().get(paramLong));
    long l2 = paramChronology2.weekOfWeekyear().set(l1, paramChronology1.weekOfWeekyear().get(paramLong));
    long l3 = paramChronology2.dayOfWeek().set(l2, paramChronology1.dayOfWeek().get(paramLong));
    return paramChronology2.millisOfDay().set(l3, paramChronology1.millisOfDay().get(paramLong));
  }

  private static long convertByYear(long paramLong, Chronology paramChronology1, Chronology paramChronology2)
  {
    return paramChronology2.getDateTimeMillis(paramChronology1.year().get(paramLong), paramChronology1.monthOfYear().get(paramLong), paramChronology1.dayOfMonth().get(paramLong), paramChronology1.millisOfDay().get(paramLong));
  }

  public static GJChronology getInstance()
  {
    return getInstance(DateTimeZone.getDefault(), DEFAULT_CUTOVER, 4);
  }

  public static GJChronology getInstance(DateTimeZone paramDateTimeZone)
  {
    return getInstance(paramDateTimeZone, DEFAULT_CUTOVER, 4);
  }

  public static GJChronology getInstance(DateTimeZone paramDateTimeZone, long paramLong, int paramInt)
  {
    if (paramLong == DEFAULT_CUTOVER.getMillis());
    for (Object localObject = null; ; localObject = new Instant(paramLong))
      return getInstance(paramDateTimeZone, (ReadableInstant)localObject, paramInt);
  }

  public static GJChronology getInstance(DateTimeZone paramDateTimeZone, ReadableInstant paramReadableInstant)
  {
    return getInstance(paramDateTimeZone, paramReadableInstant, 4);
  }

  public static GJChronology getInstance(DateTimeZone paramDateTimeZone, ReadableInstant paramReadableInstant, int paramInt)
  {
    DateTimeZone localDateTimeZone = DateTimeUtils.getZone(paramDateTimeZone);
    if (paramReadableInstant == null);
    Instant localInstant;
    label136: label183: for (Object localObject = DEFAULT_CUTOVER; ; localObject = localInstant)
    {
      GJCacheKey localGJCacheKey = new GJCacheKey(localDateTimeZone, (Instant)localObject, paramInt);
      GJChronology localGJChronology1 = (GJChronology)cCache.get(localGJCacheKey);
      if (localGJChronology1 == null)
        if (localDateTimeZone != DateTimeZone.UTC)
          break label136;
      GJChronology localGJChronology2;
      for (GJChronology localGJChronology3 = new GJChronology(JulianChronology.getInstance(localDateTimeZone, paramInt), GregorianChronology.getInstance(localDateTimeZone, paramInt), (Instant)localObject); ; localGJChronology3 = new GJChronology(ZonedChronology.getInstance(localGJChronology2, localDateTimeZone), localGJChronology2.iJulianChronology, localGJChronology2.iGregorianChronology, localGJChronology2.iCutoverInstant))
      {
        localGJChronology1 = (GJChronology)cCache.putIfAbsent(localGJCacheKey, localGJChronology3);
        if (localGJChronology1 == null)
          break;
        return localGJChronology1;
        localInstant = paramReadableInstant.toInstant();
        if (new LocalDate(localInstant.getMillis(), GregorianChronology.getInstance(localDateTimeZone)).getYear() > 0)
          break label183;
        throw new IllegalArgumentException("Cutover too early. Must be on or after 0001-01-01.");
        localGJChronology2 = getInstance(DateTimeZone.UTC, (ReadableInstant)localObject, paramInt);
      }
      return localGJChronology3;
    }
  }

  public static GJChronology getInstanceUTC()
  {
    return getInstance(DateTimeZone.UTC, DEFAULT_CUTOVER, 4);
  }

  private Object readResolve()
  {
    return getInstance(getZone(), this.iCutoverInstant, getMinimumDaysInFirstWeek());
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    Object[] arrayOfObject = (Object[])getParam();
    JulianChronology localJulianChronology = (JulianChronology)arrayOfObject[0];
    GregorianChronology localGregorianChronology = (GregorianChronology)arrayOfObject[1];
    Instant localInstant = (Instant)arrayOfObject[2];
    this.iCutoverMillis = localInstant.getMillis();
    this.iJulianChronology = localJulianChronology;
    this.iGregorianChronology = localGregorianChronology;
    this.iCutoverInstant = localInstant;
    if (getBase() != null)
      return;
    if (localJulianChronology.getMinimumDaysInFirstWeek() != localGregorianChronology.getMinimumDaysInFirstWeek())
      throw new IllegalArgumentException();
    this.iGapDuration = (this.iCutoverMillis - julianToGregorianByYear(this.iCutoverMillis));
    paramFields.copyFieldsFrom(localGregorianChronology);
    if (localGregorianChronology.millisOfDay().get(this.iCutoverMillis) == 0)
    {
      paramFields.millisOfSecond = new CutoverField(localJulianChronology.millisOfSecond(), paramFields.millisOfSecond, this.iCutoverMillis);
      paramFields.millisOfDay = new CutoverField(localJulianChronology.millisOfDay(), paramFields.millisOfDay, this.iCutoverMillis);
      paramFields.secondOfMinute = new CutoverField(localJulianChronology.secondOfMinute(), paramFields.secondOfMinute, this.iCutoverMillis);
      paramFields.secondOfDay = new CutoverField(localJulianChronology.secondOfDay(), paramFields.secondOfDay, this.iCutoverMillis);
      paramFields.minuteOfHour = new CutoverField(localJulianChronology.minuteOfHour(), paramFields.minuteOfHour, this.iCutoverMillis);
      paramFields.minuteOfDay = new CutoverField(localJulianChronology.minuteOfDay(), paramFields.minuteOfDay, this.iCutoverMillis);
      paramFields.hourOfDay = new CutoverField(localJulianChronology.hourOfDay(), paramFields.hourOfDay, this.iCutoverMillis);
      paramFields.hourOfHalfday = new CutoverField(localJulianChronology.hourOfHalfday(), paramFields.hourOfHalfday, this.iCutoverMillis);
      paramFields.clockhourOfDay = new CutoverField(localJulianChronology.clockhourOfDay(), paramFields.clockhourOfDay, this.iCutoverMillis);
      paramFields.clockhourOfHalfday = new CutoverField(localJulianChronology.clockhourOfHalfday(), paramFields.clockhourOfHalfday, this.iCutoverMillis);
      paramFields.halfdayOfDay = new CutoverField(localJulianChronology.halfdayOfDay(), paramFields.halfdayOfDay, this.iCutoverMillis);
    }
    paramFields.era = new CutoverField(localJulianChronology.era(), paramFields.era, this.iCutoverMillis);
    paramFields.year = new ImpreciseCutoverField(localJulianChronology.year(), paramFields.year, this.iCutoverMillis);
    paramFields.years = paramFields.year.getDurationField();
    paramFields.yearOfEra = new ImpreciseCutoverField(localJulianChronology.yearOfEra(), paramFields.yearOfEra, paramFields.years, this.iCutoverMillis);
    paramFields.centuryOfEra = new ImpreciseCutoverField(localJulianChronology.centuryOfEra(), paramFields.centuryOfEra, this.iCutoverMillis);
    paramFields.centuries = paramFields.centuryOfEra.getDurationField();
    paramFields.yearOfCentury = new ImpreciseCutoverField(localJulianChronology.yearOfCentury(), paramFields.yearOfCentury, paramFields.years, paramFields.centuries, this.iCutoverMillis);
    paramFields.monthOfYear = new ImpreciseCutoverField(localJulianChronology.monthOfYear(), paramFields.monthOfYear, null, paramFields.years, this.iCutoverMillis);
    paramFields.months = paramFields.monthOfYear.getDurationField();
    paramFields.weekyear = new ImpreciseCutoverField(localJulianChronology.weekyear(), paramFields.weekyear, null, this.iCutoverMillis, true);
    paramFields.weekyears = paramFields.weekyear.getDurationField();
    paramFields.weekyearOfCentury = new ImpreciseCutoverField(localJulianChronology.weekyearOfCentury(), paramFields.weekyearOfCentury, paramFields.weekyears, paramFields.centuries, this.iCutoverMillis);
    long l1 = localGregorianChronology.year().roundCeiling(this.iCutoverMillis);
    paramFields.dayOfYear = new CutoverField(localJulianChronology.dayOfYear(), paramFields.dayOfYear, paramFields.years, l1, false);
    long l2 = localGregorianChronology.weekyear().roundCeiling(this.iCutoverMillis);
    paramFields.weekOfWeekyear = new CutoverField(localJulianChronology.weekOfWeekyear(), paramFields.weekOfWeekyear, paramFields.weekyears, l2, true);
    CutoverField localCutoverField = new CutoverField(localJulianChronology.dayOfMonth(), paramFields.dayOfMonth, this.iCutoverMillis);
    localCutoverField.iRangeDurationField = paramFields.months;
    paramFields.dayOfMonth = localCutoverField;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    GJChronology localGJChronology;
    do
    {
      return true;
      if (!(paramObject instanceof GJChronology))
        break;
      localGJChronology = (GJChronology)paramObject;
    }
    while ((this.iCutoverMillis == localGJChronology.iCutoverMillis) && (getMinimumDaysInFirstWeek() == localGJChronology.getMinimumDaysInFirstWeek()) && (getZone().equals(localGJChronology.getZone())));
    return false;
    return false;
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    Chronology localChronology = getBase();
    long l;
    if (localChronology != null)
      l = localChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4);
    do
    {
      do
      {
        return l;
        l = this.iGregorianChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4);
      }
      while (l >= this.iCutoverMillis);
      l = this.iJulianChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    while (l < this.iCutoverMillis);
    throw new IllegalArgumentException("Specified date does not exist");
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
    throws IllegalArgumentException
  {
    Chronology localChronology = getBase();
    long l1;
    if (localChronology != null)
      l1 = localChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
    while (true)
    {
      return l1;
      try
      {
        long l2 = this.iGregorianChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
        l1 = l2;
        if (l1 >= this.iCutoverMillis)
          continue;
        l1 = this.iJulianChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
        if (l1 < this.iCutoverMillis)
          continue;
        throw new IllegalArgumentException("Specified date does not exist");
      }
      catch (IllegalFieldValueException localIllegalFieldValueException)
      {
        do
        {
          if ((paramInt2 != 2) || (paramInt3 != 29))
            throw localIllegalFieldValueException;
          l1 = this.iGregorianChronology.getDateTimeMillis(paramInt1, paramInt2, 28, paramInt4, paramInt5, paramInt6, paramInt7);
        }
        while (l1 < this.iCutoverMillis);
        throw localIllegalFieldValueException;
      }
    }
  }

  public Instant getGregorianCutover()
  {
    return this.iCutoverInstant;
  }

  public int getMinimumDaysInFirstWeek()
  {
    return this.iGregorianChronology.getMinimumDaysInFirstWeek();
  }

  public DateTimeZone getZone()
  {
    Chronology localChronology = getBase();
    if (localChronology != null)
      return localChronology.getZone();
    return DateTimeZone.UTC;
  }

  long gregorianToJulianByWeekyear(long paramLong)
  {
    return convertByWeekyear(paramLong, this.iGregorianChronology, this.iJulianChronology);
  }

  long gregorianToJulianByYear(long paramLong)
  {
    return convertByYear(paramLong, this.iGregorianChronology, this.iJulianChronology);
  }

  public int hashCode()
  {
    return 11 * "GJ".hashCode() + getZone().hashCode() + getMinimumDaysInFirstWeek() + this.iCutoverInstant.hashCode();
  }

  long julianToGregorianByWeekyear(long paramLong)
  {
    return convertByWeekyear(paramLong, this.iJulianChronology, this.iGregorianChronology);
  }

  long julianToGregorianByYear(long paramLong)
  {
    return convertByYear(paramLong, this.iJulianChronology, this.iGregorianChronology);
  }

  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer(60);
    localStringBuffer.append("GJChronology");
    localStringBuffer.append('[');
    localStringBuffer.append(getZone().getID());
    if (this.iCutoverMillis != DEFAULT_CUTOVER.getMillis())
    {
      localStringBuffer.append(",cutover=");
      if (withUTC().dayOfYear().remainder(this.iCutoverMillis) != 0L)
        break label137;
    }
    label137: for (DateTimeFormatter localDateTimeFormatter = ISODateTimeFormat.date(); ; localDateTimeFormatter = ISODateTimeFormat.dateTime())
    {
      localDateTimeFormatter.withChronology(withUTC()).printTo(localStringBuffer, this.iCutoverMillis);
      if (getMinimumDaysInFirstWeek() != 4)
      {
        localStringBuffer.append(",mdfw=");
        localStringBuffer.append(getMinimumDaysInFirstWeek());
      }
      localStringBuffer.append(']');
      return localStringBuffer.toString();
    }
  }

  public Chronology withUTC()
  {
    return withZone(DateTimeZone.UTC);
  }

  public Chronology withZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    if (paramDateTimeZone == getZone())
      return this;
    return getInstance(paramDateTimeZone, this.iCutoverInstant, getMinimumDaysInFirstWeek());
  }

  private class CutoverField extends BaseDateTimeField
  {
    private static final long serialVersionUID = 3528501219481026402L;
    final boolean iConvertByWeekyear;
    final long iCutover;
    protected DurationField iDurationField;
    final DateTimeField iGregorianField;
    final DateTimeField iJulianField;
    protected DurationField iRangeDurationField;

    CutoverField(DateTimeField paramDateTimeField1, DateTimeField paramLong, long arg4)
    {
      this(paramDateTimeField1, paramLong, localObject, false);
    }

    CutoverField(DateTimeField paramDateTimeField1, DateTimeField paramLong, long arg4, boolean arg6)
    {
      this(paramDateTimeField1, paramLong, null, ???, bool1);
    }

    CutoverField(DateTimeField paramDateTimeField1, DateTimeField paramDurationField, DurationField paramLong, long arg5, boolean arg7)
    {
      super();
      this.iJulianField = paramDateTimeField1;
      this.iGregorianField = paramDurationField;
      this.iCutover = ???;
      boolean bool1;
      this.iConvertByWeekyear = bool1;
      this.iDurationField = paramDurationField.getDurationField();
      if (paramLong == null)
      {
        paramLong = paramDurationField.getRangeDurationField();
        if (paramLong == null)
          paramLong = paramDateTimeField1.getRangeDurationField();
      }
      this.iRangeDurationField = paramLong;
    }

    public long add(long paramLong, int paramInt)
    {
      return this.iGregorianField.add(paramLong, paramInt);
    }

    public long add(long paramLong1, long paramLong2)
    {
      return this.iGregorianField.add(paramLong1, paramLong2);
    }

    public int[] add(ReadablePartial paramReadablePartial, int paramInt1, int[] paramArrayOfInt, int paramInt2)
    {
      if (paramInt2 == 0)
        return paramArrayOfInt;
      if (DateTimeUtils.isContiguous(paramReadablePartial))
      {
        long l1 = 0L;
        int i = 0;
        int j = paramReadablePartial.size();
        while (i < j)
        {
          l1 = paramReadablePartial.getFieldType(i).getField(GJChronology.this).set(l1, paramArrayOfInt[i]);
          i++;
        }
        long l2 = add(l1, paramInt2);
        return GJChronology.this.get(paramReadablePartial, l2);
      }
      return super.add(paramReadablePartial, paramInt1, paramArrayOfInt, paramInt2);
    }

    public int get(long paramLong)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.get(paramLong);
      return this.iJulianField.get(paramLong);
    }

    public String getAsShortText(int paramInt, Locale paramLocale)
    {
      return this.iGregorianField.getAsShortText(paramInt, paramLocale);
    }

    public String getAsShortText(long paramLong, Locale paramLocale)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.getAsShortText(paramLong, paramLocale);
      return this.iJulianField.getAsShortText(paramLong, paramLocale);
    }

    public String getAsText(int paramInt, Locale paramLocale)
    {
      return this.iGregorianField.getAsText(paramInt, paramLocale);
    }

    public String getAsText(long paramLong, Locale paramLocale)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.getAsText(paramLong, paramLocale);
      return this.iJulianField.getAsText(paramLong, paramLocale);
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      return this.iGregorianField.getDifference(paramLong1, paramLong2);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      return this.iGregorianField.getDifferenceAsLong(paramLong1, paramLong2);
    }

    public DurationField getDurationField()
    {
      return this.iDurationField;
    }

    public int getLeapAmount(long paramLong)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.getLeapAmount(paramLong);
      return this.iJulianField.getLeapAmount(paramLong);
    }

    public DurationField getLeapDurationField()
    {
      return this.iGregorianField.getLeapDurationField();
    }

    public int getMaximumShortTextLength(Locale paramLocale)
    {
      return Math.max(this.iJulianField.getMaximumShortTextLength(paramLocale), this.iGregorianField.getMaximumShortTextLength(paramLocale));
    }

    public int getMaximumTextLength(Locale paramLocale)
    {
      return Math.max(this.iJulianField.getMaximumTextLength(paramLocale), this.iGregorianField.getMaximumTextLength(paramLocale));
    }

    public int getMaximumValue()
    {
      return this.iGregorianField.getMaximumValue();
    }

    public int getMaximumValue(long paramLong)
    {
      int i;
      if (paramLong >= this.iCutover)
        i = this.iGregorianField.getMaximumValue(paramLong);
      do
      {
        return i;
        i = this.iJulianField.getMaximumValue(paramLong);
      }
      while (this.iJulianField.set(paramLong, i) < this.iCutover);
      return this.iJulianField.get(this.iJulianField.add(this.iCutover, -1));
    }

    public int getMaximumValue(ReadablePartial paramReadablePartial)
    {
      return getMaximumValue(GJChronology.getInstanceUTC().set(paramReadablePartial, 0L));
    }

    public int getMaximumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
    {
      GJChronology localGJChronology = GJChronology.getInstanceUTC();
      int i = paramReadablePartial.size();
      long l = 0L;
      for (int j = 0; j < i; j++)
      {
        DateTimeField localDateTimeField = paramReadablePartial.getFieldType(j).getField(localGJChronology);
        if (paramArrayOfInt[j] <= localDateTimeField.getMaximumValue(l))
          l = localDateTimeField.set(l, paramArrayOfInt[j]);
      }
      return getMaximumValue(l);
    }

    public int getMinimumValue()
    {
      return this.iJulianField.getMinimumValue();
    }

    public int getMinimumValue(long paramLong)
    {
      int i;
      if (paramLong < this.iCutover)
        i = this.iJulianField.getMinimumValue(paramLong);
      do
      {
        return i;
        i = this.iGregorianField.getMinimumValue(paramLong);
      }
      while (this.iGregorianField.set(paramLong, i) >= this.iCutover);
      return this.iGregorianField.get(this.iCutover);
    }

    public int getMinimumValue(ReadablePartial paramReadablePartial)
    {
      return this.iJulianField.getMinimumValue(paramReadablePartial);
    }

    public int getMinimumValue(ReadablePartial paramReadablePartial, int[] paramArrayOfInt)
    {
      return this.iJulianField.getMinimumValue(paramReadablePartial, paramArrayOfInt);
    }

    public DurationField getRangeDurationField()
    {
      return this.iRangeDurationField;
    }

    protected long gregorianToJulian(long paramLong)
    {
      if (this.iConvertByWeekyear)
        return GJChronology.this.gregorianToJulianByWeekyear(paramLong);
      return GJChronology.this.gregorianToJulianByYear(paramLong);
    }

    public boolean isLeap(long paramLong)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.isLeap(paramLong);
      return this.iJulianField.isLeap(paramLong);
    }

    public boolean isLenient()
    {
      return false;
    }

    protected long julianToGregorian(long paramLong)
    {
      if (this.iConvertByWeekyear)
        return GJChronology.this.julianToGregorianByWeekyear(paramLong);
      return GJChronology.this.julianToGregorianByYear(paramLong);
    }

    public long roundCeiling(long paramLong)
    {
      long l;
      if (paramLong >= this.iCutover)
        l = this.iGregorianField.roundCeiling(paramLong);
      do
      {
        return l;
        l = this.iJulianField.roundCeiling(paramLong);
      }
      while ((l < this.iCutover) || (l - GJChronology.this.iGapDuration < this.iCutover));
      return julianToGregorian(l);
    }

    public long roundFloor(long paramLong)
    {
      if (paramLong >= this.iCutover)
      {
        long l = this.iGregorianField.roundFloor(paramLong);
        if ((l < this.iCutover) && (l + GJChronology.this.iGapDuration < this.iCutover))
          l = gregorianToJulian(l);
        return l;
      }
      return this.iJulianField.roundFloor(paramLong);
    }

    public long set(long paramLong, int paramInt)
    {
      long l;
      if (paramLong >= this.iCutover)
      {
        l = this.iGregorianField.set(paramLong, paramInt);
        if (l < this.iCutover)
        {
          if (l + GJChronology.this.iGapDuration < this.iCutover)
            l = gregorianToJulian(l);
          if (get(l) != paramInt)
            throw new IllegalFieldValueException(this.iGregorianField.getType(), Integer.valueOf(paramInt), null, null);
        }
      }
      else
      {
        l = this.iJulianField.set(paramLong, paramInt);
        if (l >= this.iCutover)
        {
          if (l - GJChronology.this.iGapDuration >= this.iCutover)
            l = julianToGregorian(l);
          if (get(l) != paramInt)
            throw new IllegalFieldValueException(this.iJulianField.getType(), Integer.valueOf(paramInt), null, null);
        }
      }
      return l;
    }

    public long set(long paramLong, String paramString, Locale paramLocale)
    {
      long l;
      if (paramLong >= this.iCutover)
      {
        l = this.iGregorianField.set(paramLong, paramString, paramLocale);
        if ((l < this.iCutover) && (l + GJChronology.this.iGapDuration < this.iCutover))
          l = gregorianToJulian(l);
      }
      do
      {
        return l;
        l = this.iJulianField.set(paramLong, paramString, paramLocale);
      }
      while ((l < this.iCutover) || (l - GJChronology.this.iGapDuration < this.iCutover));
      return julianToGregorian(l);
    }
  }

  private final class ImpreciseCutoverField extends GJChronology.CutoverField
  {
    private static final long serialVersionUID = 3410248757173576441L;

    ImpreciseCutoverField(DateTimeField paramDateTimeField1, DateTimeField paramLong, long arg4)
    {
      this(paramDateTimeField1, paramLong, null, localObject, false);
    }

    ImpreciseCutoverField(DateTimeField paramDateTimeField1, DateTimeField paramDurationField, DurationField paramLong, long arg5)
    {
      this(paramDateTimeField1, paramDurationField, paramLong, localObject, false);
    }

    ImpreciseCutoverField(DateTimeField paramDateTimeField1, DateTimeField paramDurationField, DurationField paramLong, long arg5, boolean arg7)
    {
      super(paramDateTimeField1, paramDurationField, ???, bool1);
      if (paramLong == null)
        paramLong = new GJChronology.LinkedDurationField(this.iDurationField, this);
      this.iDurationField = paramLong;
    }

    ImpreciseCutoverField(DateTimeField paramDateTimeField1, DateTimeField paramDurationField1, DurationField paramDurationField2, DurationField paramLong, long arg6)
    {
      this(paramDateTimeField1, paramDurationField1, paramDurationField2, localObject, false);
      this.iRangeDurationField = paramLong;
    }

    public long add(long paramLong, int paramInt)
    {
      long l;
      if (paramLong >= this.iCutover)
      {
        l = this.iGregorianField.add(paramLong, paramInt);
        if ((l < this.iCutover) && (l + GJChronology.this.iGapDuration < this.iCutover))
        {
          if (!this.iConvertByWeekyear)
            break label102;
          if (GJChronology.this.iGregorianChronology.weekyear().get(l) <= 0)
            l = GJChronology.this.iGregorianChronology.weekyear().add(l, -1);
          l = gregorianToJulian(l);
        }
      }
      label102: 
      do
      {
        return l;
        if (GJChronology.this.iGregorianChronology.year().get(l) > 0)
          break;
        l = GJChronology.this.iGregorianChronology.year().add(l, -1);
        break;
        l = this.iJulianField.add(paramLong, paramInt);
      }
      while ((l < this.iCutover) || (l - GJChronology.this.iGapDuration < this.iCutover));
      return julianToGregorian(l);
    }

    public long add(long paramLong1, long paramLong2)
    {
      long l;
      if (paramLong1 >= this.iCutover)
      {
        l = this.iGregorianField.add(paramLong1, paramLong2);
        if ((l < this.iCutover) && (l + GJChronology.this.iGapDuration < this.iCutover))
        {
          if (!this.iConvertByWeekyear)
            break label102;
          if (GJChronology.this.iGregorianChronology.weekyear().get(l) <= 0)
            l = GJChronology.this.iGregorianChronology.weekyear().add(l, -1);
          l = gregorianToJulian(l);
        }
      }
      label102: 
      do
      {
        return l;
        if (GJChronology.this.iGregorianChronology.year().get(l) > 0)
          break;
        l = GJChronology.this.iGregorianChronology.year().add(l, -1);
        break;
        l = this.iJulianField.add(paramLong1, paramLong2);
      }
      while ((l < this.iCutover) || (l - GJChronology.this.iGapDuration < this.iCutover));
      return julianToGregorian(l);
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      if (paramLong1 >= this.iCutover)
      {
        if (paramLong2 >= this.iCutover)
          return this.iGregorianField.getDifference(paramLong1, paramLong2);
        long l2 = gregorianToJulian(paramLong1);
        return this.iJulianField.getDifference(l2, paramLong2);
      }
      if (paramLong2 < this.iCutover)
        return this.iJulianField.getDifference(paramLong1, paramLong2);
      long l1 = julianToGregorian(paramLong1);
      return this.iGregorianField.getDifference(l1, paramLong2);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      if (paramLong1 >= this.iCutover)
      {
        if (paramLong2 >= this.iCutover)
          return this.iGregorianField.getDifferenceAsLong(paramLong1, paramLong2);
        long l2 = gregorianToJulian(paramLong1);
        return this.iJulianField.getDifferenceAsLong(l2, paramLong2);
      }
      if (paramLong2 < this.iCutover)
        return this.iJulianField.getDifferenceAsLong(paramLong1, paramLong2);
      long l1 = julianToGregorian(paramLong1);
      return this.iGregorianField.getDifferenceAsLong(l1, paramLong2);
    }

    public int getMaximumValue(long paramLong)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.getMaximumValue(paramLong);
      return this.iJulianField.getMaximumValue(paramLong);
    }

    public int getMinimumValue(long paramLong)
    {
      if (paramLong >= this.iCutover)
        return this.iGregorianField.getMinimumValue(paramLong);
      return this.iJulianField.getMinimumValue(paramLong);
    }
  }

  private static class LinkedDurationField extends DecoratedDurationField
  {
    private static final long serialVersionUID = 4097975388007713084L;
    private final GJChronology.ImpreciseCutoverField iField;

    LinkedDurationField(DurationField paramDurationField, GJChronology.ImpreciseCutoverField paramImpreciseCutoverField)
    {
      super(paramDurationField.getType());
      this.iField = paramImpreciseCutoverField;
    }

    public long add(long paramLong, int paramInt)
    {
      return this.iField.add(paramLong, paramInt);
    }

    public long add(long paramLong1, long paramLong2)
    {
      return this.iField.add(paramLong1, paramLong2);
    }

    public int getDifference(long paramLong1, long paramLong2)
    {
      return this.iField.getDifference(paramLong1, paramLong2);
    }

    public long getDifferenceAsLong(long paramLong1, long paramLong2)
    {
      return this.iField.getDifferenceAsLong(paramLong1, paramLong2);
    }
  }
}