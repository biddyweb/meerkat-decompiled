package com.google.common.reflect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.ForwardingMapEntry;
import com.google.common.collect.ForwardingSet;
import com.google.common.collect.Iterators;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

final class MutableTypeToInstanceMap$UnmodifiableEntry<K, V> extends ForwardingMapEntry<K, V>
{
  private final Map.Entry<K, V> delegate;

  private MutableTypeToInstanceMap$UnmodifiableEntry(Map.Entry<K, V> paramEntry)
  {
    this.delegate = ((Map.Entry)Preconditions.checkNotNull(paramEntry));
  }

  private static <K, V> Iterator<Map.Entry<K, V>> transformEntries(Iterator<Map.Entry<K, V>> paramIterator)
  {
    return Iterators.transform(paramIterator, new Function()
    {
      public Map.Entry<K, V> apply(Map.Entry<K, V> paramAnonymousEntry)
      {
        return new MutableTypeToInstanceMap.UnmodifiableEntry(paramAnonymousEntry, null);
      }
    });
  }

  static <K, V> Set<Map.Entry<K, V>> transformEntries(Set<Map.Entry<K, V>> paramSet)
  {
    return new ForwardingSet()
    {
      protected Set<Map.Entry<K, V>> delegate()
      {
        return this.val$entries;
      }

      public Iterator<Map.Entry<K, V>> iterator()
      {
        return MutableTypeToInstanceMap.UnmodifiableEntry.transformEntries(super.iterator());
      }

      public Object[] toArray()
      {
        return standardToArray();
      }

      public <T> T[] toArray(T[] paramAnonymousArrayOfT)
      {
        return standardToArray(paramAnonymousArrayOfT);
      }
    };
  }

  protected Map.Entry<K, V> delegate()
  {
    return this.delegate;
  }

  public V setValue(V paramV)
  {
    throw new UnsupportedOperationException();
  }
}