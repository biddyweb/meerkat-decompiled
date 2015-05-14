package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

class zzcd extends zzaj
{
  private static final String ID = zza.zzag.toString();
  private static final String zzazH = zzb.zzbw.toString();
  private static final String zzazI = zzb.zzbx.toString();
  private static final String zzazJ = zzb.zzdc.toString();
  private static final String zzazK = zzb.zzcW.toString();

  public zzcd()
  {
    super(str, arrayOfString);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzazH);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzazI);
    if ((localzza1 == null) || (localzza1 == zzde.zzuf()) || (localzza2 == null) || (localzza2 == zzde.zzuf()))
      return zzde.zzuf();
    int i = 64;
    if (zzde.zzk((zzd.zza)paramMap.get(zzazJ)).booleanValue())
      i = 66;
    zzd.zza localzza3 = (zzd.zza)paramMap.get(zzazK);
    int j;
    if (localzza3 != null)
    {
      Long localLong = zzde.zzi(localzza3);
      if (localLong == zzde.zzua())
        return zzde.zzuf();
      j = localLong.intValue();
      if (j < 0)
        return zzde.zzuf();
    }
    else
    {
      j = 1;
    }
    try
    {
      String str1 = zzde.zzg(localzza1);
      Matcher localMatcher = Pattern.compile(zzde.zzg(localzza2), i).matcher(str1);
      boolean bool = localMatcher.find();
      String str2 = null;
      if (bool)
      {
        int k = localMatcher.groupCount();
        str2 = null;
        if (k >= j)
          str2 = localMatcher.group(j);
      }
      if (str2 == null)
        return zzde.zzuf();
      zzd.zza localzza4 = zzde.zzx(str2);
      return localzza4;
    }
    catch (PatternSyntaxException localPatternSyntaxException)
    {
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}