package com.sithagi.countrycodepicker;

public class Country
{
  private String code;
  private String dialCode;
  private String name;

  public String getCode()
  {
    return this.code;
  }

  public String getDialCode()
  {
    return this.dialCode;
  }

  public String getName()
  {
    return this.name;
  }

  public void setCode(String paramString)
  {
    this.code = paramString;
  }

  public void setDialCode(String paramString)
  {
    this.dialCode = paramString;
  }

  public void setName(String paramString)
  {
    this.name = paramString;
  }
}