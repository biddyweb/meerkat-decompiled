package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

class zzw extends zzdc
{
  private static final String ID = zza.zzah.toString();
  private static final String VALUE = zzb.zzff.toString();
  private static final String zzayx = zzb.zzbS.toString();
  private final DataLayer zzaxx;

  public zzw(DataLayer paramDataLayer)
  {
    super(str, arrayOfString);
    this.zzaxx = paramDataLayer;
  }

  private void zza(zzd.zza paramzza)
  {
    if ((paramzza == null) || (paramzza == zzde.zztZ()));
    String str;
    do
    {
      return;
      str = zzde.zzg(paramzza);
    }
    while (str == zzde.zzue());
    this.zzaxx.zzcU(str);
  }

  private void zzb(zzd.zza paramzza)
  {
    if ((paramzza == null) || (paramzza == zzde.zztZ()));
    while (true)
    {
      return;
      Object localObject1 = zzde.zzl(paramzza);
      if ((localObject1 instanceof List))
      {
        Iterator localIterator = ((List)localObject1).iterator();
        while (localIterator.hasNext())
        {
          Object localObject2 = localIterator.next();
          if ((localObject2 instanceof Map))
          {
            Map localMap = (Map)localObject2;
            this.zzaxx.push(localMap);
          }
        }
      }
    }
  }

  public void zzJ(Map<String, zzd.zza> paramMap)
  {
    zzb((zzd.zza)paramMap.get(VALUE));
    zza((zzd.zza)paramMap.get(zzayx));
  }
}