package com.google.android.gms.analytics;

import com.google.android.gms.internal.zzik;
import java.util.List;
import java.util.Map;

abstract interface zzb
{
  public abstract void connect();

  public abstract void disconnect();

  public abstract void zza(Map<String, String> paramMap, long paramLong, String paramString, List<zzik> paramList);

  public abstract void zzfa();
}