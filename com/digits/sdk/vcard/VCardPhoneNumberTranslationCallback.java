package com.digits.sdk.vcard;

public abstract interface VCardPhoneNumberTranslationCallback
{
  public abstract String onValueReceived(String paramString1, int paramInt, String paramString2, boolean paramBoolean);
}