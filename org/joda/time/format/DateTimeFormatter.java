package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;
import org.joda.time.MutableDateTime;
import org.joda.time.ReadWritableInstant;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadablePartial;

public class DateTimeFormatter
{
  private final Chronology iChrono;
  private final int iDefaultYear;
  private final Locale iLocale;
  private final boolean iOffsetParsed;
  private final InternalParser iParser;
  private final Integer iPivotYear;
  private final InternalPrinter iPrinter;
  private final DateTimeZone iZone;

  public DateTimeFormatter(DateTimePrinter paramDateTimePrinter, DateTimeParser paramDateTimeParser)
  {
    this(DateTimePrinterInternalPrinter.of(paramDateTimePrinter), DateTimeParserInternalParser.of(paramDateTimeParser));
  }

  DateTimeFormatter(InternalPrinter paramInternalPrinter, InternalParser paramInternalParser)
  {
    this.iPrinter = paramInternalPrinter;
    this.iParser = paramInternalParser;
    this.iLocale = null;
    this.iOffsetParsed = false;
    this.iChrono = null;
    this.iZone = null;
    this.iPivotYear = null;
    this.iDefaultYear = 2000;
  }

  private DateTimeFormatter(InternalPrinter paramInternalPrinter, InternalParser paramInternalParser, Locale paramLocale, boolean paramBoolean, Chronology paramChronology, DateTimeZone paramDateTimeZone, Integer paramInteger, int paramInt)
  {
    this.iPrinter = paramInternalPrinter;
    this.iParser = paramInternalParser;
    this.iLocale = paramLocale;
    this.iOffsetParsed = paramBoolean;
    this.iChrono = paramChronology;
    this.iZone = paramDateTimeZone;
    this.iPivotYear = paramInteger;
    this.iDefaultYear = paramInt;
  }

  private void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology)
    throws IOException
  {
    InternalPrinter localInternalPrinter = requirePrinter();
    Chronology localChronology = selectChronology(paramChronology);
    DateTimeZone localDateTimeZone = localChronology.getZone();
    int i = localDateTimeZone.getOffset(paramLong);
    long l = paramLong + i;
    if (((paramLong ^ l) < 0L) && ((paramLong ^ i) >= 0L))
    {
      localDateTimeZone = DateTimeZone.UTC;
      i = 0;
      l = paramLong;
    }
    localInternalPrinter.printTo(paramAppendable, l, localChronology.withUTC(), i, localDateTimeZone, this.iLocale);
  }

  private InternalParser requireParser()
  {
    InternalParser localInternalParser = this.iParser;
    if (localInternalParser == null)
      throw new UnsupportedOperationException("Parsing not supported");
    return localInternalParser;
  }

  private InternalPrinter requirePrinter()
  {
    InternalPrinter localInternalPrinter = this.iPrinter;
    if (localInternalPrinter == null)
      throw new UnsupportedOperationException("Printing not supported");
    return localInternalPrinter;
  }

  private Chronology selectChronology(Chronology paramChronology)
  {
    Chronology localChronology = DateTimeUtils.getChronology(paramChronology);
    if (this.iChrono != null)
      localChronology = this.iChrono;
    if (this.iZone != null)
      localChronology = localChronology.withZone(this.iZone);
    return localChronology;
  }

  @Deprecated
  public Chronology getChronolgy()
  {
    return this.iChrono;
  }

  public Chronology getChronology()
  {
    return this.iChrono;
  }

  public int getDefaultYear()
  {
    return this.iDefaultYear;
  }

  public Locale getLocale()
  {
    return this.iLocale;
  }

  public DateTimeParser getParser()
  {
    return InternalParserDateTimeParser.of(this.iParser);
  }

  InternalParser getParser0()
  {
    return this.iParser;
  }

  public Integer getPivotYear()
  {
    return this.iPivotYear;
  }

  public DateTimePrinter getPrinter()
  {
    return InternalPrinterDateTimePrinter.of(this.iPrinter);
  }

  InternalPrinter getPrinter0()
  {
    return this.iPrinter;
  }

  public DateTimeZone getZone()
  {
    return this.iZone;
  }

  public boolean isOffsetParsed()
  {
    return this.iOffsetParsed;
  }

  public boolean isParser()
  {
    return this.iParser != null;
  }

  public boolean isPrinter()
  {
    return this.iPrinter != null;
  }

  public DateTime parseDateTime(String paramString)
  {
    InternalParser localInternalParser = requireParser();
    Chronology localChronology = selectChronology(null);
    DateTimeParserBucket localDateTimeParserBucket = new DateTimeParserBucket(0L, localChronology, this.iLocale, this.iPivotYear, this.iDefaultYear);
    int i = localInternalParser.parseInto(localDateTimeParserBucket, paramString, 0);
    if (i >= 0)
    {
      if (i >= paramString.length())
      {
        long l = localDateTimeParserBucket.computeMillis(true, paramString);
        if ((this.iOffsetParsed) && (localDateTimeParserBucket.getOffsetInteger() != null))
          localChronology = localChronology.withZone(DateTimeZone.forOffsetMillis(localDateTimeParserBucket.getOffsetInteger().intValue()));
        while (true)
        {
          DateTime localDateTime = new DateTime(l, localChronology);
          if (this.iZone != null)
            localDateTime = localDateTime.withZone(this.iZone);
          return localDateTime;
          if (localDateTimeParserBucket.getZone() != null)
            localChronology = localChronology.withZone(localDateTimeParserBucket.getZone());
        }
      }
    }
    else
      i ^= -1;
    throw new IllegalArgumentException(FormatUtils.createErrorMessage(paramString, i));
  }

  public int parseInto(ReadWritableInstant paramReadWritableInstant, String paramString, int paramInt)
  {
    InternalParser localInternalParser = requireParser();
    if (paramReadWritableInstant == null)
      throw new IllegalArgumentException("Instant must not be null");
    long l1 = paramReadWritableInstant.getMillis();
    Chronology localChronology1 = paramReadWritableInstant.getChronology();
    int i = DateTimeUtils.getChronology(localChronology1).year().get(l1);
    long l2 = l1 + localChronology1.getZone().getOffset(l1);
    Chronology localChronology2 = selectChronology(localChronology1);
    DateTimeParserBucket localDateTimeParserBucket = new DateTimeParserBucket(l2, localChronology2, this.iLocale, this.iPivotYear, i);
    int j = localInternalParser.parseInto(localDateTimeParserBucket, paramString, paramInt);
    paramReadWritableInstant.setMillis(localDateTimeParserBucket.computeMillis(false, paramString));
    if ((this.iOffsetParsed) && (localDateTimeParserBucket.getOffsetInteger() != null))
      localChronology2 = localChronology2.withZone(DateTimeZone.forOffsetMillis(localDateTimeParserBucket.getOffsetInteger().intValue()));
    while (true)
    {
      paramReadWritableInstant.setChronology(localChronology2);
      if (this.iZone != null)
        paramReadWritableInstant.setZone(this.iZone);
      return j;
      if (localDateTimeParserBucket.getZone() != null)
        localChronology2 = localChronology2.withZone(localDateTimeParserBucket.getZone());
    }
  }

  public LocalDate parseLocalDate(String paramString)
  {
    return parseLocalDateTime(paramString).toLocalDate();
  }

  public LocalDateTime parseLocalDateTime(String paramString)
  {
    InternalParser localInternalParser = requireParser();
    Chronology localChronology = selectChronology(null).withUTC();
    DateTimeParserBucket localDateTimeParserBucket = new DateTimeParserBucket(0L, localChronology, this.iLocale, this.iPivotYear, this.iDefaultYear);
    int i = localInternalParser.parseInto(localDateTimeParserBucket, paramString, 0);
    if (i >= 0)
    {
      if (i >= paramString.length())
      {
        long l = localDateTimeParserBucket.computeMillis(true, paramString);
        if (localDateTimeParserBucket.getOffsetInteger() != null)
          localChronology = localChronology.withZone(DateTimeZone.forOffsetMillis(localDateTimeParserBucket.getOffsetInteger().intValue()));
        while (true)
        {
          return new LocalDateTime(l, localChronology);
          if (localDateTimeParserBucket.getZone() != null)
            localChronology = localChronology.withZone(localDateTimeParserBucket.getZone());
        }
      }
    }
    else
      i ^= -1;
    throw new IllegalArgumentException(FormatUtils.createErrorMessage(paramString, i));
  }

  public LocalTime parseLocalTime(String paramString)
  {
    return parseLocalDateTime(paramString).toLocalTime();
  }

  public long parseMillis(String paramString)
  {
    InternalParser localInternalParser = requireParser();
    return new DateTimeParserBucket(0L, selectChronology(this.iChrono), this.iLocale, this.iPivotYear, this.iDefaultYear).doParseMillis(localInternalParser, paramString);
  }

  public MutableDateTime parseMutableDateTime(String paramString)
  {
    InternalParser localInternalParser = requireParser();
    Chronology localChronology = selectChronology(null);
    DateTimeParserBucket localDateTimeParserBucket = new DateTimeParserBucket(0L, localChronology, this.iLocale, this.iPivotYear, this.iDefaultYear);
    int i = localInternalParser.parseInto(localDateTimeParserBucket, paramString, 0);
    if (i >= 0)
    {
      if (i >= paramString.length())
      {
        long l = localDateTimeParserBucket.computeMillis(true, paramString);
        if ((this.iOffsetParsed) && (localDateTimeParserBucket.getOffsetInteger() != null))
          localChronology = localChronology.withZone(DateTimeZone.forOffsetMillis(localDateTimeParserBucket.getOffsetInteger().intValue()));
        while (true)
        {
          MutableDateTime localMutableDateTime = new MutableDateTime(l, localChronology);
          if (this.iZone != null)
            localMutableDateTime.setZone(this.iZone);
          return localMutableDateTime;
          if (localDateTimeParserBucket.getZone() != null)
            localChronology = localChronology.withZone(localDateTimeParserBucket.getZone());
        }
      }
    }
    else
      i ^= -1;
    throw new IllegalArgumentException(FormatUtils.createErrorMessage(paramString, i));
  }

  public String print(long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder(requirePrinter().estimatePrintedLength());
    try
    {
      printTo(localStringBuilder, paramLong);
      label23: return localStringBuilder.toString();
    }
    catch (IOException localIOException)
    {
      break label23;
    }
  }

  public String print(ReadableInstant paramReadableInstant)
  {
    StringBuilder localStringBuilder = new StringBuilder(requirePrinter().estimatePrintedLength());
    try
    {
      printTo(localStringBuilder, paramReadableInstant);
      label23: return localStringBuilder.toString();
    }
    catch (IOException localIOException)
    {
      break label23;
    }
  }

  public String print(ReadablePartial paramReadablePartial)
  {
    StringBuilder localStringBuilder = new StringBuilder(requirePrinter().estimatePrintedLength());
    try
    {
      printTo(localStringBuilder, paramReadablePartial);
      label23: return localStringBuilder.toString();
    }
    catch (IOException localIOException)
    {
      break label23;
    }
  }

  public void printTo(Writer paramWriter, long paramLong)
    throws IOException
  {
    printTo(paramWriter, paramLong);
  }

  public void printTo(Writer paramWriter, ReadableInstant paramReadableInstant)
    throws IOException
  {
    printTo(paramWriter, paramReadableInstant);
  }

  public void printTo(Writer paramWriter, ReadablePartial paramReadablePartial)
    throws IOException
  {
    printTo(paramWriter, paramReadablePartial);
  }

  public void printTo(Appendable paramAppendable, long paramLong)
    throws IOException
  {
    printTo(paramAppendable, paramLong, null);
  }

  public void printTo(Appendable paramAppendable, ReadableInstant paramReadableInstant)
    throws IOException
  {
    printTo(paramAppendable, DateTimeUtils.getInstantMillis(paramReadableInstant), DateTimeUtils.getInstantChronology(paramReadableInstant));
  }

  public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial)
    throws IOException
  {
    InternalPrinter localInternalPrinter = requirePrinter();
    if (paramReadablePartial == null)
      throw new IllegalArgumentException("The partial must not be null");
    localInternalPrinter.printTo(paramAppendable, paramReadablePartial, this.iLocale);
  }

  public void printTo(StringBuffer paramStringBuffer, long paramLong)
  {
    try
    {
      printTo(paramStringBuffer, paramLong);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public void printTo(StringBuffer paramStringBuffer, ReadableInstant paramReadableInstant)
  {
    try
    {
      printTo(paramStringBuffer, paramReadableInstant);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public void printTo(StringBuffer paramStringBuffer, ReadablePartial paramReadablePartial)
  {
    try
    {
      printTo(paramStringBuffer, paramReadablePartial);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public DateTimeFormatter withChronology(Chronology paramChronology)
  {
    if (this.iChrono == paramChronology)
      return this;
    return new DateTimeFormatter(this.iPrinter, this.iParser, this.iLocale, this.iOffsetParsed, paramChronology, this.iZone, this.iPivotYear, this.iDefaultYear);
  }

  public DateTimeFormatter withDefaultYear(int paramInt)
  {
    return new DateTimeFormatter(this.iPrinter, this.iParser, this.iLocale, this.iOffsetParsed, this.iChrono, this.iZone, this.iPivotYear, paramInt);
  }

  public DateTimeFormatter withLocale(Locale paramLocale)
  {
    if ((paramLocale == getLocale()) || ((paramLocale != null) && (paramLocale.equals(getLocale()))))
      return this;
    return new DateTimeFormatter(this.iPrinter, this.iParser, paramLocale, this.iOffsetParsed, this.iChrono, this.iZone, this.iPivotYear, this.iDefaultYear);
  }

  public DateTimeFormatter withOffsetParsed()
  {
    if (this.iOffsetParsed == true)
      return this;
    return new DateTimeFormatter(this.iPrinter, this.iParser, this.iLocale, true, this.iChrono, null, this.iPivotYear, this.iDefaultYear);
  }

  public DateTimeFormatter withPivotYear(int paramInt)
  {
    return withPivotYear(Integer.valueOf(paramInt));
  }

  public DateTimeFormatter withPivotYear(Integer paramInteger)
  {
    if ((this.iPivotYear == paramInteger) || ((this.iPivotYear != null) && (this.iPivotYear.equals(paramInteger))))
      return this;
    return new DateTimeFormatter(this.iPrinter, this.iParser, this.iLocale, this.iOffsetParsed, this.iChrono, this.iZone, paramInteger, this.iDefaultYear);
  }

  public DateTimeFormatter withZone(DateTimeZone paramDateTimeZone)
  {
    if (this.iZone == paramDateTimeZone)
      return this;
    return new DateTimeFormatter(this.iPrinter, this.iParser, this.iLocale, false, this.iChrono, paramDateTimeZone, this.iPivotYear, this.iDefaultYear);
  }

  public DateTimeFormatter withZoneUTC()
  {
    return withZone(DateTimeZone.UTC);
  }
}