package com.google.android.gms.tagmanager;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzcv<K, V>
  implements zzk<K, V>
{
  private final Map<K, V> zzaAI = new HashMap();
  private final int zzaAJ;
  private final zzl.zza<K, V> zzaAK;
  private int zzaAL;

  zzcv(int paramInt, zzl.zza<K, V> paramzza)
  {
    this.zzaAJ = paramInt;
    this.zzaAK = paramzza;
  }

  public V get(K paramK)
  {
    try
    {
      Object localObject2 = this.zzaAI.get(paramK);
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public void zze(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null))
      try
      {
        throw new NullPointerException("key == null || value == null");
      }
      finally
      {
      }
    this.zzaAL += this.zzaAK.sizeOf(paramK, paramV);
    if (this.zzaAL > this.zzaAJ)
    {
      Iterator localIterator = this.zzaAI.entrySet().iterator();
      do
      {
        if (!localIterator.hasNext())
          break;
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        this.zzaAL -= this.zzaAK.sizeOf(localEntry.getKey(), localEntry.getValue());
        localIterator.remove();
      }
      while (this.zzaAL > this.zzaAJ);
    }
    this.zzaAI.put(paramK, paramV);
  }
}