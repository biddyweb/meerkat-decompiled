package com.google.android.gms.analytics;

import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class zzan
{
  private static final char[] zzFy = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70 };

  static String zzG(boolean paramBoolean)
  {
    if (paramBoolean)
      return "1";
    return "0";
  }

  public static double zza(String paramString, double paramDouble)
  {
    if (paramString == null)
      return paramDouble;
    try
    {
      double d = Double.parseDouble(paramString);
      return d;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return paramDouble;
  }

  public static String zza(Locale paramLocale)
  {
    if (paramLocale == null);
    String str;
    do
    {
      return null;
      str = paramLocale.getLanguage();
    }
    while (TextUtils.isEmpty(str));
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(str.toLowerCase());
    if (!TextUtils.isEmpty(paramLocale.getCountry()))
      localStringBuilder.append("-").append(paramLocale.getCountry().toLowerCase());
    return localStringBuilder.toString();
  }

  public static void zza(Map<String, String> paramMap, String paramString, zzq paramzzq)
  {
    if (!paramMap.containsKey(paramString))
      paramMap.put(paramString, paramzzq.getValue(paramString));
  }

  public static void zza(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if (!paramMap.containsKey(paramString1))
      paramMap.put(paramString1, paramString2);
  }

  public static Map<String, String> zzat(String paramString)
  {
    HashMap localHashMap = new HashMap();
    String[] arrayOfString1 = paramString.split("&");
    int i = arrayOfString1.length;
    int j = 0;
    if (j < i)
    {
      String[] arrayOfString2 = arrayOfString1[j].split("=");
      if (arrayOfString2.length > 1)
        localHashMap.put(arrayOfString2[0], arrayOfString2[1]);
      while (true)
      {
        j++;
        break;
        if ((arrayOfString2.length == 1) && (arrayOfString2[0].length() != 0))
          localHashMap.put(arrayOfString2[0], null);
      }
    }
    return localHashMap;
  }

  public static String zzau(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return null;
    if (paramString.contains("?"))
    {
      String[] arrayOfString2 = paramString.split("[\\?]");
      if (arrayOfString2.length > 1)
        paramString = arrayOfString2[1];
    }
    if (paramString.contains("%3D"));
    StringBuilder localStringBuilder;
    while (true)
    {
      try
      {
        String str = URLDecoder.decode(paramString, "UTF-8");
        paramString = str;
        Map localMap = zzat(paramString);
        String[] arrayOfString1 = { "dclid", "utm_source", "gclid", "utm_campaign", "utm_medium", "utm_term", "utm_content", "utm_id", "gmob_t" };
        localStringBuilder = new StringBuilder();
        int i = 0;
        if (i >= arrayOfString1.length)
          break;
        if (!TextUtils.isEmpty((CharSequence)localMap.get(arrayOfString1[i])))
        {
          if (localStringBuilder.length() > 0)
            localStringBuilder.append("&");
          localStringBuilder.append(arrayOfString1[i]).append("=").append((String)localMap.get(arrayOfString1[i]));
        }
        i++;
        continue;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        return null;
      }
      if (!paramString.contains("="))
        return null;
    }
    return localStringBuilder.toString();
  }

  public static MessageDigest zzav(String paramString)
  {
    int i = 0;
    while (i < 2)
      try
      {
        MessageDigest localMessageDigest = MessageDigest.getInstance(paramString);
        if (localMessageDigest != null)
          return localMessageDigest;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        i++;
      }
    return null;
  }

  public static boolean zze(String paramString, boolean paramBoolean)
  {
    if (paramString != null)
    {
      if ((!paramString.equalsIgnoreCase("true")) && (!paramString.equalsIgnoreCase("yes")) && (!paramString.equalsIgnoreCase("1")))
        break label35;
      paramBoolean = true;
    }
    label35: 
    while ((!paramString.equalsIgnoreCase("false")) && (!paramString.equalsIgnoreCase("no")) && (!paramString.equalsIgnoreCase("0")))
      return paramBoolean;
    return false;
  }
}