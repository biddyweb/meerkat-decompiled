package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$Row extends Maps.ImprovedAbstractMap<C, V>
{
  Map<C, V> backingRowMap;
  final R rowKey;

  StandardTable$Row(R paramR)
  {
    Object localObject;
    this.rowKey = Preconditions.checkNotNull(localObject);
  }

  Map<C, V> backingRowMap()
  {
    if ((this.backingRowMap == null) || ((this.backingRowMap.isEmpty()) && (this.this$0.backingMap.containsKey(this.rowKey))))
    {
      Map localMap = computeBackingRowMap();
      this.backingRowMap = localMap;
      return localMap;
    }
    return this.backingRowMap;
  }

  public void clear()
  {
    Map localMap = backingRowMap();
    if (localMap != null)
      localMap.clear();
    maintainEmptyInvariant();
  }

  Map<C, V> computeBackingRowMap()
  {
    return (Map)this.this$0.backingMap.get(this.rowKey);
  }

  public boolean containsKey(Object paramObject)
  {
    Map localMap = backingRowMap();
    return (paramObject != null) && (localMap != null) && (Maps.safeContainsKey(localMap, paramObject));
  }

  protected Set<Map.Entry<C, V>> createEntrySet()
  {
    return new RowEntrySet(null);
  }

  public V get(Object paramObject)
  {
    Map localMap = backingRowMap();
    if ((paramObject != null) && (localMap != null))
      return Maps.safeGet(localMap, paramObject);
    return null;
  }

  void maintainEmptyInvariant()
  {
    if ((backingRowMap() != null) && (this.backingRowMap.isEmpty()))
    {
      this.this$0.backingMap.remove(this.rowKey);
      this.backingRowMap = null;
    }
  }

  public V put(C paramC, V paramV)
  {
    Preconditions.checkNotNull(paramC);
    Preconditions.checkNotNull(paramV);
    if ((this.backingRowMap != null) && (!this.backingRowMap.isEmpty()))
      return this.backingRowMap.put(paramC, paramV);
    return this.this$0.put(this.rowKey, paramC, paramV);
  }

  public V remove(Object paramObject)
  {
    Map localMap = backingRowMap();
    if (localMap == null)
      return null;
    Object localObject = Maps.safeRemove(localMap, paramObject);
    maintainEmptyInvariant();
    return localObject;
  }

  private final class RowEntrySet extends Maps.EntrySet<C, V>
  {
    private RowEntrySet()
    {
    }

    public Iterator<Map.Entry<C, V>> iterator()
    {
      Map localMap = StandardTable.Row.this.backingRowMap();
      if (localMap == null)
        return Iterators.emptyModifiableIterator();
      return new Iterator()
      {
        public boolean hasNext()
        {
          return this.val$iterator.hasNext();
        }

        public Map.Entry<C, V> next()
        {
          return new ForwardingMapEntry()
          {
            protected Map.Entry<C, V> delegate()
            {
              return this.val$entry;
            }

            public boolean equals(Object paramAnonymous2Object)
            {
              return standardEquals(paramAnonymous2Object);
            }

            public V setValue(V paramAnonymous2V)
            {
              return super.setValue(Preconditions.checkNotNull(paramAnonymous2V));
            }
          };
        }

        public void remove()
        {
          this.val$iterator.remove();
          StandardTable.Row.this.maintainEmptyInvariant();
        }
      };
    }

    Map<C, V> map()
    {
      return StandardTable.Row.this;
    }

    public int size()
    {
      Map localMap = StandardTable.Row.this.backingRowMap();
      if (localMap == null)
        return 0;
      return localMap.size();
    }
  }
}