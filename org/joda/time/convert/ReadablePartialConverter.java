package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadablePartial;

class ReadablePartialConverter extends AbstractConverter
  implements PartialConverter
{
  static final ReadablePartialConverter INSTANCE = new ReadablePartialConverter();

  public Chronology getChronology(Object paramObject, Chronology paramChronology)
  {
    if (paramChronology == null)
      paramChronology = DateTimeUtils.getChronology(((ReadablePartial)paramObject).getChronology());
    return paramChronology;
  }

  public Chronology getChronology(Object paramObject, DateTimeZone paramDateTimeZone)
  {
    return getChronology(paramObject, (Chronology)null).withZone(paramDateTimeZone);
  }

  public int[] getPartialValues(ReadablePartial paramReadablePartial, Object paramObject, Chronology paramChronology)
  {
    ReadablePartial localReadablePartial = (ReadablePartial)paramObject;
    int i = paramReadablePartial.size();
    int[] arrayOfInt = new int[i];
    for (int j = 0; j < i; j++)
      arrayOfInt[j] = localReadablePartial.get(paramReadablePartial.getFieldType(j));
    paramChronology.validate(paramReadablePartial, arrayOfInt);
    return arrayOfInt;
  }

  public Class<?> getSupportedType()
  {
    return ReadablePartial.class;
  }
}