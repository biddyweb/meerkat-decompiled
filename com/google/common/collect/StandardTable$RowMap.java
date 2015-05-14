package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$RowMap extends Maps.ImprovedAbstractMap<R, Map<C, V>>
{
  StandardTable$RowMap(StandardTable paramStandardTable)
  {
  }

  public boolean containsKey(Object paramObject)
  {
    return this.this$0.containsRow(paramObject);
  }

  protected Set<Map.Entry<R, Map<C, V>>> createEntrySet()
  {
    return new EntrySet();
  }

  public Map<C, V> get(Object paramObject)
  {
    if (this.this$0.containsRow(paramObject))
      return this.this$0.row(paramObject);
    return null;
  }

  public Map<C, V> remove(Object paramObject)
  {
    if (paramObject == null)
      return null;
    return (Map)this.this$0.backingMap.remove(paramObject);
  }

  class EntrySet extends StandardTable<R, C, V>.TableSet<Map.Entry<R, Map<C, V>>>
  {
    EntrySet()
    {
      super(null);
    }

    public boolean contains(Object paramObject)
    {
      boolean bool1 = paramObject instanceof Map.Entry;
      boolean bool2 = false;
      if (bool1)
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        Object localObject = localEntry.getKey();
        bool2 = false;
        if (localObject != null)
        {
          boolean bool3 = localEntry.getValue() instanceof Map;
          bool2 = false;
          if (bool3)
          {
            boolean bool4 = Collections2.safeContains(StandardTable.RowMap.this.this$0.backingMap.entrySet(), localEntry);
            bool2 = false;
            if (bool4)
              bool2 = true;
          }
        }
      }
      return bool2;
    }

    public Iterator<Map.Entry<R, Map<C, V>>> iterator()
    {
      return Maps.asMapEntryIterator(StandardTable.RowMap.this.this$0.backingMap.keySet(), new Function()
      {
        public Map<C, V> apply(R paramAnonymousR)
        {
          return StandardTable.RowMap.this.this$0.row(paramAnonymousR);
        }
      });
    }

    public boolean remove(Object paramObject)
    {
      boolean bool1 = paramObject instanceof Map.Entry;
      boolean bool2 = false;
      if (bool1)
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        Object localObject = localEntry.getKey();
        bool2 = false;
        if (localObject != null)
        {
          boolean bool3 = localEntry.getValue() instanceof Map;
          bool2 = false;
          if (bool3)
          {
            boolean bool4 = StandardTable.RowMap.this.this$0.backingMap.entrySet().remove(localEntry);
            bool2 = false;
            if (bool4)
              bool2 = true;
          }
        }
      }
      return bool2;
    }

    public int size()
    {
      return StandardTable.RowMap.this.this$0.backingMap.size();
    }
  }
}