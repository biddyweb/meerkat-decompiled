package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Comparator;
import java.util.NavigableSet;

@GwtCompatible(emulated=true)
final class UnmodifiableSortedMultiset<E> extends Multisets.UnmodifiableMultiset<E>
  implements SortedMultiset<E>
{
  private static final long serialVersionUID;
  private transient UnmodifiableSortedMultiset<E> descendingMultiset;

  UnmodifiableSortedMultiset(SortedMultiset<E> paramSortedMultiset)
  {
    super(paramSortedMultiset);
  }

  public Comparator<? super E> comparator()
  {
    return delegate().comparator();
  }

  NavigableSet<E> createElementSet()
  {
    return Sets.unmodifiableNavigableSet(delegate().elementSet());
  }

  protected SortedMultiset<E> delegate()
  {
    return (SortedMultiset)super.delegate();
  }

  public SortedMultiset<E> descendingMultiset()
  {
    UnmodifiableSortedMultiset localUnmodifiableSortedMultiset1 = this.descendingMultiset;
    if (localUnmodifiableSortedMultiset1 == null)
    {
      UnmodifiableSortedMultiset localUnmodifiableSortedMultiset2 = new UnmodifiableSortedMultiset(delegate().descendingMultiset());
      localUnmodifiableSortedMultiset2.descendingMultiset = this;
      this.descendingMultiset = localUnmodifiableSortedMultiset2;
      return localUnmodifiableSortedMultiset2;
    }
    return localUnmodifiableSortedMultiset1;
  }

  public NavigableSet<E> elementSet()
  {
    return (NavigableSet)super.elementSet();
  }

  public Multiset.Entry<E> firstEntry()
  {
    return delegate().firstEntry();
  }

  public SortedMultiset<E> headMultiset(E paramE, BoundType paramBoundType)
  {
    return Multisets.unmodifiableSortedMultiset(delegate().headMultiset(paramE, paramBoundType));
  }

  public Multiset.Entry<E> lastEntry()
  {
    return delegate().lastEntry();
  }

  public Multiset.Entry<E> pollFirstEntry()
  {
    throw new UnsupportedOperationException();
  }

  public Multiset.Entry<E> pollLastEntry()
  {
    throw new UnsupportedOperationException();
  }

  public SortedMultiset<E> subMultiset(E paramE1, BoundType paramBoundType1, E paramE2, BoundType paramBoundType2)
  {
    return Multisets.unmodifiableSortedMultiset(delegate().subMultiset(paramE1, paramBoundType1, paramE2, paramBoundType2));
  }

  public SortedMultiset<E> tailMultiset(E paramE, BoundType paramBoundType)
  {
    return Multisets.unmodifiableSortedMultiset(delegate().tailMultiset(paramE, paramBoundType));
  }
}