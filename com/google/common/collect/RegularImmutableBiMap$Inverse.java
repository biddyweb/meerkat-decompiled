package com.google.common.collect;

import java.util.Map.Entry;
import javax.annotation.Nullable;

final class RegularImmutableBiMap$Inverse extends ImmutableBiMap<V, K>
{
  private RegularImmutableBiMap$Inverse(RegularImmutableBiMap paramRegularImmutableBiMap)
  {
  }

  ImmutableSet<Map.Entry<V, K>> createEntrySet()
  {
    return new InverseEntrySet();
  }

  public K get(@Nullable Object paramObject)
  {
    if (paramObject == null);
    while (true)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode()) & RegularImmutableBiMap.access$300(this.this$0);
      for (ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$400(this.this$0)[i]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInValueBucket())
        if (paramObject.equals(localImmutableMapEntry.getValue()))
          return localImmutableMapEntry.getKey();
    }
  }

  public ImmutableBiMap<K, V> inverse()
  {
    return this.this$0;
  }

  boolean isPartialView()
  {
    return false;
  }

  public int size()
  {
    return inverse().size();
  }

  Object writeReplace()
  {
    return new RegularImmutableBiMap.InverseSerializedForm(this.this$0);
  }

  final class InverseEntrySet extends ImmutableMapEntrySet<V, K>
  {
    InverseEntrySet()
    {
    }

    ImmutableList<Map.Entry<V, K>> createAsList()
    {
      return new ImmutableAsList()
      {
        ImmutableCollection<Map.Entry<V, K>> delegateCollection()
        {
          return RegularImmutableBiMap.Inverse.InverseEntrySet.this;
        }

        public Map.Entry<V, K> get(int paramAnonymousInt)
        {
          ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$000(RegularImmutableBiMap.Inverse.this.this$0)[paramAnonymousInt];
          return Maps.immutableEntry(localImmutableMapEntry.getValue(), localImmutableMapEntry.getKey());
        }
      };
    }

    public int hashCode()
    {
      return RegularImmutableBiMap.access$100(RegularImmutableBiMap.Inverse.this.this$0);
    }

    boolean isHashCodeFast()
    {
      return true;
    }

    public UnmodifiableIterator<Map.Entry<V, K>> iterator()
    {
      return asList().iterator();
    }

    ImmutableMap<V, K> map()
    {
      return RegularImmutableBiMap.Inverse.this;
    }
  }
}