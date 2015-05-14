package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzs extends zzaj
{
  private static final String ID = zza.zzL.toString();
  private static final String zzaxp = zzb.zzbl.toString();
  private static final String zzayb = zzb.zzcV.toString();
  private final zza zzayc;

  public zzs(zza paramzza)
  {
    super(str, arrayOfString);
    this.zzayc = paramzza;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str = zzde.zzg((zzd.zza)paramMap.get(zzayb));
    HashMap localHashMap = new HashMap();
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzaxp);
    if (localzza1 != null)
    {
      Object localObject = zzde.zzl(localzza1);
      if (!(localObject instanceof Map))
      {
        zzbf.zzac("FunctionCallMacro: expected ADDITIONAL_PARAMS to be a map.");
        return zzde.zzuf();
      }
      Iterator localIterator = ((Map)localObject).entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localHashMap.put(localEntry.getKey().toString(), localEntry.getValue());
      }
    }
    try
    {
      zzd.zza localzza2 = zzde.zzx(this.zzayc.zzc(str, localHashMap));
      return localzza2;
    }
    catch (Exception localException)
    {
      zzbf.zzac("Custom macro/tag " + str + " threw exception " + localException.getMessage());
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return false;
  }

  public static abstract interface zza
  {
    public abstract Object zzc(String paramString, Map<String, Object> paramMap);
  }
}