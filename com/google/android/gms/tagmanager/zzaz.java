package com.google.android.gms.tagmanager;

import android.util.LruCache;

class zzaz<K, V>
  implements zzk<K, V>
{
  private LruCache<K, V> zzazc;

  zzaz(int paramInt, final zzl.zza<K, V> paramzza)
  {
    this.zzazc = new LruCache(paramInt)
    {
      protected int sizeOf(K paramAnonymousK, V paramAnonymousV)
      {
        return paramzza.sizeOf(paramAnonymousK, paramAnonymousV);
      }
    };
  }

  public V get(K paramK)
  {
    return this.zzazc.get(paramK);
  }

  public void zze(K paramK, V paramV)
  {
    this.zzazc.put(paramK, paramV);
  }
}