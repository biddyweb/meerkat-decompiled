package org.joda.time.tz;

import java.text.DateFormatSymbols;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.joda.time.DateTimeUtils;

public class DefaultNameProvider
  implements NameProvider
{
  private HashMap<Locale, Map<String, Map<String, Object>>> iByLocaleCache = createCache();
  private HashMap<Locale, Map<String, Map<Boolean, Object>>> iByLocaleCache2 = createCache();

  private HashMap createCache()
  {
    return new HashMap(7);
  }

  private String[] getNameSet(Locale paramLocale, String paramString1, String paramString2)
  {
    String[] arrayOfString1;
    if ((paramLocale == null) || (paramString1 == null) || (paramString2 == null))
    {
      arrayOfString1 = null;
      return arrayOfString1;
    }
    while (true)
    {
      Map localMap;
      int j;
      int m;
      try
      {
        localMap = (Map)this.iByLocaleCache.get(paramLocale);
        if (localMap != null)
          break label418;
        HashMap localHashMap1 = this.iByLocaleCache;
        HashMap localHashMap2 = createCache();
        localHashMap1.put(paramLocale, localHashMap2);
        localObject2 = localHashMap2;
        Object localObject3 = (Map)((Map)localObject2).get(paramString1);
        Object localObject4;
        if (localObject3 == null)
        {
          localObject3 = createCache();
          ((Map)localObject2).put(paramString1, localObject3);
          String[][] arrayOfString2 = DateTimeUtils.getDateFormatSymbols(Locale.ENGLISH).getZoneStrings();
          int i = arrayOfString2.length;
          j = 0;
          if (j >= i)
            break label412;
          String[] arrayOfString3 = arrayOfString2[j];
          if ((arrayOfString3 == null) || (arrayOfString3.length != 5) || (!paramString1.equals(arrayOfString3[0])))
            break label425;
          arrayOfString4 = arrayOfString3;
          String[][] arrayOfString5 = DateTimeUtils.getDateFormatSymbols(paramLocale).getZoneStrings();
          int k = arrayOfString5.length;
          m = 0;
          localObject4 = null;
          if (m < k)
          {
            String[] arrayOfString6 = arrayOfString5[m];
            if ((arrayOfString6 == null) || (arrayOfString6.length != 5) || (!paramString1.equals(arrayOfString6[0])))
              break label431;
            localObject4 = arrayOfString6;
          }
          if ((arrayOfString4 != null) && (localObject4 != null))
          {
            String str1 = arrayOfString4[2];
            String[] arrayOfString7 = new String[2];
            arrayOfString7[0] = localObject4[2];
            arrayOfString7[1] = localObject4[1];
            ((Map)localObject3).put(str1, arrayOfString7);
            if (!arrayOfString4[2].equals(arrayOfString4[4]))
              continue;
            String str3 = arrayOfString4[4] + "-Summer";
            String[] arrayOfString9 = new String[2];
            arrayOfString9[0] = localObject4[4];
            arrayOfString9[1] = localObject4[3];
            ((Map)localObject3).put(str3, arrayOfString9);
          }
        }
        arrayOfString1 = (String[])((Map)localObject3).get(paramString2);
        break;
        String str2 = arrayOfString4[4];
        String[] arrayOfString8 = new String[2];
        arrayOfString8[0] = localObject4[4];
        arrayOfString8[1] = localObject4[3];
        ((Map)localObject3).put(str2, arrayOfString8);
        continue;
      }
      finally
      {
      }
      label412: String[] arrayOfString4 = null;
      continue;
      label418: Object localObject2 = localMap;
      continue;
      label425: j++;
      continue;
      label431: m++;
    }
  }

  private String[] getNameSet(Locale paramLocale, String paramString1, String paramString2, boolean paramBoolean)
  {
    String[] arrayOfString1;
    if ((paramLocale == null) || (paramString1 == null) || (paramString2 == null))
    {
      arrayOfString1 = null;
      return arrayOfString1;
    }
    while (true)
    {
      Map localMap;
      try
      {
        localMap = (Map)this.iByLocaleCache2.get(paramLocale);
        if (localMap != null)
          break label357;
        HashMap localHashMap1 = this.iByLocaleCache2;
        HashMap localHashMap2 = createCache();
        localHashMap1.put(paramLocale, localHashMap2);
        localObject2 = localHashMap2;
        Object localObject3 = (Map)((Map)localObject2).get(paramString1);
        int j;
        int m;
        if (localObject3 == null)
        {
          localObject3 = createCache();
          ((Map)localObject2).put(paramString1, localObject3);
          String[][] arrayOfString2 = DateTimeUtils.getDateFormatSymbols(Locale.ENGLISH).getZoneStrings();
          int i = arrayOfString2.length;
          j = 0;
          if (j >= i)
            break label351;
          String[] arrayOfString3 = arrayOfString2[j];
          if ((arrayOfString3 == null) || (arrayOfString3.length != 5) || (!paramString1.equals(arrayOfString3[0])))
            continue;
          arrayOfString4 = arrayOfString3;
          String[][] arrayOfString5 = DateTimeUtils.getDateFormatSymbols(paramLocale).getZoneStrings();
          int k = arrayOfString5.length;
          m = 0;
          Object localObject4 = null;
          if (m < k)
          {
            String[] arrayOfString6 = arrayOfString5[m];
            if ((arrayOfString6 == null) || (arrayOfString6.length != 5) || (!paramString1.equals(arrayOfString6[0])))
              continue;
            localObject4 = arrayOfString6;
          }
          if ((arrayOfString4 != null) && (localObject4 != null))
          {
            Boolean localBoolean1 = Boolean.TRUE;
            String[] arrayOfString7 = new String[2];
            arrayOfString7[0] = localObject4[2];
            arrayOfString7[1] = localObject4[1];
            ((Map)localObject3).put(localBoolean1, arrayOfString7);
            Boolean localBoolean2 = Boolean.FALSE;
            String[] arrayOfString8 = new String[2];
            arrayOfString8[0] = localObject4[4];
            arrayOfString8[1] = localObject4[3];
            ((Map)localObject3).put(localBoolean2, arrayOfString8);
          }
        }
        arrayOfString1 = (String[])((Map)localObject3).get(Boolean.valueOf(paramBoolean));
        break;
        j++;
        continue;
        m++;
        continue;
      }
      finally
      {
      }
      label351: String[] arrayOfString4 = null;
      continue;
      label357: Object localObject2 = localMap;
    }
  }

  public String getName(Locale paramLocale, String paramString1, String paramString2)
  {
    String[] arrayOfString = getNameSet(paramLocale, paramString1, paramString2);
    if (arrayOfString == null)
      return null;
    return arrayOfString[1];
  }

  public String getName(Locale paramLocale, String paramString1, String paramString2, boolean paramBoolean)
  {
    String[] arrayOfString = getNameSet(paramLocale, paramString1, paramString2, paramBoolean);
    if (arrayOfString == null)
      return null;
    return arrayOfString[1];
  }

  public String getShortName(Locale paramLocale, String paramString1, String paramString2)
  {
    String[] arrayOfString = getNameSet(paramLocale, paramString1, paramString2);
    if (arrayOfString == null)
      return null;
    return arrayOfString[0];
  }

  public String getShortName(Locale paramLocale, String paramString1, String paramString2, boolean paramBoolean)
  {
    String[] arrayOfString = getNameSet(paramLocale, paramString1, paramString2, paramBoolean);
    if (arrayOfString == null)
      return null;
    return arrayOfString[0];
  }
}