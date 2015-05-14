package org.joda.time.format;

class DateTimeParserInternalParser
  implements InternalParser
{
  private final DateTimeParser underlying;

  private DateTimeParserInternalParser(DateTimeParser paramDateTimeParser)
  {
    this.underlying = paramDateTimeParser;
  }

  static InternalParser of(DateTimeParser paramDateTimeParser)
  {
    if ((paramDateTimeParser instanceof InternalParserDateTimeParser))
      return (InternalParser)paramDateTimeParser;
    if (paramDateTimeParser == null)
      return null;
    return new DateTimeParserInternalParser(paramDateTimeParser);
  }

  public int estimateParsedLength()
  {
    return this.underlying.estimateParsedLength();
  }

  DateTimeParser getUnderlying()
  {
    return this.underlying;
  }

  public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
  {
    return this.underlying.parseInto(paramDateTimeParserBucket, paramCharSequence.toString(), paramInt);
  }
}