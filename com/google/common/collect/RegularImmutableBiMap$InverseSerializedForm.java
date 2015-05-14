package com.google.common.collect;

import java.io.Serializable;

class RegularImmutableBiMap$InverseSerializedForm<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private final ImmutableBiMap<K, V> forward;

  RegularImmutableBiMap$InverseSerializedForm(ImmutableBiMap<K, V> paramImmutableBiMap)
  {
    this.forward = paramImmutableBiMap;
  }

  Object readResolve()
  {
    return this.forward.inverse();
  }
}