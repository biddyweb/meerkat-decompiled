package com.google.i18n.phonenumbers;

import com.google.i18n.phonenumbers.internal.MatcherApi;
import com.google.i18n.phonenumbers.internal.RegexBasedMatcher;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ShortNumberInfo
{
  private static final ShortNumberInfo INSTANCE;
  private static final Set<String> REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT;
  private static final Logger logger = Logger.getLogger(ShortNumberInfo.class.getName());
  private final Map<Integer, List<String>> countryCallingCodeToRegionCodeMap;
  private final MatcherApi matcherApi;

  static
  {
    INSTANCE = new ShortNumberInfo(RegexBasedMatcher.create());
    REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT = new HashSet();
    REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("BR");
    REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("CL");
    REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("NI");
  }

  ShortNumberInfo(MatcherApi paramMatcherApi)
  {
    this.matcherApi = paramMatcherApi;
    this.countryCallingCodeToRegionCodeMap = CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap();
  }

  public static ShortNumberInfo getInstance()
  {
    return INSTANCE;
  }

  private static String getNationalSignificantNumber(Phonenumber.PhoneNumber paramPhoneNumber)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (paramPhoneNumber.isItalianLeadingZero())
    {
      char[] arrayOfChar = new char[paramPhoneNumber.getNumberOfLeadingZeros()];
      Arrays.fill(arrayOfChar, '0');
      localStringBuilder.append(new String(arrayOfChar));
    }
    localStringBuilder.append(paramPhoneNumber.getNationalNumber());
    return localStringBuilder.toString();
  }

  private String getRegionCodeForShortNumberFromRegionList(Phonenumber.PhoneNumber paramPhoneNumber, List<String> paramList)
  {
    if (paramList.size() == 0);
    String str1;
    String str2;
    Phonemetadata.PhoneMetadata localPhoneMetadata;
    do
    {
      Iterator localIterator;
      while (!localIterator.hasNext())
      {
        return null;
        if (paramList.size() == 1)
          return (String)paramList.get(0);
        str1 = getNationalSignificantNumber(paramPhoneNumber);
        localIterator = paramList.iterator();
      }
      str2 = (String)localIterator.next();
      localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(str2);
    }
    while ((localPhoneMetadata == null) || (!matchesPossibleNumberAndNationalNumber(str1, localPhoneMetadata.getShortCode())));
    return str2;
  }

  private List<String> getRegionCodesForCountryCode(int paramInt)
  {
    Object localObject = (List)this.countryCallingCodeToRegionCodeMap.get(Integer.valueOf(paramInt));
    if (localObject == null)
      localObject = new ArrayList(0);
    return Collections.unmodifiableList((List)localObject);
  }

  private boolean matchesEmergencyNumberHelper(String paramString1, String paramString2, boolean paramBoolean)
  {
    String str1 = PhoneNumberUtil.extractPossibleNumber(paramString1);
    if (PhoneNumberUtil.PLUS_CHARS_PATTERN.matcher(str1).lookingAt());
    Phonemetadata.PhoneMetadata localPhoneMetadata;
    do
    {
      return false;
      localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString2);
    }
    while ((localPhoneMetadata == null) || (!localPhoneMetadata.hasEmergency()));
    String str2 = PhoneNumberUtil.normalizeDigitsOnly(str1);
    Phonemetadata.PhoneNumberDesc localPhoneNumberDesc = localPhoneMetadata.getEmergency();
    boolean bool1 = false;
    if (paramBoolean)
    {
      boolean bool2 = REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.contains(paramString2);
      bool1 = false;
      if (!bool2)
        bool1 = true;
    }
    return this.matcherApi.matchesNationalNumber(str2, localPhoneNumberDesc, bool1);
  }

  private boolean matchesPossibleNumberAndNationalNumber(String paramString, Phonemetadata.PhoneNumberDesc paramPhoneNumberDesc)
  {
    boolean bool1 = this.matcherApi.matchesPossibleNumber(paramString, paramPhoneNumberDesc);
    boolean bool2 = false;
    if (bool1)
    {
      boolean bool3 = this.matcherApi.matchesNationalNumber(paramString, paramPhoneNumberDesc, false);
      bool2 = false;
      if (bool3)
        bool2 = true;
    }
    return bool2;
  }

  public boolean connectsToEmergencyNumber(String paramString1, String paramString2)
  {
    return matchesEmergencyNumberHelper(paramString1, paramString2, true);
  }

  String getExampleShortNumber(String paramString)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString);
    if (localPhoneMetadata == null)
      return "";
    Phonemetadata.PhoneNumberDesc localPhoneNumberDesc = localPhoneMetadata.getShortCode();
    if (localPhoneNumberDesc.hasExampleNumber())
      return localPhoneNumberDesc.getExampleNumber();
    return "";
  }

  String getExampleShortNumberForCost(String paramString, ShortNumberCost paramShortNumberCost)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString);
    if (localPhoneMetadata == null)
      return "";
    int i = 1.$SwitchMap$com$google$i18n$phonenumbers$ShortNumberInfo$ShortNumberCost[paramShortNumberCost.ordinal()];
    Phonemetadata.PhoneNumberDesc localPhoneNumberDesc = null;
    switch (i)
    {
    case 2:
    default:
    case 4:
    case 3:
    case 1:
    }
    while ((localPhoneNumberDesc != null) && (localPhoneNumberDesc.hasExampleNumber()))
    {
      return localPhoneNumberDesc.getExampleNumber();
      localPhoneNumberDesc = localPhoneMetadata.getTollFree();
      continue;
      localPhoneNumberDesc = localPhoneMetadata.getStandardRate();
      continue;
      localPhoneNumberDesc = localPhoneMetadata.getPremiumRate();
    }
    return "";
  }

  public ShortNumberCost getExpectedCost(Phonenumber.PhoneNumber paramPhoneNumber)
  {
    List localList = getRegionCodesForCountryCode(paramPhoneNumber.getCountryCode());
    ShortNumberCost localShortNumberCost1;
    if (localList.size() == 0)
      localShortNumberCost1 = ShortNumberCost.UNKNOWN_COST;
    while (true)
    {
      return localShortNumberCost1;
      if (localList.size() == 1)
        return getExpectedCostForRegion(paramPhoneNumber, (String)localList.get(0));
      localShortNumberCost1 = ShortNumberCost.TOLL_FREE;
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        ShortNumberCost localShortNumberCost2 = getExpectedCostForRegion(paramPhoneNumber, (String)localIterator.next());
        switch (1.$SwitchMap$com$google$i18n$phonenumbers$ShortNumberInfo$ShortNumberCost[localShortNumberCost2.ordinal()])
        {
        case 4:
        default:
          Logger localLogger = logger;
          Level localLevel = Level.SEVERE;
          String str = String.valueOf(String.valueOf(localShortNumberCost2));
          localLogger.log(localLevel, 30 + str.length() + "Unrecognised cost for region: " + str);
          break;
        case 1:
          return ShortNumberCost.PREMIUM_RATE;
        case 2:
          localShortNumberCost1 = ShortNumberCost.UNKNOWN_COST;
          break;
        case 3:
          if (localShortNumberCost1 != ShortNumberCost.UNKNOWN_COST)
            localShortNumberCost1 = ShortNumberCost.STANDARD_RATE;
          break;
        }
      }
    }
  }

  public ShortNumberCost getExpectedCostForRegion(Phonenumber.PhoneNumber paramPhoneNumber, String paramString)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString);
    if (localPhoneMetadata == null)
      return ShortNumberCost.UNKNOWN_COST;
    String str = getNationalSignificantNumber(paramPhoneNumber);
    if (matchesPossibleNumberAndNationalNumber(str, localPhoneMetadata.getPremiumRate()))
      return ShortNumberCost.PREMIUM_RATE;
    if (matchesPossibleNumberAndNationalNumber(str, localPhoneMetadata.getStandardRate()))
      return ShortNumberCost.STANDARD_RATE;
    if (matchesPossibleNumberAndNationalNumber(str, localPhoneMetadata.getTollFree()))
      return ShortNumberCost.TOLL_FREE;
    if (isEmergencyNumber(str, paramString))
      return ShortNumberCost.TOLL_FREE;
    return ShortNumberCost.UNKNOWN_COST;
  }

  @Deprecated
  public ShortNumberCost getExpectedCostForRegion(String paramString1, String paramString2)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString2);
    if (localPhoneMetadata == null)
      return ShortNumberCost.UNKNOWN_COST;
    if (matchesPossibleNumberAndNationalNumber(paramString1, localPhoneMetadata.getPremiumRate()))
      return ShortNumberCost.PREMIUM_RATE;
    if (matchesPossibleNumberAndNationalNumber(paramString1, localPhoneMetadata.getStandardRate()))
      return ShortNumberCost.STANDARD_RATE;
    if (matchesPossibleNumberAndNationalNumber(paramString1, localPhoneMetadata.getTollFree()))
      return ShortNumberCost.TOLL_FREE;
    if (isEmergencyNumber(paramString1, paramString2))
      return ShortNumberCost.TOLL_FREE;
    return ShortNumberCost.UNKNOWN_COST;
  }

  Set<String> getSupportedRegions()
  {
    return Collections.unmodifiableSet(MetadataManager.getShortNumberMetadataSupportedRegions());
  }

  public boolean isCarrierSpecific(Phonenumber.PhoneNumber paramPhoneNumber)
  {
    String str1 = getRegionCodeForShortNumberFromRegionList(paramPhoneNumber, getRegionCodesForCountryCode(paramPhoneNumber.getCountryCode()));
    String str2 = getNationalSignificantNumber(paramPhoneNumber);
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(str1);
    return (localPhoneMetadata != null) && (matchesPossibleNumberAndNationalNumber(str2, localPhoneMetadata.getCarrierSpecific()));
  }

  public boolean isEmergencyNumber(String paramString1, String paramString2)
  {
    return matchesEmergencyNumberHelper(paramString1, paramString2, false);
  }

  public boolean isPossibleShortNumber(Phonenumber.PhoneNumber paramPhoneNumber)
  {
    List localList = getRegionCodesForCountryCode(paramPhoneNumber.getCountryCode());
    String str = getNationalSignificantNumber(paramPhoneNumber);
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion((String)localIterator.next());
      if (this.matcherApi.matchesPossibleNumber(str, localPhoneMetadata.getGeneralDesc()))
        return true;
    }
    return false;
  }

  public boolean isPossibleShortNumberForRegion(Phonenumber.PhoneNumber paramPhoneNumber, String paramString)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString);
    if (localPhoneMetadata == null)
      return false;
    return this.matcherApi.matchesPossibleNumber(getNationalSignificantNumber(paramPhoneNumber), localPhoneMetadata.getGeneralDesc());
  }

  @Deprecated
  public boolean isPossibleShortNumberForRegion(String paramString1, String paramString2)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString2);
    if (localPhoneMetadata == null)
      return false;
    return this.matcherApi.matchesPossibleNumber(paramString1, localPhoneMetadata.getGeneralDesc());
  }

  public boolean isValidShortNumber(Phonenumber.PhoneNumber paramPhoneNumber)
  {
    List localList = getRegionCodesForCountryCode(paramPhoneNumber.getCountryCode());
    String str = getRegionCodeForShortNumberFromRegionList(paramPhoneNumber, localList);
    if ((localList.size() > 1) && (str != null))
      return true;
    return isValidShortNumberForRegion(paramPhoneNumber, str);
  }

  public boolean isValidShortNumberForRegion(Phonenumber.PhoneNumber paramPhoneNumber, String paramString)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString);
    if (localPhoneMetadata == null);
    String str;
    do
    {
      return false;
      str = getNationalSignificantNumber(paramPhoneNumber);
    }
    while (!matchesPossibleNumberAndNationalNumber(str, localPhoneMetadata.getGeneralDesc()));
    return matchesPossibleNumberAndNationalNumber(str, localPhoneMetadata.getShortCode());
  }

  @Deprecated
  public boolean isValidShortNumberForRegion(String paramString1, String paramString2)
  {
    Phonemetadata.PhoneMetadata localPhoneMetadata = MetadataManager.getShortNumberMetadataForRegion(paramString2);
    if (localPhoneMetadata == null);
    while (!matchesPossibleNumberAndNationalNumber(paramString1, localPhoneMetadata.getGeneralDesc()))
      return false;
    return matchesPossibleNumberAndNationalNumber(paramString1, localPhoneMetadata.getShortCode());
  }

  public static enum ShortNumberCost
  {
    static
    {
      STANDARD_RATE = new ShortNumberCost("STANDARD_RATE", 1);
      PREMIUM_RATE = new ShortNumberCost("PREMIUM_RATE", 2);
      UNKNOWN_COST = new ShortNumberCost("UNKNOWN_COST", 3);
      ShortNumberCost[] arrayOfShortNumberCost = new ShortNumberCost[4];
      arrayOfShortNumberCost[0] = TOLL_FREE;
      arrayOfShortNumberCost[1] = STANDARD_RATE;
      arrayOfShortNumberCost[2] = PREMIUM_RATE;
      arrayOfShortNumberCost[3] = UNKNOWN_COST;
    }
  }
}