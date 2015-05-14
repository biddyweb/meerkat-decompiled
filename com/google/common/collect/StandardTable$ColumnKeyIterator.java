package com.google.common.collect;

import com.google.common.base.Supplier;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$ColumnKeyIterator extends AbstractIterator<C>
{
  Iterator<Map.Entry<C, V>> entryIterator = Iterators.emptyIterator();
  final Iterator<Map<C, V>> mapIterator = this.this$0.backingMap.values().iterator();
  final Map<C, V> seen = (Map)this.this$0.factory.get();

  private StandardTable$ColumnKeyIterator(StandardTable paramStandardTable)
  {
  }

  protected C computeNext()
  {
    while (true)
      if (this.entryIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)this.entryIterator.next();
        if (!this.seen.containsKey(localEntry.getKey()))
        {
          this.seen.put(localEntry.getKey(), localEntry.getValue());
          return localEntry.getKey();
        }
      }
      else
      {
        if (!this.mapIterator.hasNext())
          break;
        this.entryIterator = ((Map)this.mapIterator.next()).entrySet().iterator();
      }
    return endOfData();
  }
}