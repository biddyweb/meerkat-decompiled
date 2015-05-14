package com.google.android.gms.analytics;

import android.text.TextUtils;

public class zzab
{
  private final String zzEA;
  private String zzEB;
  private String zzEC = "https:";
  private String zzEx;
  private final long zzEy;
  private final long zzEz;

  public zzab(String paramString1, long paramLong1, long paramLong2, String paramString2)
  {
    this.zzEx = paramString1;
    this.zzEy = paramLong1;
    this.zzEz = paramLong2;
    this.zzEA = paramString2;
  }

  public void zzap(String paramString)
  {
    this.zzEx = paramString;
  }

  public void zzaq(String paramString)
  {
    if ((paramString == null) || (TextUtils.isEmpty(paramString.trim())));
    do
    {
      return;
      this.zzEB = paramString;
    }
    while (!paramString.toLowerCase().startsWith("http:"));
    this.zzEC = "http:";
  }

  public String zzgr()
  {
    return this.zzEx;
  }

  public long zzgs()
  {
    return this.zzEy;
  }

  public long zzgt()
  {
    return this.zzEz;
  }

  public String zzgu()
  {
    return this.zzEC;
  }
}