package com.google.android.gms.analytics;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class zzaf
{
  private final Map<String, Integer> zzEO = new HashMap();
  private final Map<String, String> zzEP = new HashMap();
  private final boolean zzEQ;
  private final String zzER;

  public zzaf(String paramString, boolean paramBoolean)
  {
    this.zzEQ = paramBoolean;
    this.zzER = paramString;
  }

  public void zze(String paramString, int paramInt)
  {
    if (!this.zzEQ)
      return;
    Integer localInteger = (Integer)this.zzEO.get(paramString);
    if (localInteger == null)
      localInteger = Integer.valueOf(0);
    this.zzEO.put(paramString, Integer.valueOf(paramInt + localInteger.intValue()));
  }

  public String zzgx()
  {
    if (!this.zzEQ)
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this.zzER);
    Iterator localIterator1 = this.zzEO.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str2 = (String)localIterator1.next();
      localStringBuilder.append("&").append(str2).append("=").append(this.zzEO.get(str2));
    }
    Iterator localIterator2 = this.zzEP.keySet().iterator();
    while (localIterator2.hasNext())
    {
      String str1 = (String)localIterator2.next();
      localStringBuilder.append("&").append(str1).append("=").append((String)this.zzEP.get(str1));
    }
    return localStringBuilder.toString();
  }

  public void zzk(String paramString1, String paramString2)
  {
    if ((!this.zzEQ) || (TextUtils.isEmpty(paramString1)))
      return;
    this.zzEP.put(paramString1, paramString2);
  }
}