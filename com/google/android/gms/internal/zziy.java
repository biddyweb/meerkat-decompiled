package com.google.android.gms.internal;

import java.util.HashMap;
import java.util.Map;

public class zziy
{
  private static final String[] zzGf;
  private static final Map<String, Integer> zzGg;

  static
  {
    int i = 0;
    zzGf = new String[] { "text1", "text2", "icon", "intent_action", "intent_data", "intent_data_id", "intent_extra_data", "suggest_large_icon", "intent_activity" };
    zzGg = new HashMap(zzGf.length);
    while (i < zzGf.length)
    {
      zzGg.put(zzGf[i], Integer.valueOf(i));
      i++;
    }
  }

  public static String zzV(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= zzGf.length))
      return null;
    return zzGf[paramInt];
  }

  public static int zzay(String paramString)
  {
    Integer localInteger = (Integer)zzGg.get(paramString);
    if (localInteger == null)
      throw new IllegalArgumentException("[" + paramString + "] is not a valid global search section name");
    return localInteger.intValue();
  }

  public static int zzgW()
  {
    return zzGf.length;
  }
}