package org.joda.time.format;

import java.util.Locale;
import org.joda.time.DateTimeField;

class DateTimeParserBucket$SavedField
  implements Comparable<SavedField>
{
  DateTimeField iField;
  Locale iLocale;
  String iText;
  int iValue;

  public int compareTo(SavedField paramSavedField)
  {
    DateTimeField localDateTimeField = paramSavedField.iField;
    int i = DateTimeParserBucket.compareReverse(this.iField.getRangeDurationField(), localDateTimeField.getRangeDurationField());
    if (i != 0)
      return i;
    return DateTimeParserBucket.compareReverse(this.iField.getDurationField(), localDateTimeField.getDurationField());
  }

  void init(DateTimeField paramDateTimeField, int paramInt)
  {
    this.iField = paramDateTimeField;
    this.iValue = paramInt;
    this.iText = null;
    this.iLocale = null;
  }

  void init(DateTimeField paramDateTimeField, String paramString, Locale paramLocale)
  {
    this.iField = paramDateTimeField;
    this.iValue = 0;
    this.iText = paramString;
    this.iLocale = paramLocale;
  }

  long set(long paramLong, boolean paramBoolean)
  {
    if (this.iText == null);
    for (long l = this.iField.set(paramLong, this.iValue); ; l = this.iField.set(paramLong, this.iText, this.iLocale))
    {
      if (paramBoolean)
        l = this.iField.roundFloor(l);
      return l;
    }
  }
}