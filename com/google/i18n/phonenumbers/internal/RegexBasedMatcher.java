package com.google.i18n.phonenumbers.internal;

import com.google.i18n.phonenumbers.Phonemetadata.PhoneNumberDesc;
import com.google.i18n.phonenumbers.RegexCache;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class RegexBasedMatcher
  implements MatcherApi
{
  private final RegexCache regexCache = new RegexCache(100);

  public static MatcherApi create()
  {
    return new RegexBasedMatcher();
  }

  public boolean matchesNationalNumber(String paramString, Phonemetadata.PhoneNumberDesc paramPhoneNumberDesc, boolean paramBoolean)
  {
    Matcher localMatcher = this.regexCache.getPatternForRegex(paramPhoneNumberDesc.getNationalNumberPattern()).matcher(paramString);
    return (localMatcher.matches()) || ((paramBoolean) && (localMatcher.lookingAt()));
  }

  public boolean matchesPossibleNumber(String paramString, Phonemetadata.PhoneNumberDesc paramPhoneNumberDesc)
  {
    return this.regexCache.getPatternForRegex(paramPhoneNumberDesc.getPossibleNumberPattern()).matcher(paramString).matches();
  }
}