package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzd.zza;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

abstract class zzaj
{
  private final Set<String> zzayG;
  private final String zzayH;

  public zzaj(String paramString, String[] paramArrayOfString)
  {
    this.zzayH = paramString;
    this.zzayG = new HashSet(paramArrayOfString.length);
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String str = paramArrayOfString[j];
      this.zzayG.add(str);
    }
  }

  public abstract zzd.zza zzH(Map<String, zzd.zza> paramMap);

  boolean zzb(Set<String> paramSet)
  {
    return paramSet.containsAll(this.zzayG);
  }

  public abstract boolean zzsD();

  public String zzth()
  {
    return this.zzayH;
  }

  public Set<String> zzti()
  {
    return this.zzayG;
  }
}