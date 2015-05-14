package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class StandardTable$ColumnKeySet extends StandardTable<R, C, V>.TableSet<C>
{
  private StandardTable$ColumnKeySet(StandardTable paramStandardTable)
  {
    super(paramStandardTable, null);
  }

  public boolean contains(Object paramObject)
  {
    return this.this$0.containsColumn(paramObject);
  }

  public Iterator<C> iterator()
  {
    return this.this$0.createColumnKeyIterator();
  }

  public boolean remove(Object paramObject)
  {
    boolean bool;
    if (paramObject == null)
      bool = false;
    while (true)
    {
      return bool;
      bool = false;
      Iterator localIterator = this.this$0.backingMap.values().iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        if (localMap.keySet().remove(paramObject))
        {
          bool = true;
          if (localMap.isEmpty())
            localIterator.remove();
        }
      }
    }
  }

  public boolean removeAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool = false;
    Iterator localIterator = this.this$0.backingMap.values().iterator();
    while (localIterator.hasNext())
    {
      Map localMap = (Map)localIterator.next();
      if (Iterators.removeAll(localMap.keySet().iterator(), paramCollection))
      {
        bool = true;
        if (localMap.isEmpty())
          localIterator.remove();
      }
    }
    return bool;
  }

  public boolean retainAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool = false;
    Iterator localIterator = this.this$0.backingMap.values().iterator();
    while (localIterator.hasNext())
    {
      Map localMap = (Map)localIterator.next();
      if (localMap.keySet().retainAll(paramCollection))
      {
        bool = true;
        if (localMap.isEmpty())
          localIterator.remove();
      }
    }
    return bool;
  }

  public int size()
  {
    return Iterators.size(iterator());
  }
}