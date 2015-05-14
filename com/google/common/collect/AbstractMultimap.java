package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
abstract class AbstractMultimap<K, V>
  implements Multimap<K, V>
{
  private transient Map<K, Collection<V>> asMap;
  private transient Collection<Map.Entry<K, V>> entries;
  private transient Set<K> keySet;
  private transient Multiset<K> keys;
  private transient Collection<V> values;

  public Map<K, Collection<V>> asMap()
  {
    Map localMap = this.asMap;
    if (localMap == null)
    {
      localMap = createAsMap();
      this.asMap = localMap;
    }
    return localMap;
  }

  public boolean containsEntry(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Collection localCollection = (Collection)asMap().get(paramObject1);
    return (localCollection != null) && (localCollection.contains(paramObject2));
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    Iterator localIterator = asMap().values().iterator();
    while (localIterator.hasNext())
      if (((Collection)localIterator.next()).contains(paramObject))
        return true;
    return false;
  }

  abstract Map<K, Collection<V>> createAsMap();

  Collection<Map.Entry<K, V>> createEntries()
  {
    if ((this instanceof SetMultimap))
      return new EntrySet(null);
    return new Entries(null);
  }

  Set<K> createKeySet()
  {
    return new Maps.KeySet(asMap());
  }

  Multiset<K> createKeys()
  {
    return new Multimaps.Keys(this);
  }

  Collection<V> createValues()
  {
    return new Values();
  }

  public Collection<Map.Entry<K, V>> entries()
  {
    Collection localCollection = this.entries;
    if (localCollection == null)
    {
      localCollection = createEntries();
      this.entries = localCollection;
    }
    return localCollection;
  }

  abstract Iterator<Map.Entry<K, V>> entryIterator();

  public boolean equals(@Nullable Object paramObject)
  {
    return Multimaps.equalsImpl(this, paramObject);
  }

  public int hashCode()
  {
    return asMap().hashCode();
  }

  public boolean isEmpty()
  {
    return size() == 0;
  }

  public Set<K> keySet()
  {
    Set localSet = this.keySet;
    if (localSet == null)
    {
      localSet = createKeySet();
      this.keySet = localSet;
    }
    return localSet;
  }

  public Multiset<K> keys()
  {
    Multiset localMultiset = this.keys;
    if (localMultiset == null)
    {
      localMultiset = createKeys();
      this.keys = localMultiset;
    }
    return localMultiset;
  }

  public boolean put(@Nullable K paramK, @Nullable V paramV)
  {
    return get(paramK).add(paramV);
  }

  public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    boolean bool = false;
    Iterator localIterator = paramMultimap.entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      bool |= put(localEntry.getKey(), localEntry.getValue());
    }
    return bool;
  }

  public boolean putAll(@Nullable K paramK, Iterable<? extends V> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    if ((paramIterable instanceof Collection))
    {
      Collection localCollection = (Collection)paramIterable;
      if ((localCollection.isEmpty()) || (!get(paramK).addAll(localCollection)));
    }
    Iterator localIterator;
    do
    {
      return true;
      return false;
      localIterator = paramIterable.iterator();
    }
    while ((localIterator.hasNext()) && (Iterators.addAll(get(paramK), localIterator)));
    return false;
  }

  public boolean remove(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Collection localCollection = (Collection)asMap().get(paramObject1);
    return (localCollection != null) && (localCollection.remove(paramObject2));
  }

  public Collection<V> replaceValues(@Nullable K paramK, Iterable<? extends V> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    Collection localCollection = removeAll(paramK);
    putAll(paramK, paramIterable);
    return localCollection;
  }

  public String toString()
  {
    return asMap().toString();
  }

  Iterator<V> valueIterator()
  {
    return Maps.valueIterator(entries().iterator());
  }

  public Collection<V> values()
  {
    Collection localCollection = this.values;
    if (localCollection == null)
    {
      localCollection = createValues();
      this.values = localCollection;
    }
    return localCollection;
  }

  private class Entries extends Multimaps.Entries<K, V>
  {
    private Entries()
    {
    }

    public Iterator<Map.Entry<K, V>> iterator()
    {
      return AbstractMultimap.this.entryIterator();
    }

    Multimap<K, V> multimap()
    {
      return AbstractMultimap.this;
    }
  }

  private class EntrySet extends AbstractMultimap<K, V>.Entries
    implements Set<Map.Entry<K, V>>
  {
    private EntrySet()
    {
      super(null);
    }

    public boolean equals(@Nullable Object paramObject)
    {
      return Sets.equalsImpl(this, paramObject);
    }

    public int hashCode()
    {
      return Sets.hashCodeImpl(this);
    }
  }

  class Values extends AbstractCollection<V>
  {
    Values()
    {
    }

    public void clear()
    {
      AbstractMultimap.this.clear();
    }

    public boolean contains(@Nullable Object paramObject)
    {
      return AbstractMultimap.this.containsValue(paramObject);
    }

    public Iterator<V> iterator()
    {
      return AbstractMultimap.this.valueIterator();
    }

    public int size()
    {
      return AbstractMultimap.this.size();
    }
  }
}