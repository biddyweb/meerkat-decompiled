package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.AbstractCollection;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
abstract class AbstractTable<R, C, V>
  implements Table<R, C, V>
{
  private transient Set<Table.Cell<R, C, V>> cellSet;
  private transient Collection<V> values;

  abstract Iterator<Table.Cell<R, C, V>> cellIterator();

  public Set<Table.Cell<R, C, V>> cellSet()
  {
    Set localSet = this.cellSet;
    if (localSet == null)
    {
      localSet = createCellSet();
      this.cellSet = localSet;
    }
    return localSet;
  }

  public void clear()
  {
    Iterators.clear(cellSet().iterator());
  }

  public Set<C> columnKeySet()
  {
    return columnMap().keySet();
  }

  public boolean contains(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Map localMap = (Map)Maps.safeGet(rowMap(), paramObject1);
    return (localMap != null) && (Maps.safeContainsKey(localMap, paramObject2));
  }

  public boolean containsColumn(@Nullable Object paramObject)
  {
    return Maps.safeContainsKey(columnMap(), paramObject);
  }

  public boolean containsRow(@Nullable Object paramObject)
  {
    return Maps.safeContainsKey(rowMap(), paramObject);
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    Iterator localIterator = rowMap().values().iterator();
    while (localIterator.hasNext())
      if (((Map)localIterator.next()).containsValue(paramObject))
        return true;
    return false;
  }

  Set<Table.Cell<R, C, V>> createCellSet()
  {
    return new CellSet();
  }

  Collection<V> createValues()
  {
    return new Values();
  }

  public boolean equals(@Nullable Object paramObject)
  {
    return Tables.equalsImpl(this, paramObject);
  }

  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Map localMap = (Map)Maps.safeGet(rowMap(), paramObject1);
    if (localMap == null)
      return null;
    return Maps.safeGet(localMap, paramObject2);
  }

  public int hashCode()
  {
    return cellSet().hashCode();
  }

  public boolean isEmpty()
  {
    return size() == 0;
  }

  public V put(R paramR, C paramC, V paramV)
  {
    return row(paramR).put(paramC, paramV);
  }

  public void putAll(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    Iterator localIterator = paramTable.cellSet().iterator();
    while (localIterator.hasNext())
    {
      Table.Cell localCell = (Table.Cell)localIterator.next();
      put(localCell.getRowKey(), localCell.getColumnKey(), localCell.getValue());
    }
  }

  public V remove(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Map localMap = (Map)Maps.safeGet(rowMap(), paramObject1);
    if (localMap == null)
      return null;
    return Maps.safeRemove(localMap, paramObject2);
  }

  public Set<R> rowKeySet()
  {
    return rowMap().keySet();
  }

  public String toString()
  {
    return rowMap().toString();
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

  Iterator<V> valuesIterator()
  {
    return new TransformedIterator(cellSet().iterator())
    {
      V transform(Table.Cell<R, C, V> paramAnonymousCell)
      {
        return paramAnonymousCell.getValue();
      }
    };
  }

  class CellSet extends AbstractSet<Table.Cell<R, C, V>>
  {
    CellSet()
    {
    }

    public void clear()
    {
      AbstractTable.this.clear();
    }

    public boolean contains(Object paramObject)
    {
      boolean bool1 = paramObject instanceof Table.Cell;
      boolean bool2 = false;
      if (bool1)
      {
        Table.Cell localCell = (Table.Cell)paramObject;
        Map localMap = (Map)Maps.safeGet(AbstractTable.this.rowMap(), localCell.getRowKey());
        bool2 = false;
        if (localMap != null)
        {
          boolean bool3 = Collections2.safeContains(localMap.entrySet(), Maps.immutableEntry(localCell.getColumnKey(), localCell.getValue()));
          bool2 = false;
          if (bool3)
            bool2 = true;
        }
      }
      return bool2;
    }

    public Iterator<Table.Cell<R, C, V>> iterator()
    {
      return AbstractTable.this.cellIterator();
    }

    public boolean remove(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof Table.Cell;
      boolean bool2 = false;
      if (bool1)
      {
        Table.Cell localCell = (Table.Cell)paramObject;
        Map localMap = (Map)Maps.safeGet(AbstractTable.this.rowMap(), localCell.getRowKey());
        bool2 = false;
        if (localMap != null)
        {
          boolean bool3 = Collections2.safeRemove(localMap.entrySet(), Maps.immutableEntry(localCell.getColumnKey(), localCell.getValue()));
          bool2 = false;
          if (bool3)
            bool2 = true;
        }
      }
      return bool2;
    }

    public int size()
    {
      return AbstractTable.this.size();
    }
  }

  class Values extends AbstractCollection<V>
  {
    Values()
    {
    }

    public void clear()
    {
      AbstractTable.this.clear();
    }

    public boolean contains(Object paramObject)
    {
      return AbstractTable.this.containsValue(paramObject);
    }

    public Iterator<V> iterator()
    {
      return AbstractTable.this.valuesIterator();
    }

    public int size()
    {
      return AbstractTable.this.size();
    }
  }
}