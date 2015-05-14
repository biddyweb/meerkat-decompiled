package org.ocpsoft.prettytime;

public abstract interface TimeFormat
{
  public abstract String decorate(Duration paramDuration, String paramString);

  public abstract String decorateUnrounded(Duration paramDuration, String paramString);

  public abstract String format(Duration paramDuration);

  public abstract String formatUnrounded(Duration paramDuration);
}