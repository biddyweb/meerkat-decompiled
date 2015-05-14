package com.google.android.gms.analytics;

import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzac
{
  public static String encode(String paramString)
  {
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    throw new AssertionError("URL encoding failed for: " + paramString);
  }

  static Map<String, String> zzC(Map<String, String> paramMap)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if ((((String)localEntry.getKey()).startsWith("&")) && (localEntry.getValue() != null))
      {
        String str = ((String)localEntry.getKey()).substring(1);
        if (!TextUtils.isEmpty(str))
          localHashMap.put(str, localEntry.getValue());
      }
    }
    return localHashMap;
  }

  public static String zza(zzab paramzzab, long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramzzab.zzgr());
    if (paramzzab.zzgt() > 0L)
    {
      long l = paramLong - paramzzab.zzgt();
      if (l >= 0L)
        localStringBuilder.append("&qt").append("=").append(l);
    }
    localStringBuilder.append("&z").append("=").append(paramzzab.zzgs());
    return localStringBuilder.toString();
  }
}