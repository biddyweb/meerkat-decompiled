package org.joda.time.chrono;

import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.field.LenientDateTimeField;

public final class LenientChronology extends AssembledChronology
{
  private static final long serialVersionUID = -3148237568046877177L;
  private transient Chronology iWithUTC;

  private LenientChronology(Chronology paramChronology)
  {
    super(paramChronology, null);
  }

  private final DateTimeField convertField(DateTimeField paramDateTimeField)
  {
    return LenientDateTimeField.getInstance(paramDateTimeField, getBase());
  }

  public static LenientChronology getInstance(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new IllegalArgumentException("Must supply a chronology");
    return new LenientChronology(paramChronology);
  }

  protected void assemble(AssembledChronology.Fields paramFields)
  {
    paramFields.year = convertField(paramFields.year);
    paramFields.yearOfEra = convertField(paramFields.yearOfEra);
    paramFields.yearOfCentury = convertField(paramFields.yearOfCentury);
    paramFields.centuryOfEra = convertField(paramFields.centuryOfEra);
    paramFields.era = convertField(paramFields.era);
    paramFields.dayOfWeek = convertField(paramFields.dayOfWeek);
    paramFields.dayOfMonth = convertField(paramFields.dayOfMonth);
    paramFields.dayOfYear = convertField(paramFields.dayOfYear);
    paramFields.monthOfYear = convertField(paramFields.monthOfYear);
    paramFields.weekOfWeekyear = convertField(paramFields.weekOfWeekyear);
    paramFields.weekyear = convertField(paramFields.weekyear);
    paramFields.weekyearOfCentury = convertField(paramFields.weekyearOfCentury);
    paramFields.millisOfSecond = convertField(paramFields.millisOfSecond);
    paramFields.millisOfDay = convertField(paramFields.millisOfDay);
    paramFields.secondOfMinute = convertField(paramFields.secondOfMinute);
    paramFields.secondOfDay = convertField(paramFields.secondOfDay);
    paramFields.minuteOfHour = convertField(paramFields.minuteOfHour);
    paramFields.minuteOfDay = convertField(paramFields.minuteOfDay);
    paramFields.hourOfDay = convertField(paramFields.hourOfDay);
    paramFields.hourOfHalfday = convertField(paramFields.hourOfHalfday);
    paramFields.clockhourOfDay = convertField(paramFields.clockhourOfDay);
    paramFields.clockhourOfHalfday = convertField(paramFields.clockhourOfHalfday);
    paramFields.halfdayOfDay = convertField(paramFields.halfdayOfDay);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof LenientChronology))
      return false;
    LenientChronology localLenientChronology = (LenientChronology)paramObject;
    return getBase().equals(localLenientChronology.getBase());
  }

  public int hashCode()
  {
    return 236548278 + 7 * getBase().hashCode();
  }

  public String toString()
  {
    return "LenientChronology[" + getBase().toString() + ']';
  }

  public Chronology withUTC()
  {
    if (this.iWithUTC == null)
      if (getZone() != DateTimeZone.UTC)
        break label27;
    label27: for (this.iWithUTC = this; ; this.iWithUTC = getInstance(getBase().withUTC()))
      return this.iWithUTC;
  }

  public Chronology withZone(DateTimeZone paramDateTimeZone)
  {
    if (paramDateTimeZone == null)
      paramDateTimeZone = DateTimeZone.getDefault();
    if (paramDateTimeZone == DateTimeZone.UTC)
      this = withUTC();
    while (paramDateTimeZone == getZone())
      return this;
    return getInstance(getBase().withZone(paramDateTimeZone));
  }
}