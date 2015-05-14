package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadablePartial;

class InternalPrinterDateTimePrinter
  implements DateTimePrinter, InternalPrinter
{
  private final InternalPrinter underlying;

  private InternalPrinterDateTimePrinter(InternalPrinter paramInternalPrinter)
  {
    this.underlying = paramInternalPrinter;
  }

  static DateTimePrinter of(InternalPrinter paramInternalPrinter)
  {
    if ((paramInternalPrinter instanceof DateTimePrinterInternalPrinter))
      return ((DateTimePrinterInternalPrinter)paramInternalPrinter).getUnderlying();
    if ((paramInternalPrinter instanceof InternalPrinter))
      return (InternalPrinter)paramInternalPrinter;
    if (paramInternalPrinter == null)
      return null;
    return new InternalPrinterDateTimePrinter(paramInternalPrinter);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this)
      return true;
    if ((paramObject instanceof InternalPrinterDateTimePrinter))
    {
      InternalPrinterDateTimePrinter localInternalPrinterDateTimePrinter = (InternalPrinterDateTimePrinter)paramObject;
      return this.underlying.equals(localInternalPrinterDateTimePrinter.underlying);
    }
    return false;
  }

  public int estimatePrintedLength()
  {
    return this.underlying.estimatePrintedLength();
  }

  public void printTo(Writer paramWriter, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
    throws IOException
  {
    this.underlying.printTo(paramWriter, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
  }

  public void printTo(Writer paramWriter, ReadablePartial paramReadablePartial, Locale paramLocale)
    throws IOException
  {
    this.underlying.printTo(paramWriter, paramReadablePartial, paramLocale);
  }

  public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
    throws IOException
  {
    this.underlying.printTo(paramAppendable, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
  }

  public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
    throws IOException
  {
    this.underlying.printTo(paramAppendable, paramReadablePartial, paramLocale);
  }

  public void printTo(StringBuffer paramStringBuffer, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
  {
    try
    {
      this.underlying.printTo(paramStringBuffer, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public void printTo(StringBuffer paramStringBuffer, ReadablePartial paramReadablePartial, Locale paramLocale)
  {
    try
    {
      this.underlying.printTo(paramStringBuffer, paramReadablePartial, paramLocale);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }
}