package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Predicate;
import java.util.Iterator;
import java.util.NavigableSet;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableSet")
class Sets$FilteredNavigableSet<E> extends Sets.FilteredSortedSet<E>
  implements NavigableSet<E>
{
  Sets$FilteredNavigableSet(NavigableSet<E> paramNavigableSet, Predicate<? super E> paramPredicate)
  {
    super(paramNavigableSet, paramPredicate);
  }

  public E ceiling(E paramE)
  {
    return Iterables.getFirst(tailSet(paramE, true), null);
  }

  public Iterator<E> descendingIterator()
  {
    return Iterators.filter(unfiltered().descendingIterator(), this.predicate);
  }

  public NavigableSet<E> descendingSet()
  {
    return Sets.filter(unfiltered().descendingSet(), this.predicate);
  }

  @Nullable
  public E floor(E paramE)
  {
    return Iterators.getNext(headSet(paramE, true).descendingIterator(), null);
  }

  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return Sets.filter(unfiltered().headSet(paramE, paramBoolean), this.predicate);
  }

  public E higher(E paramE)
  {
    return Iterables.getFirst(tailSet(paramE, false), null);
  }

  public E last()
  {
    return descendingIterator().next();
  }

  @Nullable
  public E lower(E paramE)
  {
    return Iterators.getNext(headSet(paramE, false).descendingIterator(), null);
  }

  public E pollFirst()
  {
    return Iterables.removeFirstMatching(unfiltered(), this.predicate);
  }

  public E pollLast()
  {
    return Iterables.removeFirstMatching(unfiltered().descendingSet(), this.predicate);
  }

  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return Sets.filter(unfiltered().subSet(paramE1, paramBoolean1, paramE2, paramBoolean2), this.predicate);
  }

  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return Sets.filter(unfiltered().tailSet(paramE, paramBoolean), this.predicate);
  }

  NavigableSet<E> unfiltered()
  {
    return (NavigableSet)this.unfiltered;
  }
}