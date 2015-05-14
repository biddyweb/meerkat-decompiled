package org.joda.time.format;

abstract interface InternalParser
{
  public abstract int estimateParsedLength();

  public abstract int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt);
}