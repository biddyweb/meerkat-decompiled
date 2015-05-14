package com.google.common.collect;

import java.util.Map;

abstract class StandardTable$TableSet<T> extends Sets.ImprovedAbstractSet<T>
{
  private StandardTable$TableSet(StandardTable paramStandardTable)
  {
  }

  public void clear()
  {
    this.this$0.backingMap.clear();
  }

  public boolean isEmpty()
  {
    return this.this$0.backingMap.isEmpty();
  }
}