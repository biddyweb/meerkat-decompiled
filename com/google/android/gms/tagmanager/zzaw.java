package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import java.util.HashMap;
import java.util.Map;

class zzaw
{
  private static String zzayS;
  static Map<String, String> zzayT = new HashMap();

  static String zzA(String paramString1, String paramString2)
  {
    if (paramString2 == null)
    {
      if (paramString1.length() > 0)
        return paramString1;
      return null;
    }
    return Uri.parse("http://hostname/?" + paramString1).getQueryParameter(paramString2);
  }

  static void zzdc(String paramString)
  {
    try
    {
      zzayS = paramString;
      return;
    }
    finally
    {
    }
  }

  static String zzf(Context paramContext, String paramString1, String paramString2)
  {
    String str = (String)zzayT.get(paramString1);
    SharedPreferences localSharedPreferences;
    if (str == null)
    {
      localSharedPreferences = paramContext.getSharedPreferences("gtm_click_referrers", 0);
      if (localSharedPreferences == null)
        break label59;
    }
    label59: for (str = localSharedPreferences.getString(paramString1, ""); ; str = "")
    {
      zzayT.put(paramString1, str);
      return zzA(str, paramString2);
    }
  }

  static void zzh(Context paramContext, String paramString)
  {
    zzcu.zza(paramContext, "gtm_install_referrer", "referrer", paramString);
    zzj(paramContext, paramString);
  }

  static String zzi(Context paramContext, String paramString)
  {
    if (zzayS == null);
    try
    {
      SharedPreferences localSharedPreferences;
      if (zzayS == null)
      {
        localSharedPreferences = paramContext.getSharedPreferences("gtm_install_referrer", 0);
        if (localSharedPreferences == null)
          break label51;
      }
      label51: for (zzayS = localSharedPreferences.getString("referrer", ""); ; zzayS = "")
        return zzA(zzayS, paramString);
    }
    finally
    {
    }
  }

  static void zzj(Context paramContext, String paramString)
  {
    String str = zzA(paramString, "conv");
    if ((str != null) && (str.length() > 0))
    {
      zzayT.put(str, paramString);
      zzcu.zza(paramContext, "gtm_click_referrers", str, paramString);
    }
  }
}