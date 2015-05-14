package com.digits.sdk.android;

import android.content.Context;
import android.widget.ArrayAdapter;
import android.widget.SectionIndexer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

class CountryListAdapter extends ArrayAdapter<CountryInfo>
  implements SectionIndexer
{
  private final HashMap<String, Integer> alphaIndex = new LinkedHashMap();
  private final HashMap<String, Integer> countryPosition = new LinkedHashMap();
  private String[] sections;

  public CountryListAdapter(Context paramContext)
  {
    super(paramContext, R.layout.dgts__country_row, 16908308);
  }

  public int getPositionForCountry(String paramString)
  {
    Integer localInteger = (Integer)this.countryPosition.get(paramString);
    if (localInteger == null)
      return 0;
    return localInteger.intValue();
  }

  public int getPositionForSection(int paramInt)
  {
    if (this.sections == null);
    while (paramInt <= 0)
      return 0;
    if (paramInt >= this.sections.length)
      paramInt = -1 + this.sections.length;
    return ((Integer)this.alphaIndex.get(this.sections[paramInt])).intValue();
  }

  public int getSectionForPosition(int paramInt)
  {
    return 0;
  }

  public Object[] getSections()
  {
    return this.sections;
  }

  public void setData(List<CountryInfo> paramList)
  {
    int i = 0;
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      CountryInfo localCountryInfo = (CountryInfo)localIterator.next();
      String str = localCountryInfo.country.substring(0, 1).toUpperCase(Locale.getDefault());
      if (!this.alphaIndex.containsKey(str))
        this.alphaIndex.put(str, Integer.valueOf(i));
      this.countryPosition.put(localCountryInfo.country, Integer.valueOf(i));
      i++;
      add(localCountryInfo);
    }
    this.sections = new String[this.alphaIndex.size()];
    this.alphaIndex.keySet().toArray(this.sections);
    notifyDataSetChanged();
  }
}