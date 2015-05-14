package org.ocpsoft.prettytime;

import java.util.Locale;

public abstract interface LocaleAware<TYPE>
{
  public abstract TYPE setLocale(Locale paramLocale);
}