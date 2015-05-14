package org.joda.time.chrono;

import java.io.IOException;
import java.io.ObjectInputStream;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;

public abstract class AssembledChronology extends BaseChronology
{
  private static final long serialVersionUID = -6728465968995518215L;
  private final Chronology iBase;
  private transient int iBaseFlags;
  private transient DurationField iCenturies;
  private transient DateTimeField iCenturyOfEra;
  private transient DateTimeField iClockhourOfDay;
  private transient DateTimeField iClockhourOfHalfday;
  private transient DateTimeField iDayOfMonth;
  private transient DateTimeField iDayOfWeek;
  private transient DateTimeField iDayOfYear;
  private transient DurationField iDays;
  private transient DateTimeField iEra;
  private transient DurationField iEras;
  private transient DateTimeField iHalfdayOfDay;
  private transient DurationField iHalfdays;
  private transient DateTimeField iHourOfDay;
  private transient DateTimeField iHourOfHalfday;
  private transient DurationField iHours;
  private transient DurationField iMillis;
  private transient DateTimeField iMillisOfDay;
  private transient DateTimeField iMillisOfSecond;
  private transient DateTimeField iMinuteOfDay;
  private transient DateTimeField iMinuteOfHour;
  private transient DurationField iMinutes;
  private transient DateTimeField iMonthOfYear;
  private transient DurationField iMonths;
  private final Object iParam;
  private transient DateTimeField iSecondOfDay;
  private transient DateTimeField iSecondOfMinute;
  private transient DurationField iSeconds;
  private transient DateTimeField iWeekOfWeekyear;
  private transient DurationField iWeeks;
  private transient DateTimeField iWeekyear;
  private transient DateTimeField iWeekyearOfCentury;
  private transient DurationField iWeekyears;
  private transient DateTimeField iYear;
  private transient DateTimeField iYearOfCentury;
  private transient DateTimeField iYearOfEra;
  private transient DurationField iYears;

  protected AssembledChronology(Chronology paramChronology, Object paramObject)
  {
    this.iBase = paramChronology;
    this.iParam = paramObject;
    setFields();
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    setFields();
  }

  private void setFields()
  {
    Fields localFields = new Fields();
    if (this.iBase != null)
      localFields.copyFieldsFrom(this.iBase);
    assemble(localFields);
    DurationField localDurationField1 = localFields.millis;
    DurationField localDurationField2;
    label51: DurationField localDurationField3;
    label67: DurationField localDurationField4;
    label84: DurationField localDurationField5;
    label101: DurationField localDurationField6;
    label118: DurationField localDurationField7;
    label135: DurationField localDurationField8;
    label152: DurationField localDurationField9;
    label169: DurationField localDurationField10;
    label186: DurationField localDurationField11;
    label203: DurationField localDurationField12;
    label220: DateTimeField localDateTimeField1;
    label237: DateTimeField localDateTimeField2;
    label254: DateTimeField localDateTimeField3;
    label271: DateTimeField localDateTimeField4;
    label288: DateTimeField localDateTimeField5;
    label305: DateTimeField localDateTimeField6;
    label322: DateTimeField localDateTimeField7;
    label339: DateTimeField localDateTimeField8;
    label356: DateTimeField localDateTimeField9;
    label373: DateTimeField localDateTimeField10;
    label390: DateTimeField localDateTimeField11;
    label407: DateTimeField localDateTimeField12;
    label424: DateTimeField localDateTimeField13;
    label441: DateTimeField localDateTimeField14;
    label458: DateTimeField localDateTimeField15;
    label475: DateTimeField localDateTimeField16;
    label492: DateTimeField localDateTimeField17;
    label509: DateTimeField localDateTimeField18;
    label526: DateTimeField localDateTimeField19;
    label543: DateTimeField localDateTimeField20;
    label560: DateTimeField localDateTimeField21;
    label577: DateTimeField localDateTimeField22;
    label594: DateTimeField localDateTimeField23;
    if (localDurationField1 != null)
    {
      this.iMillis = localDurationField1;
      localDurationField2 = localFields.seconds;
      if (localDurationField2 == null)
        break label646;
      this.iSeconds = localDurationField2;
      localDurationField3 = localFields.minutes;
      if (localDurationField3 == null)
        break label654;
      this.iMinutes = localDurationField3;
      localDurationField4 = localFields.hours;
      if (localDurationField4 == null)
        break label663;
      this.iHours = localDurationField4;
      localDurationField5 = localFields.halfdays;
      if (localDurationField5 == null)
        break label672;
      this.iHalfdays = localDurationField5;
      localDurationField6 = localFields.days;
      if (localDurationField6 == null)
        break label681;
      this.iDays = localDurationField6;
      localDurationField7 = localFields.weeks;
      if (localDurationField7 == null)
        break label690;
      this.iWeeks = localDurationField7;
      localDurationField8 = localFields.weekyears;
      if (localDurationField8 == null)
        break label699;
      this.iWeekyears = localDurationField8;
      localDurationField9 = localFields.months;
      if (localDurationField9 == null)
        break label708;
      this.iMonths = localDurationField9;
      localDurationField10 = localFields.years;
      if (localDurationField10 == null)
        break label717;
      this.iYears = localDurationField10;
      localDurationField11 = localFields.centuries;
      if (localDurationField11 == null)
        break label726;
      this.iCenturies = localDurationField11;
      localDurationField12 = localFields.eras;
      if (localDurationField12 == null)
        break label735;
      this.iEras = localDurationField12;
      localDateTimeField1 = localFields.millisOfSecond;
      if (localDateTimeField1 == null)
        break label744;
      this.iMillisOfSecond = localDateTimeField1;
      localDateTimeField2 = localFields.millisOfDay;
      if (localDateTimeField2 == null)
        break label753;
      this.iMillisOfDay = localDateTimeField2;
      localDateTimeField3 = localFields.secondOfMinute;
      if (localDateTimeField3 == null)
        break label762;
      this.iSecondOfMinute = localDateTimeField3;
      localDateTimeField4 = localFields.secondOfDay;
      if (localDateTimeField4 == null)
        break label771;
      this.iSecondOfDay = localDateTimeField4;
      localDateTimeField5 = localFields.minuteOfHour;
      if (localDateTimeField5 == null)
        break label780;
      this.iMinuteOfHour = localDateTimeField5;
      localDateTimeField6 = localFields.minuteOfDay;
      if (localDateTimeField6 == null)
        break label789;
      this.iMinuteOfDay = localDateTimeField6;
      localDateTimeField7 = localFields.hourOfDay;
      if (localDateTimeField7 == null)
        break label798;
      this.iHourOfDay = localDateTimeField7;
      localDateTimeField8 = localFields.clockhourOfDay;
      if (localDateTimeField8 == null)
        break label807;
      this.iClockhourOfDay = localDateTimeField8;
      localDateTimeField9 = localFields.hourOfHalfday;
      if (localDateTimeField9 == null)
        break label816;
      this.iHourOfHalfday = localDateTimeField9;
      localDateTimeField10 = localFields.clockhourOfHalfday;
      if (localDateTimeField10 == null)
        break label825;
      this.iClockhourOfHalfday = localDateTimeField10;
      localDateTimeField11 = localFields.halfdayOfDay;
      if (localDateTimeField11 == null)
        break label834;
      this.iHalfdayOfDay = localDateTimeField11;
      localDateTimeField12 = localFields.dayOfWeek;
      if (localDateTimeField12 == null)
        break label843;
      this.iDayOfWeek = localDateTimeField12;
      localDateTimeField13 = localFields.dayOfMonth;
      if (localDateTimeField13 == null)
        break label852;
      this.iDayOfMonth = localDateTimeField13;
      localDateTimeField14 = localFields.dayOfYear;
      if (localDateTimeField14 == null)
        break label861;
      this.iDayOfYear = localDateTimeField14;
      localDateTimeField15 = localFields.weekOfWeekyear;
      if (localDateTimeField15 == null)
        break label870;
      this.iWeekOfWeekyear = localDateTimeField15;
      localDateTimeField16 = localFields.weekyear;
      if (localDateTimeField16 == null)
        break label879;
      this.iWeekyear = localDateTimeField16;
      localDateTimeField17 = localFields.weekyearOfCentury;
      if (localDateTimeField17 == null)
        break label888;
      this.iWeekyearOfCentury = localDateTimeField17;
      localDateTimeField18 = localFields.monthOfYear;
      if (localDateTimeField18 == null)
        break label897;
      this.iMonthOfYear = localDateTimeField18;
      localDateTimeField19 = localFields.year;
      if (localDateTimeField19 == null)
        break label906;
      this.iYear = localDateTimeField19;
      localDateTimeField20 = localFields.yearOfEra;
      if (localDateTimeField20 == null)
        break label915;
      this.iYearOfEra = localDateTimeField20;
      localDateTimeField21 = localFields.yearOfCentury;
      if (localDateTimeField21 == null)
        break label924;
      this.iYearOfCentury = localDateTimeField21;
      localDateTimeField22 = localFields.centuryOfEra;
      if (localDateTimeField22 == null)
        break label933;
      this.iCenturyOfEra = localDateTimeField22;
      localDateTimeField23 = localFields.era;
      if (localDateTimeField23 == null)
        break label942;
    }
    int i;
    while (true)
    {
      this.iEra = localDateTimeField23;
      Chronology localChronology = this.iBase;
      i = 0;
      if (localChronology != null)
        break label951;
      this.iBaseFlags = i;
      return;
      localDurationField1 = super.millis();
      break;
      label646: localDurationField2 = super.seconds();
      break label51;
      label654: localDurationField3 = super.minutes();
      break label67;
      label663: localDurationField4 = super.hours();
      break label84;
      label672: localDurationField5 = super.halfdays();
      break label101;
      label681: localDurationField6 = super.days();
      break label118;
      label690: localDurationField7 = super.weeks();
      break label135;
      label699: localDurationField8 = super.weekyears();
      break label152;
      label708: localDurationField9 = super.months();
      break label169;
      label717: localDurationField10 = super.years();
      break label186;
      label726: localDurationField11 = super.centuries();
      break label203;
      label735: localDurationField12 = super.eras();
      break label220;
      label744: localDateTimeField1 = super.millisOfSecond();
      break label237;
      label753: localDateTimeField2 = super.millisOfDay();
      break label254;
      label762: localDateTimeField3 = super.secondOfMinute();
      break label271;
      label771: localDateTimeField4 = super.secondOfDay();
      break label288;
      label780: localDateTimeField5 = super.minuteOfHour();
      break label305;
      label789: localDateTimeField6 = super.minuteOfDay();
      break label322;
      label798: localDateTimeField7 = super.hourOfDay();
      break label339;
      label807: localDateTimeField8 = super.clockhourOfDay();
      break label356;
      label816: localDateTimeField9 = super.hourOfHalfday();
      break label373;
      label825: localDateTimeField10 = super.clockhourOfHalfday();
      break label390;
      label834: localDateTimeField11 = super.halfdayOfDay();
      break label407;
      label843: localDateTimeField12 = super.dayOfWeek();
      break label424;
      label852: localDateTimeField13 = super.dayOfMonth();
      break label441;
      label861: localDateTimeField14 = super.dayOfYear();
      break label458;
      label870: localDateTimeField15 = super.weekOfWeekyear();
      break label475;
      label879: localDateTimeField16 = super.weekyear();
      break label492;
      label888: localDateTimeField17 = super.weekyearOfCentury();
      break label509;
      label897: localDateTimeField18 = super.monthOfYear();
      break label526;
      label906: localDateTimeField19 = super.year();
      break label543;
      label915: localDateTimeField20 = super.yearOfEra();
      break label560;
      label924: localDateTimeField21 = super.yearOfCentury();
      break label577;
      label933: localDateTimeField22 = super.centuryOfEra();
      break label594;
      label942: localDateTimeField23 = super.era();
    }
    label951: int j;
    if ((this.iHourOfDay == this.iBase.hourOfDay()) && (this.iMinuteOfHour == this.iBase.minuteOfHour()) && (this.iSecondOfMinute == this.iBase.secondOfMinute()) && (this.iMillisOfSecond == this.iBase.millisOfSecond()))
    {
      j = 1;
      label1010: if (this.iMillisOfDay != this.iBase.millisOfDay())
        break label1128;
    }
    label1128: for (int k = 2; ; k = 0)
    {
      int m = j | k;
      DateTimeField localDateTimeField24 = this.iYear;
      DateTimeField localDateTimeField25 = this.iBase.year();
      int n = 0;
      if (localDateTimeField24 == localDateTimeField25)
      {
        DateTimeField localDateTimeField26 = this.iMonthOfYear;
        DateTimeField localDateTimeField27 = this.iBase.monthOfYear();
        n = 0;
        if (localDateTimeField26 == localDateTimeField27)
        {
          DateTimeField localDateTimeField28 = this.iDayOfMonth;
          DateTimeField localDateTimeField29 = this.iBase.dayOfMonth();
          n = 0;
          if (localDateTimeField28 == localDateTimeField29)
            n = 4;
        }
      }
      i = n | m;
      break;
      j = 0;
      break label1010;
    }
  }

  protected abstract void assemble(Fields paramFields);

  public final DurationField centuries()
  {
    return this.iCenturies;
  }

  public final DateTimeField centuryOfEra()
  {
    return this.iCenturyOfEra;
  }

  public final DateTimeField clockhourOfDay()
  {
    return this.iClockhourOfDay;
  }

  public final DateTimeField clockhourOfHalfday()
  {
    return this.iClockhourOfHalfday;
  }

  public final DateTimeField dayOfMonth()
  {
    return this.iDayOfMonth;
  }

  public final DateTimeField dayOfWeek()
  {
    return this.iDayOfWeek;
  }

  public final DateTimeField dayOfYear()
  {
    return this.iDayOfYear;
  }

  public final DurationField days()
  {
    return this.iDays;
  }

  public final DateTimeField era()
  {
    return this.iEra;
  }

  public final DurationField eras()
  {
    return this.iEras;
  }

  protected final Chronology getBase()
  {
    return this.iBase;
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    Chronology localChronology = this.iBase;
    if ((localChronology != null) && ((0x6 & this.iBaseFlags) == 6))
      return localChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4);
    return super.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4);
  }

  public long getDateTimeMillis(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
    throws IllegalArgumentException
  {
    Chronology localChronology = this.iBase;
    if ((localChronology != null) && ((0x5 & this.iBaseFlags) == 5))
      return localChronology.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
    return super.getDateTimeMillis(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7);
  }

  public long getDateTimeMillis(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IllegalArgumentException
  {
    Chronology localChronology = this.iBase;
    if ((localChronology != null) && ((0x1 & this.iBaseFlags) == 1))
      return localChronology.getDateTimeMillis(paramLong, paramInt1, paramInt2, paramInt3, paramInt4);
    return super.getDateTimeMillis(paramLong, paramInt1, paramInt2, paramInt3, paramInt4);
  }

  protected final Object getParam()
  {
    return this.iParam;
  }

  public DateTimeZone getZone()
  {
    Chronology localChronology = this.iBase;
    if (localChronology != null)
      return localChronology.getZone();
    return null;
  }

  public final DateTimeField halfdayOfDay()
  {
    return this.iHalfdayOfDay;
  }

  public final DurationField halfdays()
  {
    return this.iHalfdays;
  }

  public final DateTimeField hourOfDay()
  {
    return this.iHourOfDay;
  }

  public final DateTimeField hourOfHalfday()
  {
    return this.iHourOfHalfday;
  }

  public final DurationField hours()
  {
    return this.iHours;
  }

  public final DurationField millis()
  {
    return this.iMillis;
  }

  public final DateTimeField millisOfDay()
  {
    return this.iMillisOfDay;
  }

  public final DateTimeField millisOfSecond()
  {
    return this.iMillisOfSecond;
  }

  public final DateTimeField minuteOfDay()
  {
    return this.iMinuteOfDay;
  }

  public final DateTimeField minuteOfHour()
  {
    return this.iMinuteOfHour;
  }

  public final DurationField minutes()
  {
    return this.iMinutes;
  }

  public final DateTimeField monthOfYear()
  {
    return this.iMonthOfYear;
  }

  public final DurationField months()
  {
    return this.iMonths;
  }

  public final DateTimeField secondOfDay()
  {
    return this.iSecondOfDay;
  }

  public final DateTimeField secondOfMinute()
  {
    return this.iSecondOfMinute;
  }

  public final DurationField seconds()
  {
    return this.iSeconds;
  }

  public final DateTimeField weekOfWeekyear()
  {
    return this.iWeekOfWeekyear;
  }

  public final DurationField weeks()
  {
    return this.iWeeks;
  }

  public final DateTimeField weekyear()
  {
    return this.iWeekyear;
  }

  public final DateTimeField weekyearOfCentury()
  {
    return this.iWeekyearOfCentury;
  }

  public final DurationField weekyears()
  {
    return this.iWeekyears;
  }

  public final DateTimeField year()
  {
    return this.iYear;
  }

  public final DateTimeField yearOfCentury()
  {
    return this.iYearOfCentury;
  }

  public final DateTimeField yearOfEra()
  {
    return this.iYearOfEra;
  }

  public final DurationField years()
  {
    return this.iYears;
  }

  public static final class Fields
  {
    public DurationField centuries;
    public DateTimeField centuryOfEra;
    public DateTimeField clockhourOfDay;
    public DateTimeField clockhourOfHalfday;
    public DateTimeField dayOfMonth;
    public DateTimeField dayOfWeek;
    public DateTimeField dayOfYear;
    public DurationField days;
    public DateTimeField era;
    public DurationField eras;
    public DateTimeField halfdayOfDay;
    public DurationField halfdays;
    public DateTimeField hourOfDay;
    public DateTimeField hourOfHalfday;
    public DurationField hours;
    public DurationField millis;
    public DateTimeField millisOfDay;
    public DateTimeField millisOfSecond;
    public DateTimeField minuteOfDay;
    public DateTimeField minuteOfHour;
    public DurationField minutes;
    public DateTimeField monthOfYear;
    public DurationField months;
    public DateTimeField secondOfDay;
    public DateTimeField secondOfMinute;
    public DurationField seconds;
    public DateTimeField weekOfWeekyear;
    public DurationField weeks;
    public DateTimeField weekyear;
    public DateTimeField weekyearOfCentury;
    public DurationField weekyears;
    public DateTimeField year;
    public DateTimeField yearOfCentury;
    public DateTimeField yearOfEra;
    public DurationField years;

    private static boolean isSupported(DateTimeField paramDateTimeField)
    {
      if (paramDateTimeField == null)
        return false;
      return paramDateTimeField.isSupported();
    }

    private static boolean isSupported(DurationField paramDurationField)
    {
      if (paramDurationField == null)
        return false;
      return paramDurationField.isSupported();
    }

    public void copyFieldsFrom(Chronology paramChronology)
    {
      DurationField localDurationField1 = paramChronology.millis();
      if (isSupported(localDurationField1))
        this.millis = localDurationField1;
      DurationField localDurationField2 = paramChronology.seconds();
      if (isSupported(localDurationField2))
        this.seconds = localDurationField2;
      DurationField localDurationField3 = paramChronology.minutes();
      if (isSupported(localDurationField3))
        this.minutes = localDurationField3;
      DurationField localDurationField4 = paramChronology.hours();
      if (isSupported(localDurationField4))
        this.hours = localDurationField4;
      DurationField localDurationField5 = paramChronology.halfdays();
      if (isSupported(localDurationField5))
        this.halfdays = localDurationField5;
      DurationField localDurationField6 = paramChronology.days();
      if (isSupported(localDurationField6))
        this.days = localDurationField6;
      DurationField localDurationField7 = paramChronology.weeks();
      if (isSupported(localDurationField7))
        this.weeks = localDurationField7;
      DurationField localDurationField8 = paramChronology.weekyears();
      if (isSupported(localDurationField8))
        this.weekyears = localDurationField8;
      DurationField localDurationField9 = paramChronology.months();
      if (isSupported(localDurationField9))
        this.months = localDurationField9;
      DurationField localDurationField10 = paramChronology.years();
      if (isSupported(localDurationField10))
        this.years = localDurationField10;
      DurationField localDurationField11 = paramChronology.centuries();
      if (isSupported(localDurationField11))
        this.centuries = localDurationField11;
      DurationField localDurationField12 = paramChronology.eras();
      if (isSupported(localDurationField12))
        this.eras = localDurationField12;
      DateTimeField localDateTimeField1 = paramChronology.millisOfSecond();
      if (isSupported(localDateTimeField1))
        this.millisOfSecond = localDateTimeField1;
      DateTimeField localDateTimeField2 = paramChronology.millisOfDay();
      if (isSupported(localDateTimeField2))
        this.millisOfDay = localDateTimeField2;
      DateTimeField localDateTimeField3 = paramChronology.secondOfMinute();
      if (isSupported(localDateTimeField3))
        this.secondOfMinute = localDateTimeField3;
      DateTimeField localDateTimeField4 = paramChronology.secondOfDay();
      if (isSupported(localDateTimeField4))
        this.secondOfDay = localDateTimeField4;
      DateTimeField localDateTimeField5 = paramChronology.minuteOfHour();
      if (isSupported(localDateTimeField5))
        this.minuteOfHour = localDateTimeField5;
      DateTimeField localDateTimeField6 = paramChronology.minuteOfDay();
      if (isSupported(localDateTimeField6))
        this.minuteOfDay = localDateTimeField6;
      DateTimeField localDateTimeField7 = paramChronology.hourOfDay();
      if (isSupported(localDateTimeField7))
        this.hourOfDay = localDateTimeField7;
      DateTimeField localDateTimeField8 = paramChronology.clockhourOfDay();
      if (isSupported(localDateTimeField8))
        this.clockhourOfDay = localDateTimeField8;
      DateTimeField localDateTimeField9 = paramChronology.hourOfHalfday();
      if (isSupported(localDateTimeField9))
        this.hourOfHalfday = localDateTimeField9;
      DateTimeField localDateTimeField10 = paramChronology.clockhourOfHalfday();
      if (isSupported(localDateTimeField10))
        this.clockhourOfHalfday = localDateTimeField10;
      DateTimeField localDateTimeField11 = paramChronology.halfdayOfDay();
      if (isSupported(localDateTimeField11))
        this.halfdayOfDay = localDateTimeField11;
      DateTimeField localDateTimeField12 = paramChronology.dayOfWeek();
      if (isSupported(localDateTimeField12))
        this.dayOfWeek = localDateTimeField12;
      DateTimeField localDateTimeField13 = paramChronology.dayOfMonth();
      if (isSupported(localDateTimeField13))
        this.dayOfMonth = localDateTimeField13;
      DateTimeField localDateTimeField14 = paramChronology.dayOfYear();
      if (isSupported(localDateTimeField14))
        this.dayOfYear = localDateTimeField14;
      DateTimeField localDateTimeField15 = paramChronology.weekOfWeekyear();
      if (isSupported(localDateTimeField15))
        this.weekOfWeekyear = localDateTimeField15;
      DateTimeField localDateTimeField16 = paramChronology.weekyear();
      if (isSupported(localDateTimeField16))
        this.weekyear = localDateTimeField16;
      DateTimeField localDateTimeField17 = paramChronology.weekyearOfCentury();
      if (isSupported(localDateTimeField17))
        this.weekyearOfCentury = localDateTimeField17;
      DateTimeField localDateTimeField18 = paramChronology.monthOfYear();
      if (isSupported(localDateTimeField18))
        this.monthOfYear = localDateTimeField18;
      DateTimeField localDateTimeField19 = paramChronology.year();
      if (isSupported(localDateTimeField19))
        this.year = localDateTimeField19;
      DateTimeField localDateTimeField20 = paramChronology.yearOfEra();
      if (isSupported(localDateTimeField20))
        this.yearOfEra = localDateTimeField20;
      DateTimeField localDateTimeField21 = paramChronology.yearOfCentury();
      if (isSupported(localDateTimeField21))
        this.yearOfCentury = localDateTimeField21;
      DateTimeField localDateTimeField22 = paramChronology.centuryOfEra();
      if (isSupported(localDateTimeField22))
        this.centuryOfEra = localDateTimeField22;
      DateTimeField localDateTimeField23 = paramChronology.era();
      if (isSupported(localDateTimeField23))
        this.era = localDateTimeField23;
    }
  }
}