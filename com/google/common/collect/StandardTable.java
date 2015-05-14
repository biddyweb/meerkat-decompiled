package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
class StandardTable<R, C, V> extends AbstractTable<R, C, V>
  implements Serializable
{
  private static final long serialVersionUID;

  @GwtTransient
  final Map<R, Map<C, V>> backingMap;
  private transient Set<C> columnKeySet;
  private transient StandardTable<R, C, V>.ColumnMap columnMap;

  @GwtTransient
  final Supplier<? extends Map<C, V>> factory;
  private transient Map<R, Map<C, V>> rowMap;

  StandardTable(Map<R, Map<C, V>> paramMap, Supplier<? extends Map<C, V>> paramSupplier)
  {
    this.backingMap = paramMap;
    this.factory = paramSupplier;
  }

  private boolean containsMapping(Object paramObject1, Object paramObject2, Object paramObject3)
  {
    return (paramObject3 != null) && (paramObject3.equals(get(paramObject1, paramObject2)));
  }

  private Map<C, V> getOrCreate(R paramR)
  {
    Map localMap = (Map)this.backingMap.get(paramR);
    if (localMap == null)
    {
      localMap = (Map)this.factory.get();
      this.backingMap.put(paramR, localMap);
    }
    return localMap;
  }

  private Map<R, V> removeColumn(Object paramObject)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator = this.backingMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = ((Map)localEntry.getValue()).remove(paramObject);
      if (localObject != null)
      {
        localLinkedHashMap.put(localEntry.getKey(), localObject);
        if (((Map)localEntry.getValue()).isEmpty())
          localIterator.remove();
      }
    }
    return localLinkedHashMap;
  }

  private boolean removeMapping(Object paramObject1, Object paramObject2, Object paramObject3)
  {
    if (containsMapping(paramObject1, paramObject2, paramObject3))
    {
      remove(paramObject1, paramObject2);
      return true;
    }
    return false;
  }

  Iterator<Table.Cell<R, C, V>> cellIterator()
  {
    return new StandardTable.CellIterator(this, null);
  }

  public Set<Table.Cell<R, C, V>> cellSet()
  {
    return super.cellSet();
  }

  public void clear()
  {
    this.backingMap.clear();
  }

  public Map<R, V> column(C paramC)
  {
    return new StandardTable.Column(this, paramC);
  }

  public Set<C> columnKeySet()
  {
    Object localObject = this.columnKeySet;
    if (localObject == null)
    {
      localObject = new StandardTable.ColumnKeySet(this, null);
      this.columnKeySet = ((Set)localObject);
    }
    return localObject;
  }

  public Map<C, Map<R, V>> columnMap()
  {
    StandardTable.ColumnMap localColumnMap = this.columnMap;
    if (localColumnMap == null)
    {
      localColumnMap = new StandardTable.ColumnMap(this, null);
      this.columnMap = localColumnMap;
    }
    return localColumnMap;
  }

  public boolean contains(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return (paramObject1 != null) && (paramObject2 != null) && (super.contains(paramObject1, paramObject2));
  }

  public boolean containsColumn(@Nullable Object paramObject)
  {
    if (paramObject == null);
    Iterator localIterator;
    do
      while (!localIterator.hasNext())
      {
        return false;
        localIterator = this.backingMap.values().iterator();
      }
    while (!Maps.safeContainsKey((Map)localIterator.next(), paramObject));
    return true;
  }

  public boolean containsRow(@Nullable Object paramObject)
  {
    return (paramObject != null) && (Maps.safeContainsKey(this.backingMap, paramObject));
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    return (paramObject != null) && (super.containsValue(paramObject));
  }

  Iterator<C> createColumnKeyIterator()
  {
    return new StandardTable.ColumnKeyIterator(this, null);
  }

  Map<R, Map<C, V>> createRowMap()
  {
    return new StandardTable.RowMap(this);
  }

  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    if ((paramObject1 == null) || (paramObject2 == null))
      return null;
    return super.get(paramObject1, paramObject2);
  }

  public boolean isEmpty()
  {
    return this.backingMap.isEmpty();
  }

  public V put(R paramR, C paramC, V paramV)
  {
    Preconditions.checkNotNull(paramR);
    Preconditions.checkNotNull(paramC);
    Preconditions.checkNotNull(paramV);
    return getOrCreate(paramR).put(paramC, paramV);
  }

  public V remove(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Object localObject = null;
    if (paramObject1 != null)
    {
      localObject = null;
      if (paramObject2 != null)
        break label14;
    }
    label14: Map localMap;
    do
    {
      do
      {
        return localObject;
        localMap = (Map)Maps.safeGet(this.backingMap, paramObject1);
        localObject = null;
      }
      while (localMap == null);
      localObject = localMap.remove(paramObject2);
    }
    while (!localMap.isEmpty());
    this.backingMap.remove(paramObject1);
    return localObject;
  }

  public Map<C, V> row(R paramR)
  {
    return new StandardTable.Row(this, paramR);
  }

  public Set<R> rowKeySet()
  {
    return rowMap().keySet();
  }

  public Map<R, Map<C, V>> rowMap()
  {
    Map localMap = this.rowMap;
    if (localMap == null)
    {
      localMap = createRowMap();
      this.rowMap = localMap;
    }
    return localMap;
  }

  public int size()
  {
    int i = 0;
    Iterator localIterator = this.backingMap.values().iterator();
    while (localIterator.hasNext())
      i += ((Map)localIterator.next()).size();
    return i;
  }

  public Collection<V> values()
  {
    return super.values();
  }
}