package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

@zzgi
public final class zzbv
{
  private String zzqa;
  private List<String> zzqb;
  private int zzqc = -1;

  public zzbv()
  {
    this((String)zzca.zzql.zzbY(), new ArrayList(), -1);
  }

  public zzbv(String paramString, List<String> paramList)
  {
    this(paramString, paramList, -1);
  }

  public zzbv(String paramString, List<String> paramList, int paramInt)
  {
    if (paramList != null)
    {
      this.zzqb = paramList;
      if (!TextUtils.isEmpty(paramString))
        break label59;
    }
    label59: for (String str = (String)zzca.zzql.zzbY(); ; str = paramString)
    {
      this.zzqa = str;
      this.zzqc = paramInt;
      return;
      paramList = new ArrayList();
      break;
    }
  }

  public String zzbV()
  {
    return this.zzqa;
  }

  public List<String> zzbW()
  {
    return this.zzqb;
  }

  public int zzbX()
  {
    return this.zzqc;
  }
}