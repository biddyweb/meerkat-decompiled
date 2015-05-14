package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadablePartial;

class DateTimePrinterInternalPrinter
  implements InternalPrinter
{
  private final DateTimePrinter underlying;

  private DateTimePrinterInternalPrinter(DateTimePrinter paramDateTimePrinter)
  {
    this.underlying = paramDateTimePrinter;
  }

  static InternalPrinter of(DateTimePrinter paramDateTimePrinter)
  {
    if ((paramDateTimePrinter instanceof InternalPrinterDateTimePrinter))
      return (InternalPrinter)paramDateTimePrinter;
    if (paramDateTimePrinter == null)
      return null;
    return new DateTimePrinterInternalPrinter(paramDateTimePrinter);
  }

  public int estimatePrintedLength()
  {
    return this.underlying.estimatePrintedLength();
  }

  DateTimePrinter getUnderlying()
  {
    return this.underlying;
  }

  public void printTo(Appendable paramAppendable, long paramLong, Chronology paramChronology, int paramInt, DateTimeZone paramDateTimeZone, Locale paramLocale)
    throws IOException
  {
    if ((paramAppendable instanceof StringBuffer))
    {
      StringBuffer localStringBuffer2 = (StringBuffer)paramAppendable;
      this.underlying.printTo(localStringBuffer2, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
    }
    if ((paramAppendable instanceof Writer))
    {
      Writer localWriter = (Writer)paramAppendable;
      this.underlying.printTo(localWriter, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
    }
    StringBuffer localStringBuffer1 = new StringBuffer(estimatePrintedLength());
    this.underlying.printTo(localStringBuffer1, paramLong, paramChronology, paramInt, paramDateTimeZone, paramLocale);
    paramAppendable.append(localStringBuffer1);
  }

  public void printTo(Appendable paramAppendable, ReadablePartial paramReadablePartial, Locale paramLocale)
    throws IOException
  {
    if ((paramAppendable instanceof StringBuffer))
    {
      StringBuffer localStringBuffer2 = (StringBuffer)paramAppendable;
      this.underlying.printTo(localStringBuffer2, paramReadablePartial, paramLocale);
    }
    if ((paramAppendable instanceof Writer))
    {
      Writer localWriter = (Writer)paramAppendable;
      this.underlying.printTo(localWriter, paramReadablePartial, paramLocale);
    }
    StringBuffer localStringBuffer1 = new StringBuffer(estimatePrintedLength());
    this.underlying.printTo(localStringBuffer1, paramReadablePartial, paramLocale);
    paramAppendable.append(localStringBuffer1);
  }
}