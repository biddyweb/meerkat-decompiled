package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

abstract class AbstractRangeSet<C extends Comparable>
  implements RangeSet<C>
{
  public void add(Range<C> paramRange)
  {
    throw new UnsupportedOperationException();
  }

  public void addAll(RangeSet<C> paramRangeSet)
  {
    Iterator localIterator = paramRangeSet.asRanges().iterator();
    while (localIterator.hasNext())
      add((Range)localIterator.next());
  }

  public void clear()
  {
    remove(Range.all());
  }

  public boolean contains(C paramC)
  {
    return rangeContaining(paramC) != null;
  }

  public abstract boolean encloses(Range<C> paramRange);

  public boolean enclosesAll(RangeSet<C> paramRangeSet)
  {
    Iterator localIterator = paramRangeSet.asRanges().iterator();
    while (localIterator.hasNext())
      if (!encloses((Range)localIterator.next()))
        return false;
    return true;
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this)
      return true;
    if ((paramObject instanceof RangeSet))
    {
      RangeSet localRangeSet = (RangeSet)paramObject;
      return asRanges().equals(localRangeSet.asRanges());
    }
    return false;
  }

  public final int hashCode()
  {
    return asRanges().hashCode();
  }

  public boolean isEmpty()
  {
    return asRanges().isEmpty();
  }

  public abstract Range<C> rangeContaining(C paramC);

  public void remove(Range<C> paramRange)
  {
    throw new UnsupportedOperationException();
  }

  public void removeAll(RangeSet<C> paramRangeSet)
  {
    Iterator localIterator = paramRangeSet.asRanges().iterator();
    while (localIterator.hasNext())
      remove((Range)localIterator.next());
  }

  public final String toString()
  {
    return asRanges().toString();
  }
}