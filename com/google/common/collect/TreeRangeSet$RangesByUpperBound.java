package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import javax.annotation.Nullable;

@VisibleForTesting
final class TreeRangeSet$RangesByUpperBound<C extends Comparable<?>> extends AbstractNavigableMap<Cut<C>, Range<C>>
{
  private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
  private final Range<Cut<C>> upperBoundWindow;

  TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    this.rangesByLowerBound = paramNavigableMap;
    this.upperBoundWindow = Range.all();
  }

  private TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
  {
    this.rangesByLowerBound = paramNavigableMap;
    this.upperBoundWindow = paramRange;
  }

  private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
  {
    if (paramRange.isConnected(this.upperBoundWindow))
      return new RangesByUpperBound(this.rangesByLowerBound, paramRange.intersection(this.upperBoundWindow));
    return ImmutableSortedMap.of();
  }

  public Comparator<? super Cut<C>> comparator()
  {
    return Ordering.natural();
  }

  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }

  Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
  {
    if (this.upperBoundWindow.hasUpperBound());
    for (Collection localCollection = this.rangesByLowerBound.headMap(this.upperBoundWindow.upperEndpoint(), false).descendingMap().values(); ; localCollection = this.rangesByLowerBound.descendingMap().values())
    {
      final PeekingIterator localPeekingIterator = Iterators.peekingIterator(localCollection.iterator());
      if ((localPeekingIterator.hasNext()) && (this.upperBoundWindow.upperBound.isLessThan(((Range)localPeekingIterator.peek()).upperBound)))
        localPeekingIterator.next();
      return new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!localPeekingIterator.hasNext())
            return (Map.Entry)endOfData();
          Range localRange = (Range)localPeekingIterator.next();
          if (TreeRangeSet.RangesByUpperBound.this.upperBoundWindow.lowerBound.isLessThan(localRange.upperBound))
            return Maps.immutableEntry(localRange.upperBound, localRange);
          return (Map.Entry)endOfData();
        }
      };
    }
  }

  Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
  {
    final Iterator localIterator;
    if (!this.upperBoundWindow.hasLowerBound())
      localIterator = this.rangesByLowerBound.values().iterator();
    while (true)
    {
      return new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!localIterator.hasNext())
            return (Map.Entry)endOfData();
          Range localRange = (Range)localIterator.next();
          if (TreeRangeSet.RangesByUpperBound.this.upperBoundWindow.upperBound.isLessThan(localRange.upperBound))
            return (Map.Entry)endOfData();
          return Maps.immutableEntry(localRange.upperBound, localRange);
        }
      };
      Map.Entry localEntry = this.rangesByLowerBound.lowerEntry(this.upperBoundWindow.lowerEndpoint());
      if (localEntry == null)
        localIterator = this.rangesByLowerBound.values().iterator();
      else if (this.upperBoundWindow.lowerBound.isLessThan(((Range)localEntry.getValue()).upperBound))
        localIterator = this.rangesByLowerBound.tailMap(localEntry.getKey(), true).values().iterator();
      else
        localIterator = this.rangesByLowerBound.tailMap(this.upperBoundWindow.lowerEndpoint(), true).values().iterator();
    }
  }

  public Range<C> get(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Cut))
      try
      {
        Cut localCut = (Cut)paramObject;
        if (!this.upperBoundWindow.contains(localCut))
          return null;
        Map.Entry localEntry = this.rangesByLowerBound.lowerEntry(localCut);
        if ((localEntry != null) && (((Range)localEntry.getValue()).upperBound.equals(localCut)))
        {
          Range localRange = (Range)localEntry.getValue();
          return localRange;
        }
      }
      catch (ClassCastException localClassCastException)
      {
        return null;
      }
    return null;
  }

  public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
  {
    return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
  }

  public boolean isEmpty()
  {
    if (this.upperBoundWindow.equals(Range.all()))
      return this.rangesByLowerBound.isEmpty();
    return !entryIterator().hasNext();
  }

  public int size()
  {
    if (this.upperBoundWindow.equals(Range.all()))
      return this.rangesByLowerBound.size();
    return Iterators.size(entryIterator());
  }

  public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
  {
    return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
  }

  public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
  {
    return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
  }
}