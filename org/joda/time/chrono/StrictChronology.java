package org.joda.time.chrono;

import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.field.StrictDateTimeField;

public final class StrictChronology extends AssembledChronology
{
  private static final long serialVersionUID = 6633006628097111960L;
  private transient Chronology iWithUTC;

  private StrictChronology(Chronology paramChronology)
  {
    super(paramChronology, null);
  }

  private static final DateTimeField convertField(DateTimeField paramDateTimeField)
  {
    return StrictDateTimeField.getInstance(paramDateTimeField);
  }

  public static StrictChronology getInstance(Chronology paramChronology)
  {
    if (paramChronology == null)
      throw new IllegalArgumentException("Must supply a chronology");
    return new StrictChronology(paramChronology);
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
    if (!(paramObject instanceof StrictChronology))
      return false;
    StrictChronology localStrictChronology = (StrictChronology)paramObject;
    return getBase().equals(localStrictChronology.getBase());
  }

  public int hashCode()
  {
    return 352831696 + 7 * getBase().hashCode();
  }

  public String toString()
  {
    return "StrictChronology[" + getBase().toString() + ']';
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