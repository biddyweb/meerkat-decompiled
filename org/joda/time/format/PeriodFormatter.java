package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Locale;
import org.joda.time.MutablePeriod;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePeriod;

public class PeriodFormatter
{
  private final Locale iLocale;
  private final PeriodType iParseType;
  private final PeriodParser iParser;
  private final PeriodPrinter iPrinter;

  public PeriodFormatter(PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser)
  {
    this.iPrinter = paramPeriodPrinter;
    this.iParser = paramPeriodParser;
    this.iLocale = null;
    this.iParseType = null;
  }

  PeriodFormatter(PeriodPrinter paramPeriodPrinter, PeriodParser paramPeriodParser, Locale paramLocale, PeriodType paramPeriodType)
  {
    this.iPrinter = paramPeriodPrinter;
    this.iParser = paramPeriodParser;
    this.iLocale = paramLocale;
    this.iParseType = paramPeriodType;
  }

  private void checkParser()
  {
    if (this.iParser == null)
      throw new UnsupportedOperationException("Parsing not supported");
  }

  private void checkPeriod(ReadablePeriod paramReadablePeriod)
  {
    if (paramReadablePeriod == null)
      throw new IllegalArgumentException("Period must not be null");
  }

  private void checkPrinter()
  {
    if (this.iPrinter == null)
      throw new UnsupportedOperationException("Printing not supported");
  }

  public Locale getLocale()
  {
    return this.iLocale;
  }

  public PeriodType getParseType()
  {
    return this.iParseType;
  }

  public PeriodParser getParser()
  {
    return this.iParser;
  }

  public PeriodPrinter getPrinter()
  {
    return this.iPrinter;
  }

  public boolean isParser()
  {
    return this.iParser != null;
  }

  public boolean isPrinter()
  {
    return this.iPrinter != null;
  }

  public int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt)
  {
    checkParser();
    checkPeriod(paramReadWritablePeriod);
    return getParser().parseInto(paramReadWritablePeriod, paramString, paramInt, this.iLocale);
  }

  public MutablePeriod parseMutablePeriod(String paramString)
  {
    checkParser();
    MutablePeriod localMutablePeriod = new MutablePeriod(0L, this.iParseType);
    int i = getParser().parseInto(localMutablePeriod, paramString, 0, this.iLocale);
    if (i >= 0)
    {
      if (i >= paramString.length())
        return localMutablePeriod;
    }
    else
      i ^= -1;
    throw new IllegalArgumentException(FormatUtils.createErrorMessage(paramString, i));
  }

  public Period parsePeriod(String paramString)
  {
    checkParser();
    return parseMutablePeriod(paramString).toPeriod();
  }

  public String print(ReadablePeriod paramReadablePeriod)
  {
    checkPrinter();
    checkPeriod(paramReadablePeriod);
    PeriodPrinter localPeriodPrinter = getPrinter();
    StringBuffer localStringBuffer = new StringBuffer(localPeriodPrinter.calculatePrintedLength(paramReadablePeriod, this.iLocale));
    localPeriodPrinter.printTo(localStringBuffer, paramReadablePeriod, this.iLocale);
    return localStringBuffer.toString();
  }

  public void printTo(Writer paramWriter, ReadablePeriod paramReadablePeriod)
    throws IOException
  {
    checkPrinter();
    checkPeriod(paramReadablePeriod);
    getPrinter().printTo(paramWriter, paramReadablePeriod, this.iLocale);
  }

  public void printTo(StringBuffer paramStringBuffer, ReadablePeriod paramReadablePeriod)
  {
    checkPrinter();
    checkPeriod(paramReadablePeriod);
    getPrinter().printTo(paramStringBuffer, paramReadablePeriod, this.iLocale);
  }

  public PeriodFormatter withLocale(Locale paramLocale)
  {
    if ((paramLocale == getLocale()) || ((paramLocale != null) && (paramLocale.equals(getLocale()))))
      return this;
    return new PeriodFormatter(this.iPrinter, this.iParser, paramLocale, this.iParseType);
  }

  public PeriodFormatter withParseType(PeriodType paramPeriodType)
  {
    if (paramPeriodType == this.iParseType)
      return this;
    return new PeriodFormatter(this.iPrinter, this.iParser, this.iLocale, paramPeriodType);
  }
}