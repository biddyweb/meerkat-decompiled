package org.joda.time.format;

import org.joda.time.DateTimeZone;

class DateTimeParserBucket$SavedState
{
  final Integer iOffset;
  final DateTimeParserBucket.SavedField[] iSavedFields;
  final int iSavedFieldsCount;
  final DateTimeZone iZone;

  DateTimeParserBucket$SavedState(DateTimeParserBucket paramDateTimeParserBucket)
  {
    this.iZone = DateTimeParserBucket.access$000(paramDateTimeParserBucket);
    this.iOffset = DateTimeParserBucket.access$100(paramDateTimeParserBucket);
    this.iSavedFields = DateTimeParserBucket.access$200(paramDateTimeParserBucket);
    this.iSavedFieldsCount = DateTimeParserBucket.access$300(paramDateTimeParserBucket);
  }

  boolean restoreState(DateTimeParserBucket paramDateTimeParserBucket)
  {
    if (paramDateTimeParserBucket != this.this$0)
      return false;
    DateTimeParserBucket.access$002(paramDateTimeParserBucket, this.iZone);
    DateTimeParserBucket.access$102(paramDateTimeParserBucket, this.iOffset);
    DateTimeParserBucket.access$202(paramDateTimeParserBucket, this.iSavedFields);
    if (this.iSavedFieldsCount < DateTimeParserBucket.access$300(paramDateTimeParserBucket))
      DateTimeParserBucket.access$402(paramDateTimeParserBucket, true);
    DateTimeParserBucket.access$302(paramDateTimeParserBucket, this.iSavedFieldsCount);
    return true;
  }
}