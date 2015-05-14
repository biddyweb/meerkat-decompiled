package org.joda.time.format;

import java.util.Locale;
import org.joda.time.ReadWritablePeriod;

public abstract interface PeriodParser
{
  public abstract int parseInto(ReadWritablePeriod paramReadWritablePeriod, String paramString, int paramInt, Locale paramLocale);
}