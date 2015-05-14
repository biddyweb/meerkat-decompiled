package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.Set;

@Beta
@GwtCompatible(emulated=true)
public abstract class ForwardingSortedMultiset<E> extends ForwardingMultiset<E>
  implements SortedMultiset<E>
{
  public Comparator<? super E> comparator()
  {
    return delegate().comparator();
  }

  protected abstract SortedMultiset<E> delegate();

  public SortedMultiset<E> descendingMultiset()
  {
    return delegate().descendingMultiset();
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
    return delegate().headMultiset(paramE, paramBoundType);
  }

  public Multiset.Entry<E> lastEntry()
  {
    return delegate().lastEntry();
  }

  public Multiset.Entry<E> pollFirstEntry()
  {
    return delegate().pollFirstEntry();
  }

  public Multiset.Entry<E> pollLastEntry()
  {
    return delegate().pollLastEntry();
  }

  protected Multiset.Entry<E> standardFirstEntry()
  {
    Iterator localIterator = entrySet().iterator();
    if (!localIterator.hasNext())
      return null;
    Multiset.Entry localEntry = (Multiset.Entry)localIterator.next();
    return Multisets.immutableEntry(localEntry.getElement(), localEntry.getCount());
  }

  protected Multiset.Entry<E> standardLastEntry()
  {
    Iterator localIterator = descendingMultiset().entrySet().iterator();
    if (!localIterator.hasNext())
      return null;
    Multiset.Entry localEntry = (Multiset.Entry)localIterator.next();
    return Multisets.immutableEntry(localEntry.getElement(), localEntry.getCount());
  }

  protected Multiset.Entry<E> standardPollFirstEntry()
  {
    Iterator localIterator = entrySet().iterator();
    if (!localIterator.hasNext())
      return null;
    Multiset.Entry localEntry1 = (Multiset.Entry)localIterator.next();
    Multiset.Entry localEntry2 = Multisets.immutableEntry(localEntry1.getElement(), localEntry1.getCount());
    localIterator.remove();
    return localEntry2;
  }

  protected Multiset.Entry<E> standardPollLastEntry()
  {
    Iterator localIterator = descendingMultiset().entrySet().iterator();
    if (!localIterator.hasNext())
      return null;
    Multiset.Entry localEntry1 = (Multiset.Entry)localIterator.next();
    Multiset.Entry localEntry2 = Multisets.immutableEntry(localEntry1.getElement(), localEntry1.getCount());
    localIterator.remove();
    return localEntry2;
  }

  protected SortedMultiset<E> standardSubMultiset(E paramE1, BoundType paramBoundType1, E paramE2, BoundType paramBoundType2)
  {
    return tailMultiset(paramE1, paramBoundType1).headMultiset(paramE2, paramBoundType2);
  }

  public SortedMultiset<E> subMultiset(E paramE1, BoundType paramBoundType1, E paramE2, BoundType paramBoundType2)
  {
    return delegate().subMultiset(paramE1, paramBoundType1, paramE2, paramBoundType2);
  }

  public SortedMultiset<E> tailMultiset(E paramE, BoundType paramBoundType)
  {
    return delegate().tailMultiset(paramE, paramBoundType);
  }

  protected abstract class StandardDescendingMultiset extends DescendingMultiset<E>
  {
    public StandardDescendingMultiset()
    {
    }

    SortedMultiset<E> forwardMultiset()
    {
      return ForwardingSortedMultiset.this;
    }
  }

  protected class StandardElementSet extends SortedMultisets.NavigableElementSet<E>
  {
    public StandardElementSet()
    {
      super();
    }
  }
}