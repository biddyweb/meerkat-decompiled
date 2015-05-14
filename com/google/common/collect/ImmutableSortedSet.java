package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.SortedSet;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableSortedSet<E> extends ImmutableSortedSetFauxverideShim<E>
  implements NavigableSet<E>, SortedIterable<E>
{
  private static final ImmutableSortedSet<Comparable> NATURAL_EMPTY_SET = new EmptyImmutableSortedSet(NATURAL_ORDER);
  private static final Comparator<Comparable> NATURAL_ORDER = Ordering.natural();
  final transient Comparator<? super E> comparator;

  @GwtIncompatible("NavigableSet")
  transient ImmutableSortedSet<E> descendingSet;

  ImmutableSortedSet(Comparator<? super E> paramComparator)
  {
    this.comparator = paramComparator;
  }

  static <E> ImmutableSortedSet<E> construct(Comparator<? super E> paramComparator, int paramInt, E[] paramArrayOfE)
  {
    if (paramInt == 0)
      return emptySet(paramComparator);
    ObjectArrays.checkElementsNotNull(paramArrayOfE, paramInt);
    Arrays.sort(paramArrayOfE, 0, paramInt, paramComparator);
    int i = 1;
    int j = 1;
    int k;
    if (i < paramInt)
    {
      E ? = paramArrayOfE[i];
      if (paramComparator.compare(?, paramArrayOfE[(j - 1)]) == 0)
        break label102;
      k = j + 1;
      paramArrayOfE[j] = ?;
    }
    while (true)
    {
      i++;
      j = k;
      break;
      Arrays.fill(paramArrayOfE, j, paramInt, null);
      return new RegularImmutableSortedSet(ImmutableList.asImmutableList(paramArrayOfE, j), paramComparator);
      label102: k = j;
    }
  }

  public static <E> ImmutableSortedSet<E> copyOf(Iterable<? extends E> paramIterable)
  {
    return copyOf(Ordering.natural(), paramIterable);
  }

  public static <E> ImmutableSortedSet<E> copyOf(Collection<? extends E> paramCollection)
  {
    return copyOf(Ordering.natural(), paramCollection);
  }

  public static <E> ImmutableSortedSet<E> copyOf(Comparator<? super E> paramComparator, Iterable<? extends E> paramIterable)
  {
    Preconditions.checkNotNull(paramComparator);
    if ((SortedIterables.hasSameComparator(paramComparator, paramIterable)) && ((paramIterable instanceof ImmutableSortedSet)))
    {
      ImmutableSortedSet localImmutableSortedSet = (ImmutableSortedSet)paramIterable;
      if (!localImmutableSortedSet.isPartialView())
        return localImmutableSortedSet;
    }
    Object[] arrayOfObject = (Object[])Iterables.toArray(paramIterable);
    return construct(paramComparator, arrayOfObject.length, arrayOfObject);
  }

  public static <E> ImmutableSortedSet<E> copyOf(Comparator<? super E> paramComparator, Collection<? extends E> paramCollection)
  {
    return copyOf(paramComparator, paramCollection);
  }

  public static <E> ImmutableSortedSet<E> copyOf(Comparator<? super E> paramComparator, Iterator<? extends E> paramIterator)
  {
    return new Builder(paramComparator).addAll(paramIterator).build();
  }

  public static <E> ImmutableSortedSet<E> copyOf(Iterator<? extends E> paramIterator)
  {
    return copyOf(Ordering.natural(), paramIterator);
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> copyOf(E[] paramArrayOfE)
  {
    return construct(Ordering.natural(), paramArrayOfE.length, (Object[])paramArrayOfE.clone());
  }

  public static <E> ImmutableSortedSet<E> copyOfSorted(SortedSet<E> paramSortedSet)
  {
    Comparator localComparator = SortedIterables.comparator(paramSortedSet);
    ImmutableList localImmutableList = ImmutableList.copyOf(paramSortedSet);
    if (localImmutableList.isEmpty())
      return emptySet(localComparator);
    return new RegularImmutableSortedSet(localImmutableList, localComparator);
  }

  private static <E> ImmutableSortedSet<E> emptySet()
  {
    return NATURAL_EMPTY_SET;
  }

  static <E> ImmutableSortedSet<E> emptySet(Comparator<? super E> paramComparator)
  {
    if (NATURAL_ORDER.equals(paramComparator))
      return emptySet();
    return new EmptyImmutableSortedSet(paramComparator);
  }

  public static <E extends Comparable<?>> Builder<E> naturalOrder()
  {
    return new Builder(Ordering.natural());
  }

  public static <E> ImmutableSortedSet<E> of()
  {
    return emptySet();
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE)
  {
    return new RegularImmutableSortedSet(ImmutableList.of(paramE), Ordering.natural());
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE1, E paramE2)
  {
    return construct(Ordering.natural(), 2, new Comparable[] { paramE1, paramE2 });
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE1, E paramE2, E paramE3)
  {
    return construct(Ordering.natural(), 3, new Comparable[] { paramE1, paramE2, paramE3 });
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4)
  {
    return construct(Ordering.natural(), 4, new Comparable[] { paramE1, paramE2, paramE3, paramE4 });
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5)
  {
    return construct(Ordering.natural(), 5, new Comparable[] { paramE1, paramE2, paramE3, paramE4, paramE5 });
  }

  public static <E extends Comparable<? super E>> ImmutableSortedSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5, E paramE6, E[] paramArrayOfE)
  {
    Comparable[] arrayOfComparable = new Comparable[6 + paramArrayOfE.length];
    arrayOfComparable[0] = paramE1;
    arrayOfComparable[1] = paramE2;
    arrayOfComparable[2] = paramE3;
    arrayOfComparable[3] = paramE4;
    arrayOfComparable[4] = paramE5;
    arrayOfComparable[5] = paramE6;
    System.arraycopy(paramArrayOfE, 0, arrayOfComparable, 6, paramArrayOfE.length);
    return construct(Ordering.natural(), arrayOfComparable.length, (Comparable[])arrayOfComparable);
  }

  public static <E> Builder<E> orderedBy(Comparator<E> paramComparator)
  {
    return new Builder(paramComparator);
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws InvalidObjectException
  {
    throw new InvalidObjectException("Use SerializedForm");
  }

  public static <E extends Comparable<?>> Builder<E> reverseOrder()
  {
    return new Builder(Ordering.natural().reverse());
  }

  static int unsafeCompare(Comparator<?> paramComparator, Object paramObject1, Object paramObject2)
  {
    return paramComparator.compare(paramObject1, paramObject2);
  }

  @GwtIncompatible("NavigableSet")
  public E ceiling(E paramE)
  {
    return Iterables.getFirst(tailSet(paramE, true), null);
  }

  public Comparator<? super E> comparator()
  {
    return this.comparator;
  }

  @GwtIncompatible("NavigableSet")
  ImmutableSortedSet<E> createDescendingSet()
  {
    return new DescendingImmutableSortedSet(this);
  }

  @GwtIncompatible("NavigableSet")
  public abstract UnmodifiableIterator<E> descendingIterator();

  @GwtIncompatible("NavigableSet")
  public ImmutableSortedSet<E> descendingSet()
  {
    ImmutableSortedSet localImmutableSortedSet = this.descendingSet;
    if (localImmutableSortedSet == null)
    {
      localImmutableSortedSet = createDescendingSet();
      this.descendingSet = localImmutableSortedSet;
      localImmutableSortedSet.descendingSet = this;
    }
    return localImmutableSortedSet;
  }

  public E first()
  {
    return iterator().next();
  }

  @GwtIncompatible("NavigableSet")
  public E floor(E paramE)
  {
    return Iterators.getNext(headSet(paramE, true).descendingIterator(), null);
  }

  public ImmutableSortedSet<E> headSet(E paramE)
  {
    return headSet(paramE, false);
  }

  @GwtIncompatible("NavigableSet")
  public ImmutableSortedSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return headSetImpl(Preconditions.checkNotNull(paramE), paramBoolean);
  }

  abstract ImmutableSortedSet<E> headSetImpl(E paramE, boolean paramBoolean);

  @GwtIncompatible("NavigableSet")
  public E higher(E paramE)
  {
    return Iterables.getFirst(tailSet(paramE, false), null);
  }

  abstract int indexOf(@Nullable Object paramObject);

  public abstract UnmodifiableIterator<E> iterator();

  public E last()
  {
    return descendingIterator().next();
  }

  @GwtIncompatible("NavigableSet")
  public E lower(E paramE)
  {
    return Iterators.getNext(headSet(paramE, false).descendingIterator(), null);
  }

  @Deprecated
  @GwtIncompatible("NavigableSet")
  public final E pollFirst()
  {
    throw new UnsupportedOperationException();
  }

  @Deprecated
  @GwtIncompatible("NavigableSet")
  public final E pollLast()
  {
    throw new UnsupportedOperationException();
  }

  public ImmutableSortedSet<E> subSet(E paramE1, E paramE2)
  {
    return subSet(paramE1, true, paramE2, false);
  }

  @GwtIncompatible("NavigableSet")
  public ImmutableSortedSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    Preconditions.checkNotNull(paramE1);
    Preconditions.checkNotNull(paramE2);
    if (this.comparator.compare(paramE1, paramE2) <= 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      return subSetImpl(paramE1, paramBoolean1, paramE2, paramBoolean2);
    }
  }

  abstract ImmutableSortedSet<E> subSetImpl(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2);

  public ImmutableSortedSet<E> tailSet(E paramE)
  {
    return tailSet(paramE, true);
  }

  @GwtIncompatible("NavigableSet")
  public ImmutableSortedSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return tailSetImpl(Preconditions.checkNotNull(paramE), paramBoolean);
  }

  abstract ImmutableSortedSet<E> tailSetImpl(E paramE, boolean paramBoolean);

  int unsafeCompare(Object paramObject1, Object paramObject2)
  {
    return unsafeCompare(this.comparator, paramObject1, paramObject2);
  }

  Object writeReplace()
  {
    return new SerializedForm(this.comparator, toArray());
  }

  public static final class Builder<E> extends ImmutableSet.Builder<E>
  {
    private final Comparator<? super E> comparator;

    public Builder(Comparator<? super E> paramComparator)
    {
      this.comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    }

    public Builder<E> add(E paramE)
    {
      super.add(paramE);
      return this;
    }

    public Builder<E> add(E[] paramArrayOfE)
    {
      super.add(paramArrayOfE);
      return this;
    }

    public Builder<E> addAll(Iterable<? extends E> paramIterable)
    {
      super.addAll(paramIterable);
      return this;
    }

    public Builder<E> addAll(Iterator<? extends E> paramIterator)
    {
      super.addAll(paramIterator);
      return this;
    }

    public ImmutableSortedSet<E> build()
    {
      Object[] arrayOfObject = (Object[])this.contents;
      ImmutableSortedSet localImmutableSortedSet = ImmutableSortedSet.construct(this.comparator, this.size, arrayOfObject);
      this.size = localImmutableSortedSet.size();
      return localImmutableSortedSet;
    }
  }

  private static class SerializedForm<E>
    implements Serializable
  {
    private static final long serialVersionUID;
    final Comparator<? super E> comparator;
    final Object[] elements;

    public SerializedForm(Comparator<? super E> paramComparator, Object[] paramArrayOfObject)
    {
      this.comparator = paramComparator;
      this.elements = paramArrayOfObject;
    }

    Object readResolve()
    {
      return new ImmutableSortedSet.Builder(this.comparator).add((Object[])this.elements).build();
    }
  }
}