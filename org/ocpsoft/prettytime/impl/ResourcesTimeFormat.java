package org.ocpsoft.prettytime.impl;

import java.util.Locale;
import java.util.ResourceBundle;
import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.LocaleAware;
import org.ocpsoft.prettytime.TimeFormat;
import org.ocpsoft.prettytime.format.SimpleTimeFormat;

public class ResourcesTimeFormat extends SimpleTimeFormat
  implements TimeFormat, LocaleAware<ResourcesTimeFormat>
{
  private ResourceBundle bundle;
  private TimeFormat override;
  private final ResourcesTimeUnit unit;

  public ResourcesTimeFormat(ResourcesTimeUnit paramResourcesTimeUnit)
  {
    this.unit = paramResourcesTimeUnit;
  }

  public String decorate(Duration paramDuration, String paramString)
  {
    if (this.override == null)
      return super.decorate(paramDuration, paramString);
    return this.override.decorate(paramDuration, paramString);
  }

  public String decorateUnrounded(Duration paramDuration, String paramString)
  {
    if (this.override == null)
      return super.decorateUnrounded(paramDuration, paramString);
    return this.override.decorateUnrounded(paramDuration, paramString);
  }

  public String format(Duration paramDuration)
  {
    if (this.override == null)
      return super.format(paramDuration);
    return this.override.format(paramDuration);
  }

  public String formatUnrounded(Duration paramDuration)
  {
    if (this.override == null)
      return super.formatUnrounded(paramDuration);
    return this.override.formatUnrounded(paramDuration);
  }

  public ResourcesTimeFormat setLocale(Locale paramLocale)
  {
    this.bundle = ResourceBundle.getBundle(this.unit.getResourceBundleName(), paramLocale);
    if ((this.bundle instanceof TimeFormatProvider))
    {
      TimeFormat localTimeFormat = ((TimeFormatProvider)this.bundle).getFormatFor(this.unit);
      if (localTimeFormat != null)
        this.override = localTimeFormat;
    }
    while (true)
    {
      if (this.override == null)
      {
        setPattern(this.bundle.getString(this.unit.getResourceKeyPrefix() + "Pattern"));
        setFuturePrefix(this.bundle.getString(this.unit.getResourceKeyPrefix() + "FuturePrefix"));
        setFutureSuffix(this.bundle.getString(this.unit.getResourceKeyPrefix() + "FutureSuffix"));
        setPastPrefix(this.bundle.getString(this.unit.getResourceKeyPrefix() + "PastPrefix"));
        setPastSuffix(this.bundle.getString(this.unit.getResourceKeyPrefix() + "PastSuffix"));
        setSingularName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "SingularName"));
        setPluralName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "PluralName"));
      }
      try
      {
        setFuturePluralName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "FuturePluralName"));
        try
        {
          label357: setFutureSingularName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "FutureSingularName"));
          try
          {
            label394: setPastPluralName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "PastPluralName"));
            try
            {
              label431: setPastSingularName(this.bundle.getString(this.unit.getResourceKeyPrefix() + "PastSingularName"));
              return this;
              this.override = null;
            }
            catch (Exception localException4)
            {
              return this;
            }
          }
          catch (Exception localException3)
          {
            break label431;
          }
        }
        catch (Exception localException2)
        {
          break label394;
        }
      }
      catch (Exception localException1)
      {
        break label357;
      }
    }
  }
}