package org.joda.time;

public class IllegalFieldValueException extends IllegalArgumentException
{
  private static final long serialVersionUID = 6305711765985447737L;
  private final DateTimeFieldType iDateTimeFieldType;
  private final DurationFieldType iDurationFieldType;
  private final String iFieldName;
  private final Number iLowerBound;
  private String iMessage;
  private final Number iNumberValue;
  private final String iStringValue;
  private final Number iUpperBound;

  public IllegalFieldValueException(String paramString, Number paramNumber1, Number paramNumber2, Number paramNumber3)
  {
    super(createMessage(paramString, paramNumber1, paramNumber2, paramNumber3, null));
    this.iDateTimeFieldType = null;
    this.iDurationFieldType = null;
    this.iFieldName = paramString;
    this.iNumberValue = paramNumber1;
    this.iStringValue = null;
    this.iLowerBound = paramNumber2;
    this.iUpperBound = paramNumber3;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(String paramString1, String paramString2)
  {
    super(createMessage(paramString1, paramString2));
    this.iDateTimeFieldType = null;
    this.iDurationFieldType = null;
    this.iFieldName = paramString1;
    this.iStringValue = paramString2;
    this.iNumberValue = null;
    this.iLowerBound = null;
    this.iUpperBound = null;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(DateTimeFieldType paramDateTimeFieldType, Number paramNumber1, Number paramNumber2, Number paramNumber3)
  {
    super(createMessage(paramDateTimeFieldType.getName(), paramNumber1, paramNumber2, paramNumber3, null));
    this.iDateTimeFieldType = paramDateTimeFieldType;
    this.iDurationFieldType = null;
    this.iFieldName = paramDateTimeFieldType.getName();
    this.iNumberValue = paramNumber1;
    this.iStringValue = null;
    this.iLowerBound = paramNumber2;
    this.iUpperBound = paramNumber3;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(DateTimeFieldType paramDateTimeFieldType, Number paramNumber, String paramString)
  {
    super(createMessage(paramDateTimeFieldType.getName(), paramNumber, null, null, paramString));
    this.iDateTimeFieldType = paramDateTimeFieldType;
    this.iDurationFieldType = null;
    this.iFieldName = paramDateTimeFieldType.getName();
    this.iNumberValue = paramNumber;
    this.iStringValue = null;
    this.iLowerBound = null;
    this.iUpperBound = null;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(DateTimeFieldType paramDateTimeFieldType, String paramString)
  {
    super(createMessage(paramDateTimeFieldType.getName(), paramString));
    this.iDateTimeFieldType = paramDateTimeFieldType;
    this.iDurationFieldType = null;
    this.iFieldName = paramDateTimeFieldType.getName();
    this.iStringValue = paramString;
    this.iNumberValue = null;
    this.iLowerBound = null;
    this.iUpperBound = null;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(DurationFieldType paramDurationFieldType, Number paramNumber1, Number paramNumber2, Number paramNumber3)
  {
    super(createMessage(paramDurationFieldType.getName(), paramNumber1, paramNumber2, paramNumber3, null));
    this.iDateTimeFieldType = null;
    this.iDurationFieldType = paramDurationFieldType;
    this.iFieldName = paramDurationFieldType.getName();
    this.iNumberValue = paramNumber1;
    this.iStringValue = null;
    this.iLowerBound = paramNumber2;
    this.iUpperBound = paramNumber3;
    this.iMessage = super.getMessage();
  }

  public IllegalFieldValueException(DurationFieldType paramDurationFieldType, String paramString)
  {
    super(createMessage(paramDurationFieldType.getName(), paramString));
    this.iDateTimeFieldType = null;
    this.iDurationFieldType = paramDurationFieldType;
    this.iFieldName = paramDurationFieldType.getName();
    this.iStringValue = paramString;
    this.iNumberValue = null;
    this.iLowerBound = null;
    this.iUpperBound = null;
    this.iMessage = super.getMessage();
  }

  private static String createMessage(String paramString1, Number paramNumber1, Number paramNumber2, Number paramNumber3, String paramString2)
  {
    StringBuilder localStringBuilder = new StringBuilder().append("Value ").append(paramNumber1).append(" for ").append(paramString1).append(' ');
    if (paramNumber2 == null)
      if (paramNumber3 == null)
        localStringBuilder.append("is not supported");
    while (true)
    {
      if (paramString2 != null)
        localStringBuilder.append(": ").append(paramString2);
      return localStringBuilder.toString();
      localStringBuilder.append("must not be larger than ").append(paramNumber3);
      continue;
      if (paramNumber3 == null)
        localStringBuilder.append("must not be smaller than ").append(paramNumber2);
      else
        localStringBuilder.append("must be in the range [").append(paramNumber2).append(',').append(paramNumber3).append(']');
    }
  }

  private static String createMessage(String paramString1, String paramString2)
  {
    StringBuffer localStringBuffer = new StringBuffer().append("Value ");
    if (paramString2 == null)
      localStringBuffer.append("null");
    while (true)
    {
      localStringBuffer.append(" for ").append(paramString1).append(' ').append("is not supported");
      return localStringBuffer.toString();
      localStringBuffer.append('"');
      localStringBuffer.append(paramString2);
      localStringBuffer.append('"');
    }
  }

  public DateTimeFieldType getDateTimeFieldType()
  {
    return this.iDateTimeFieldType;
  }

  public DurationFieldType getDurationFieldType()
  {
    return this.iDurationFieldType;
  }

  public String getFieldName()
  {
    return this.iFieldName;
  }

  public Number getIllegalNumberValue()
  {
    return this.iNumberValue;
  }

  public String getIllegalStringValue()
  {
    return this.iStringValue;
  }

  public String getIllegalValueAsString()
  {
    String str = this.iStringValue;
    if (str == null)
      str = String.valueOf(this.iNumberValue);
    return str;
  }

  public Number getLowerBound()
  {
    return this.iLowerBound;
  }

  public String getMessage()
  {
    return this.iMessage;
  }

  public Number getUpperBound()
  {
    return this.iUpperBound;
  }

  public void prependMessage(String paramString)
  {
    if (this.iMessage == null)
      this.iMessage = paramString;
    while (paramString == null)
      return;
    this.iMessage = (paramString + ": " + this.iMessage);
  }
}