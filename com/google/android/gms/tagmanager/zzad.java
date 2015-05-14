package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzad extends zzcy
{
  private static final String ID = zza.zzar.toString();

  public zzad()
  {
    super(ID);
  }

  protected boolean zza(String paramString1, String paramString2, Map<String, zzd.zza> paramMap)
  {
    return paramString1.endsWith(paramString2);
  }
}