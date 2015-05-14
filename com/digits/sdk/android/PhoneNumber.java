package com.digits.sdk.android;

import android.text.TextUtils;

public class PhoneNumber
{
  private static final PhoneNumber EMPTY_PHONE_NUMBER = new PhoneNumber("", "", "");
  private final String countryCode;
  private final String countryIso;
  private final String phoneNumber;

  public PhoneNumber(String paramString1, String paramString2, String paramString3)
  {
    this.phoneNumber = paramString1;
    this.countryIso = paramString2;
    this.countryCode = paramString3;
  }

  public static PhoneNumber emptyPhone()
  {
    return EMPTY_PHONE_NUMBER;
  }

  protected static boolean isValid(PhoneNumber paramPhoneNumber)
  {
    return (paramPhoneNumber != null) && (!paramPhoneNumber.equals(EMPTY_PHONE_NUMBER)) && (!TextUtils.isEmpty(paramPhoneNumber.getPhoneNumber())) && (!TextUtils.isEmpty(paramPhoneNumber.getCountryCode())) && (!TextUtils.isEmpty(paramPhoneNumber.getCountryIso()));
  }

  public String getCountryCode()
  {
    return this.countryCode;
  }

  public String getCountryIso()
  {
    return this.countryIso;
  }

  public String getPhoneNumber()
  {
    return this.phoneNumber;
  }
}