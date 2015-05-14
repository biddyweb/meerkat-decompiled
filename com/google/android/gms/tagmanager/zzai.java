package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzc.zzc;
import com.google.android.gms.internal.zzc.zzd;
import com.google.android.gms.internal.zzc.zzi;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzai
{
  private static void zza(DataLayer paramDataLayer, zzc.zzd paramzzd)
  {
    zzd.zza[] arrayOfzza = paramzzd.zzfB;
    int i = arrayOfzza.length;
    for (int j = 0; j < i; j++)
      paramDataLayer.zzcU(zzde.zzg(arrayOfzza[j]));
  }

  public static void zza(DataLayer paramDataLayer, zzc.zzi paramzzi)
  {
    if (paramzzi.zzgq == null)
    {
      zzbf.zzac("supplemental missing experimentSupplemental");
      return;
    }
    zza(paramDataLayer, paramzzi.zzgq);
    zzb(paramDataLayer, paramzzi.zzgq);
    zzc(paramDataLayer, paramzzi.zzgq);
  }

  private static void zzb(DataLayer paramDataLayer, zzc.zzd paramzzd)
  {
    zzd.zza[] arrayOfzza = paramzzd.zzfA;
    int i = arrayOfzza.length;
    for (int j = 0; j < i; j++)
    {
      Map localMap = zzc(arrayOfzza[j]);
      if (localMap != null)
        paramDataLayer.push(localMap);
    }
  }

  private static Map<String, Object> zzc(zzd.zza paramzza)
  {
    Object localObject = zzde.zzl(paramzza);
    if (!(localObject instanceof Map))
    {
      zzbf.zzac("value: " + localObject + " is not a map value, ignored.");
      return null;
    }
    return (Map)localObject;
  }

  private static void zzc(DataLayer paramDataLayer, zzc.zzd paramzzd)
  {
    zzc.zzc[] arrayOfzzc = paramzzd.zzfC;
    int i = arrayOfzzc.length;
    int j = 0;
    while (j < i)
    {
      zzc.zzc localzzc = arrayOfzzc[j];
      if (localzzc.zzfv == null)
      {
        zzbf.zzac("GaExperimentRandom: No key");
        j++;
      }
      else
      {
        Object localObject1 = paramDataLayer.get(localzzc.zzfv);
        Long localLong;
        label64: Map localMap;
        if (!(localObject1 instanceof Number))
        {
          localLong = null;
          long l1 = localzzc.zzfw;
          long l2 = localzzc.zzfx;
          if ((!localzzc.zzfy) || (localLong == null) || (localLong.longValue() < l1) || (localLong.longValue() > l2))
          {
            if (l1 > l2)
              break label251;
            localObject1 = Long.valueOf(Math.round(Math.random() * (l2 - l1) + l1));
          }
          paramDataLayer.zzcU(localzzc.zzfv);
          localMap = paramDataLayer.zzc(localzzc.zzfv, localObject1);
          if (localzzc.zzfz > 0L)
          {
            if (localMap.containsKey("gtm"))
              break label259;
            Object[] arrayOfObject = new Object[2];
            arrayOfObject[0] = "lifetime";
            arrayOfObject[1] = Long.valueOf(localzzc.zzfz);
            localMap.put("gtm", DataLayer.mapOf(arrayOfObject));
          }
        }
        while (true)
        {
          paramDataLayer.push(localMap);
          break;
          localLong = Long.valueOf(((Number)localObject1).longValue());
          break label64;
          label251: zzbf.zzac("GaExperimentRandom: random range invalid");
          break;
          label259: Object localObject2 = localMap.get("gtm");
          if ((localObject2 instanceof Map))
            ((Map)localObject2).put("lifetime", Long.valueOf(localzzc.zzfz));
          else
            zzbf.zzac("GaExperimentRandom: gtm not a map");
        }
      }
    }
  }
}