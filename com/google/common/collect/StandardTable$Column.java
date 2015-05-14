package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$Column extends Maps.ImprovedAbstractMap<R, V>
{
  final C columnKey;

  StandardTable$Column(C paramC)
  {
    Object localObject;
    this.columnKey = Preconditions.checkNotNull(localObject);
  }

  public boolean containsKey(Object paramObject)
  {
    return this.this$0.contains(paramObject, this.columnKey);
  }

  Set<Map.Entry<R, V>> createEntrySet()
  {
    return new EntrySet(null);
  }

  Set<R> createKeySet()
  {
    return new KeySet();
  }

  Collection<V> createValues()
  {
    return new Values();
  }

  public V get(Object paramObject)
  {
    return this.this$0.get(paramObject, this.columnKey);
  }

  public V put(R paramR, V paramV)
  {
    return this.this$0.put(paramR, this.columnKey, paramV);
  }

  public V remove(Object paramObject)
  {
    return this.this$0.remove(paramObject, this.columnKey);
  }

  boolean removeFromColumnIf(Predicate<? super Map.Entry<R, V>> paramPredicate)
  {
    boolean bool = false;
    Iterator localIterator = this.this$0.backingMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Map localMap = (Map)localEntry.getValue();
      Object localObject = localMap.get(this.columnKey);
      if ((localObject != null) && (paramPredicate.apply(Maps.immutableEntry(localEntry.getKey(), localObject))))
      {
        localMap.remove(this.columnKey);
        bool = true;
        if (localMap.isEmpty())
          localIterator.remove();
      }
    }
    return bool;
  }

  private class EntrySet extends Sets.ImprovedAbstractSet<Map.Entry<R, V>>
  {
    private EntrySet()
    {
    }

    public void clear()
    {
      StandardTable.Column.this.removeFromColumnIf(Predicates.alwaysTrue());
    }

    public boolean contains(Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        return StandardTable.access$400(StandardTable.Column.this.this$0, localEntry.getKey(), StandardTable.Column.this.columnKey, localEntry.getValue());
      }
      return false;
    }

    public boolean isEmpty()
    {
      return !StandardTable.Column.this.this$0.containsColumn(StandardTable.Column.this.columnKey);
    }

    public Iterator<Map.Entry<R, V>> iterator()
    {
      return new StandardTable.Column.EntrySetIterator(StandardTable.Column.this, null);
    }

    public boolean remove(Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        return StandardTable.access$500(StandardTable.Column.this.this$0, localEntry.getKey(), StandardTable.Column.this.columnKey, localEntry.getValue());
      }
      return false;
    }

    public boolean retainAll(Collection<?> paramCollection)
    {
      return StandardTable.Column.this.removeFromColumnIf(Predicates.not(Predicates.in(paramCollection)));
    }

    public int size()
    {
      int i = 0;
      Iterator localIterator = StandardTable.Column.this.this$0.backingMap.values().iterator();
      while (localIterator.hasNext())
        if (((Map)localIterator.next()).containsKey(StandardTable.Column.this.columnKey))
          i++;
      return i;
    }
  }

  private class EntrySetIterator extends AbstractIterator<Map.Entry<R, V>>
  {
    final Iterator<Map.Entry<R, Map<C, V>>> iterator = StandardTable.Column.this.this$0.backingMap.entrySet().iterator();

    private EntrySetIterator()
    {
    }

    protected Map.Entry<R, V> computeNext()
    {
      while (this.iterator.hasNext())
      {
        final Map.Entry localEntry = (Map.Entry)this.iterator.next();
        if (((Map)localEntry.getValue()).containsKey(StandardTable.Column.this.columnKey))
          return new AbstractMapEntry()
          {
            public R getKey()
            {
              return localEntry.getKey();
            }

            public V getValue()
            {
              return ((Map)localEntry.getValue()).get(StandardTable.Column.this.columnKey);
            }

            public V setValue(V paramAnonymousV)
            {
              return ((Map)localEntry.getValue()).put(StandardTable.Column.this.columnKey, Preconditions.checkNotNull(paramAnonymousV));
            }
          };
      }
      return (Map.Entry)endOfData();
    }
  }

  private class KeySet extends Maps.KeySet<R, V>
  {
    KeySet()
    {
      super();
    }

    public boolean contains(Object paramObject)
    {
      return StandardTable.Column.this.this$0.contains(paramObject, StandardTable.Column.this.columnKey);
    }

    public boolean remove(Object paramObject)
    {
      return StandardTable.Column.this.this$0.remove(paramObject, StandardTable.Column.this.columnKey) != null;
    }

    public boolean retainAll(Collection<?> paramCollection)
    {
      return StandardTable.Column.this.removeFromColumnIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
    }
  }

  private class Values extends Maps.Values<R, V>
  {
    Values()
    {
      super();
    }

    public boolean remove(Object paramObject)
    {
      return (paramObject != null) && (StandardTable.Column.this.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.equalTo(paramObject))));
    }

    public boolean removeAll(Collection<?> paramCollection)
    {
      return StandardTable.Column.this.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.in(paramCollection)));
    }

    public boolean retainAll(Collection<?> paramCollection)
    {
      return StandardTable.Column.this.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
    }
  }
}