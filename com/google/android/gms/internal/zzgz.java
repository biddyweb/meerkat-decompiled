package com.google.android.gms.internal;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@zzgi
public final class zzgz
{
  private int mOrientation = -1;
  private String zzrm;
  private List<String> zzwY;
  private String zzxC;
  private String zzxD;
  private List<String> zzxE;
  private String zzxF;
  private String zzxG;
  private List<String> zzxH;
  private long zzxI = -1L;
  private boolean zzxJ = false;
  private final long zzxK = -1L;
  private long zzxL = -1L;
  private boolean zzxM = false;
  private boolean zzxN = false;
  private boolean zzxO = false;
  private boolean zzxP = true;

  static String zza(Map<String, List<String>> paramMap, String paramString)
  {
    List localList = (List)paramMap.get(paramString);
    if ((localList != null) && (!localList.isEmpty()))
      return (String)localList.get(0);
    return null;
  }

  static long zzb(Map<String, List<String>> paramMap, String paramString)
  {
    List localList = (List)paramMap.get(paramString);
    if ((localList != null) && (!localList.isEmpty()))
    {
      String str = (String)localList.get(0);
      try
      {
        float f = Float.parseFloat(str);
        return ()(f * 1000.0F);
      }
      catch (NumberFormatException localNumberFormatException)
      {
        zzhx.zzac("Could not parse float from " + paramString + " header: " + str);
      }
    }
    return -1L;
  }

  static List<String> zzc(Map<String, List<String>> paramMap, String paramString)
  {
    List localList = (List)paramMap.get(paramString);
    if ((localList != null) && (!localList.isEmpty()))
    {
      String str = (String)localList.get(0);
      if (str != null)
        return Arrays.asList(str.trim().split("\\s+"));
    }
    return null;
  }

  private boolean zzd(Map<String, List<String>> paramMap, String paramString)
  {
    List localList = (List)paramMap.get(paramString);
    return (localList != null) && (!localList.isEmpty()) && (Boolean.valueOf((String)localList.get(0)).booleanValue());
  }

  private void zzi(Map<String, List<String>> paramMap)
  {
    this.zzxC = zza(paramMap, "X-Afma-Ad-Size");
  }

  private void zzj(Map<String, List<String>> paramMap)
  {
    List localList = zzc(paramMap, "X-Afma-Click-Tracking-Urls");
    if (localList != null)
      this.zzxE = localList;
  }

  private void zzk(Map<String, List<String>> paramMap)
  {
    List localList = (List)paramMap.get("X-Afma-Debug-Dialog");
    if ((localList != null) && (!localList.isEmpty()))
      this.zzxF = ((String)localList.get(0));
  }

  private void zzl(Map<String, List<String>> paramMap)
  {
    List localList = zzc(paramMap, "X-Afma-Tracking-Urls");
    if (localList != null)
      this.zzxH = localList;
  }

  private void zzm(Map<String, List<String>> paramMap)
  {
    long l = zzb(paramMap, "X-Afma-Interstitial-Timeout");
    if (l != -1L)
      this.zzxI = l;
  }

  private void zzn(Map<String, List<String>> paramMap)
  {
    this.zzxG = zza(paramMap, "X-Afma-ActiveView");
  }

  private void zzo(Map<String, List<String>> paramMap)
  {
    this.zzxN |= zzd(paramMap, "X-Afma-Native");
  }

  private void zzp(Map<String, List<String>> paramMap)
  {
    this.zzxM |= zzd(paramMap, "X-Afma-Custom-Rendering-Allowed");
  }

  private void zzq(Map<String, List<String>> paramMap)
  {
    this.zzxJ |= zzd(paramMap, "X-Afma-Mediation");
  }

  private void zzr(Map<String, List<String>> paramMap)
  {
    List localList = zzc(paramMap, "X-Afma-Manual-Tracking-Urls");
    if (localList != null)
      this.zzwY = localList;
  }

  private void zzs(Map<String, List<String>> paramMap)
  {
    long l = zzb(paramMap, "X-Afma-Refresh-Rate");
    if (l != -1L)
      this.zzxL = l;
  }

  private void zzt(Map<String, List<String>> paramMap)
  {
    List localList = (List)paramMap.get("X-Afma-Orientation");
    String str;
    if ((localList != null) && (!localList.isEmpty()))
    {
      str = (String)localList.get(0);
      if (!"portrait".equalsIgnoreCase(str))
        break label56;
      this.mOrientation = zzab.zzaO().zzey();
    }
    label56: 
    while (!"landscape".equalsIgnoreCase(str))
      return;
    this.mOrientation = zzab.zzaO().zzex();
  }

  private void zzu(Map<String, List<String>> paramMap)
  {
    List localList = (List)paramMap.get("X-Afma-Use-HTTPS");
    if ((localList != null) && (!localList.isEmpty()))
      this.zzxO = Boolean.valueOf((String)localList.get(0)).booleanValue();
  }

  private void zzv(Map<String, List<String>> paramMap)
  {
    List localList = (List)paramMap.get("X-Afma-Content-Url-Opted-Out");
    if ((localList != null) && (!localList.isEmpty()))
      this.zzxP = Boolean.valueOf((String)localList.get(0)).booleanValue();
  }

  public void zza(String paramString1, Map<String, List<String>> paramMap, String paramString2)
  {
    this.zzxD = paramString1;
    this.zzrm = paramString2;
    zzh(paramMap);
  }

  public void zzh(Map<String, List<String>> paramMap)
  {
    zzi(paramMap);
    zzj(paramMap);
    zzk(paramMap);
    zzl(paramMap);
    zzm(paramMap);
    zzq(paramMap);
    zzr(paramMap);
    zzs(paramMap);
    zzt(paramMap);
    zzn(paramMap);
    zzu(paramMap);
    zzp(paramMap);
    zzo(paramMap);
    zzv(paramMap);
  }

  public zzgq zzi(long paramLong)
  {
    return new zzgq(this.zzxD, this.zzrm, this.zzxE, this.zzxH, this.zzxI, this.zzxJ, -1L, this.zzwY, this.zzxL, this.mOrientation, this.zzxC, paramLong, this.zzxF, this.zzxG, this.zzxM, this.zzxN, this.zzxO, this.zzxP, false);
  }
}