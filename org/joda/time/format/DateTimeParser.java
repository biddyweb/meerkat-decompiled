package org.joda.time.format;

public abstract interface DateTimeParser
{
  public abstract int estimateParsedLength();

  public abstract int parseInto(DateTimeParserBucket paramDateTimeParserBucket, String paramString, int paramInt);
}