package com.google.i18n.phonenumbers.internal;

import com.google.i18n.phonenumbers.Phonemetadata.PhoneNumberDesc;

public abstract interface MatcherApi
{
  public abstract boolean matchesNationalNumber(String paramString, Phonemetadata.PhoneNumberDesc paramPhoneNumberDesc, boolean paramBoolean);

  public abstract boolean matchesPossibleNumber(String paramString, Phonemetadata.PhoneNumberDesc paramPhoneNumberDesc);
}