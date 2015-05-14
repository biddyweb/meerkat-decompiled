package org.joda.time.format;

class InternalParserDateTimeParser
  implements DateTimeParser, InternalParser
{
  private final InternalParser underlying;

  private InternalParserDateTimeParser(InternalParser paramInternalParser)
  {
    this.underlying = paramInternalParser;
  }

  static DateTimeParser of(InternalParser paramInternalParser)
  {
    if ((paramInternalParser instanceof DateTimeParserInternalParser))
      return ((DateTimeParserInternalParser)paramInternalParser).getUnderlying();
    if ((paramInternalParser instanceof InternalParser))
      return (InternalParser)paramInternalParser;
    if (paramInternalParser == null)
      return null;
    return new InternalParserDateTimeParser(paramInternalParser);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this)
      return true;
    if ((paramObject instanceof InternalParserDateTimeParser))
    {
      InternalParserDateTimeParser localInternalParserDateTimeParser = (InternalParserDateTimeParser)paramObject;
      return this.underlying.equals(localInternalParserDateTimeParser.underlying);
    }
    return false;
  }

  public int estimateParsedLength()
  {
    return this.underlying.estimateParsedLength();
  }

  public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, CharSequence paramCharSequence, int paramInt)
  {
    return this.underlying.parseInto(paramDateTimeParserBucket, paramCharSequence, paramInt);
  }

  public int parseInto(DateTimeParserBucket paramDateTimeParserBucket, String paramString, int paramInt)
  {
    return this.underlying.parseInto(paramDateTimeParserBucket, paramString, paramInt);
  }
}