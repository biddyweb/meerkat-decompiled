package org.ocpsoft.prettytime.format;

import org.ocpsoft.prettytime.Duration;
import org.ocpsoft.prettytime.TimeFormat;

public class SimpleTimeFormat
  implements TimeFormat
{
  private static final String NEGATIVE = "-";
  public static final String QUANTITY = "%n";
  public static final String SIGN = "%s";
  public static final String UNIT = "%u";
  private String futurePluralName = "";
  private String futurePrefix = "";
  private String futureSingularName = "";
  private String futureSuffix = "";
  private String pastPluralName = "";
  private String pastPrefix = "";
  private String pastSingularName = "";
  private String pastSuffix = "";
  private String pattern = "";
  private String pluralName = "";
  private int roundingTolerance = 50;
  private String singularName = "";

  private String applyPattern(String paramString1, String paramString2, long paramLong)
  {
    return getPattern(paramLong).replaceAll("%s", paramString1).replaceAll("%n", String.valueOf(paramLong)).replaceAll("%u", paramString2);
  }

  private String format(Duration paramDuration, boolean paramBoolean)
  {
    return applyPattern(getSign(paramDuration), getGramaticallyCorrectName(paramDuration, paramBoolean), getQuantity(paramDuration, paramBoolean));
  }

  private String getPluralName(Duration paramDuration)
  {
    if ((paramDuration.isInFuture()) && (this.futurePluralName != null) && (this.futureSingularName.length() > 0))
      return this.futurePluralName;
    if ((paramDuration.isInPast()) && (this.pastPluralName != null) && (this.pastSingularName.length() > 0))
      return this.pastPluralName;
    return this.pluralName;
  }

  private String getSign(Duration paramDuration)
  {
    if (paramDuration.getQuantity() < 0L)
      return "-";
    return "";
  }

  private String getSingularName(Duration paramDuration)
  {
    if ((paramDuration.isInFuture()) && (this.futureSingularName != null) && (this.futureSingularName.length() > 0))
      return this.futureSingularName;
    if ((paramDuration.isInPast()) && (this.pastSingularName != null) && (this.pastSingularName.length() > 0))
      return this.pastSingularName;
    return this.singularName;
  }

  public String decorate(Duration paramDuration, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (paramDuration.isInPast())
      localStringBuilder.append(this.pastPrefix).append(" ").append(paramString).append(" ").append(this.pastSuffix);
    while (true)
    {
      return localStringBuilder.toString().replaceAll("\\s+", " ").trim();
      localStringBuilder.append(this.futurePrefix).append(" ").append(paramString).append(" ").append(this.futureSuffix);
    }
  }

  public String decorateUnrounded(Duration paramDuration, String paramString)
  {
    return decorate(paramDuration, paramString);
  }

  public String format(Duration paramDuration)
  {
    return format(paramDuration, true);
  }

  public String formatUnrounded(Duration paramDuration)
  {
    return format(paramDuration, false);
  }

  protected String getGramaticallyCorrectName(Duration paramDuration, boolean paramBoolean)
  {
    String str = getSingularName(paramDuration);
    if ((Math.abs(getQuantity(paramDuration, paramBoolean)) == 0L) || (Math.abs(getQuantity(paramDuration, paramBoolean)) > 1L))
      str = getPluralName(paramDuration);
    return str;
  }

  public String getPattern()
  {
    return this.pattern;
  }

  protected String getPattern(long paramLong)
  {
    return this.pattern;
  }

  protected long getQuantity(Duration paramDuration, boolean paramBoolean)
  {
    if (paramBoolean);
    for (long l = paramDuration.getQuantityRounded(this.roundingTolerance); ; l = paramDuration.getQuantity())
      return Math.abs(l);
  }

  public SimpleTimeFormat setFuturePluralName(String paramString)
  {
    this.futurePluralName = paramString;
    return this;
  }

  public SimpleTimeFormat setFuturePrefix(String paramString)
  {
    this.futurePrefix = paramString.trim();
    return this;
  }

  public SimpleTimeFormat setFutureSingularName(String paramString)
  {
    this.futureSingularName = paramString;
    return this;
  }

  public SimpleTimeFormat setFutureSuffix(String paramString)
  {
    this.futureSuffix = paramString.trim();
    return this;
  }

  public SimpleTimeFormat setPastPluralName(String paramString)
  {
    this.pastPluralName = paramString;
    return this;
  }

  public SimpleTimeFormat setPastPrefix(String paramString)
  {
    this.pastPrefix = paramString.trim();
    return this;
  }

  public SimpleTimeFormat setPastSingularName(String paramString)
  {
    this.pastSingularName = paramString;
    return this;
  }

  public SimpleTimeFormat setPastSuffix(String paramString)
  {
    this.pastSuffix = paramString.trim();
    return this;
  }

  public SimpleTimeFormat setPattern(String paramString)
  {
    this.pattern = paramString;
    return this;
  }

  public SimpleTimeFormat setPluralName(String paramString)
  {
    this.pluralName = paramString;
    return this;
  }

  public SimpleTimeFormat setRoundingTolerance(int paramInt)
  {
    this.roundingTolerance = paramInt;
    return this;
  }

  public SimpleTimeFormat setSingularName(String paramString)
  {
    this.singularName = paramString;
    return this;
  }

  public String toString()
  {
    return "SimpleTimeFormat [pattern=" + this.pattern + ", futurePrefix=" + this.futurePrefix + ", futureSuffix=" + this.futureSuffix + ", pastPrefix=" + this.pastPrefix + ", pastSuffix=" + this.pastSuffix + ", roundingTolerance=" + this.roundingTolerance + "]";
  }
}