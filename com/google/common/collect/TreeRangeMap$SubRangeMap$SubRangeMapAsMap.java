package com.google.common.collect;

import com.google.common.base.MoreObjects;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;
import javax.annotation.Nullable;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap extends AbstractMap<Range<K>, V>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap(TreeRangeMap.SubRangeMap paramSubRangeMap)
  {
  }

  private boolean removeEntryIf(Predicate<? super Map.Entry<Range<K>, V>> paramPredicate)
  {
    ArrayList localArrayList = Lists.newArrayList();
    Iterator localIterator1 = entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator1.next();
      if (paramPredicate.apply(localEntry))
        localArrayList.add(localEntry.getKey());
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      Range localRange = (Range)localIterator2.next();
      this.this$1.this$0.remove(localRange);
    }
    return !localArrayList.isEmpty();
  }

  public void clear()
  {
    this.this$1.clear();
  }

  public boolean containsKey(Object paramObject)
  {
    return get(paramObject) != null;
  }

  public Set<Map.Entry<Range<K>, V>> entrySet()
  {
    return new Maps.EntrySet()
    {
      public boolean isEmpty()
      {
        return !iterator().hasNext();
      }

      public Iterator<Map.Entry<Range<K>, V>> iterator()
      {
        if (TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1).isEmpty())
          return Iterators.emptyIterator();
        Cut localCut = (Cut)MoreObjects.firstNonNull(TreeRangeMap.access$100(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1.this$0).floorKey(TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1).lowerBound), TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1).lowerBound);
        return new AbstractIterator()
        {
          protected Map.Entry<Range<K>, V> computeNext()
          {
            TreeRangeMap.RangeMapEntry localRangeMapEntry;
            do
              if (this.val$backingItr.hasNext())
              {
                localRangeMapEntry = (TreeRangeMap.RangeMapEntry)this.val$backingItr.next();
                if (localRangeMapEntry.getLowerBound().compareTo(TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1).upperBound) < 0);
              }
              else
              {
                return (Map.Entry)endOfData();
              }
            while (localRangeMapEntry.getUpperBound().compareTo(TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1).lowerBound) <= 0);
            return Maps.immutableEntry(localRangeMapEntry.getKey().intersection(TreeRangeMap.SubRangeMap.access$300(TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.this$1)), localRangeMapEntry.getValue());
          }
        };
      }

      Map<Range<K>, V> map()
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this;
      }

      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
      }

      public int size()
      {
        return Iterators.size(iterator());
      }
    };
  }

  public V get(Object paramObject)
  {
    try
    {
      if ((paramObject instanceof Range))
      {
        Range localRange = (Range)paramObject;
        if (TreeRangeMap.SubRangeMap.access$300(this.this$1).encloses(localRange))
        {
          if (localRange.isEmpty())
            return null;
          Map.Entry localEntry;
          if (localRange.lowerBound.compareTo(TreeRangeMap.SubRangeMap.access$300(this.this$1).lowerBound) == 0)
          {
            localEntry = TreeRangeMap.access$100(this.this$1.this$0).floorEntry(localRange.lowerBound);
            localRangeMapEntry = null;
            if (localEntry == null);
          }
          for (TreeRangeMap.RangeMapEntry localRangeMapEntry = (TreeRangeMap.RangeMapEntry)localEntry.getValue(); (localRangeMapEntry != null) && (localRangeMapEntry.getKey().isConnected(TreeRangeMap.SubRangeMap.access$300(this.this$1))) && (localRangeMapEntry.getKey().intersection(TreeRangeMap.SubRangeMap.access$300(this.this$1)).equals(localRange)); localRangeMapEntry = (TreeRangeMap.RangeMapEntry)TreeRangeMap.access$100(this.this$1.this$0).get(localRange.lowerBound))
            return localRangeMapEntry.getValue();
        }
      }
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return null;
  }

  public Set<Range<K>> keySet()
  {
    return new Maps.KeySet(this)
    {
      public boolean remove(@Nullable Object paramAnonymousObject)
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.remove(paramAnonymousObject) != null;
      }

      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.not(Predicates.in(paramAnonymousCollection)), Maps.keyFunction()));
      }
    };
  }

  public V remove(Object paramObject)
  {
    Object localObject = get(paramObject);
    if (localObject != null)
    {
      Range localRange = (Range)paramObject;
      this.this$1.this$0.remove(localRange);
      return localObject;
    }
    return null;
  }

  public Collection<V> values()
  {
    return new Maps.Values(this)
    {
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.in(paramAnonymousCollection), Maps.valueFunction()));
      }

      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.this.removeEntryIf(Predicates.compose(Predicates.not(Predicates.in(paramAnonymousCollection)), Maps.valueFunction()));
      }
    };
  }
}