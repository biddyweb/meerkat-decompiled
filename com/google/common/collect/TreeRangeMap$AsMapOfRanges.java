package com.google.common.collect;

import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;
import javax.annotation.Nullable;

final class TreeRangeMap$AsMapOfRanges extends AbstractMap<Range<K>, V>
{
  private TreeRangeMap$AsMapOfRanges(TreeRangeMap paramTreeRangeMap)
  {
  }

  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }

  public Set<Map.Entry<Range<K>, V>> entrySet()
  {
    return new AbstractSet()
    {
      public Iterator<Map.Entry<Range<K>, V>> iterator()
      {
        return TreeRangeMap.access$100(TreeRangeMap.AsMapOfRanges.this.this$0).values().iterator();
      }

      public int size()
      {
        return TreeRangeMap.access$100(TreeRangeMap.AsMapOfRanges.this.this$0).size();
      }
    };
  }

  public V get(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Range))
    {
      Range localRange = (Range)paramObject;
      TreeRangeMap.RangeMapEntry localRangeMapEntry = (TreeRangeMap.RangeMapEntry)TreeRangeMap.access$100(this.this$0).get(localRange.lowerBound);
      if ((localRangeMapEntry != null) && (localRangeMapEntry.getKey().equals(localRange)))
        return localRangeMapEntry.getValue();
    }
    return null;
  }
}