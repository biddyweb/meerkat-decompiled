package com.nostra13.universalimageloader.cache.memory;

import java.util.Collection;

@Deprecated
public abstract interface MemoryCacheAware<K, V>
{
  public abstract void clear();

  public abstract V get(K paramK);

  public abstract Collection<K> keys();

  public abstract boolean put(K paramK, V paramV);

  public abstract V remove(K paramK);
}