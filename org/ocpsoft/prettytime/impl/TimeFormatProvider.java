package org.ocpsoft.prettytime.impl;

import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.TimeUnit;

public abstract interface TimeFormatProvider
{
  public abstract TimeFormat getFormatFor(TimeUnit paramTimeUnit);
}