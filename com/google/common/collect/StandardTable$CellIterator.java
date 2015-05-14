package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$CellIterator
  implements Iterator<Table.Cell<R, C, V>>
{
  Iterator<Map.Entry<C, V>> columnIterator = Iterators.emptyModifiableIterator();
  Map.Entry<R, Map<C, V>> rowEntry;
  final Iterator<Map.Entry<R, Map<C, V>>> rowIterator = this.this$0.backingMap.entrySet().iterator();

  private StandardTable$CellIterator(StandardTable paramStandardTable)
  {
  }

  public boolean hasNext()
  {
    return (this.rowIterator.hasNext()) || (this.columnIterator.hasNext());
  }

  public Table.Cell<R, C, V> next()
  {
    if (!this.columnIterator.hasNext())
    {
      this.rowEntry = ((Map.Entry)this.rowIterator.next());
      this.columnIterator = ((Map)this.rowEntry.getValue()).entrySet().iterator();
    }
    Map.Entry localEntry = (Map.Entry)this.columnIterator.next();
    return Tables.immutableCell(this.rowEntry.getKey(), localEntry.getKey(), localEntry.getValue());
  }

  public void remove()
  {
    this.columnIterator.remove();
    if (((Map)this.rowEntry.getValue()).isEmpty())
      this.rowIterator.remove();
  }
}