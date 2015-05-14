package com.digits.sdk.android;

import java.text.Collator;
import java.util.Locale;

class CountryInfo
  implements Comparable<CountryInfo>
{
  private final Collator collator = Collator.getInstance(Locale.getDefault());
  public final String country;
  public final int countryCode;

  public CountryInfo(String paramString, int paramInt)
  {
    this.collator.setStrength(0);
    this.country = paramString;
    this.countryCode = paramInt;
  }

  public int compareTo(CountryInfo paramCountryInfo)
  {
    return this.collator.compare(this.country, paramCountryInfo.country);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    CountryInfo localCountryInfo;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localCountryInfo = (CountryInfo)paramObject;
      if (this.countryCode != localCountryInfo.countryCode)
        return false;
      if (this.country == null)
        break;
    }
    while (this.country.equals(localCountryInfo.country));
    while (true)
    {
      return false;
      if (localCountryInfo.country == null)
        break;
    }
  }

  public int hashCode()
  {
    if (this.country != null);
    for (int i = this.country.hashCode(); ; i = 0)
      return i * 31 + this.countryCode;
  }

  public String toString()
  {
    return this.country + " +" + this.countryCode;
  }
}