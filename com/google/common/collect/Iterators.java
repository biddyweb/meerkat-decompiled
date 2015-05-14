package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.PriorityQueue;
import java.util.Queue;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public final class Iterators
{
  static final UnmodifiableListIterator<Object> EMPTY_LIST_ITERATOR = new UnmodifiableListIterator()
  {
    public boolean hasNext()
    {
      return false;
    }

    public boolean hasPrevious()
    {
      return false;
    }

    public Object next()
    {
      throw new NoSuchElementException();
    }

    public int nextIndex()
    {
      return 0;
    }

    public Object previous()
    {
      throw new NoSuchElementException();
    }

    public int previousIndex()
    {
      return -1;
    }
  };
  private static final Iterator<Object> EMPTY_MODIFIABLE_ITERATOR = new Iterator()
  {
    public boolean hasNext()
    {
      return false;
    }

    public Object next()
    {
      throw new NoSuchElementException();
    }

    public void remove()
    {
      CollectPreconditions.checkRemove(false);
    }
  };

  public static <T> boolean addAll(Collection<T> paramCollection, Iterator<? extends T> paramIterator)
  {
    Preconditions.checkNotNull(paramCollection);
    Preconditions.checkNotNull(paramIterator);
    boolean bool = false;
    while (paramIterator.hasNext())
      bool |= paramCollection.add(paramIterator.next());
    return bool;
  }

  public static int advance(Iterator<?> paramIterator, int paramInt)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt >= 0);
    int i;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "numberToAdvance must be nonnegative");
      for (i = 0; (i < paramInt) && (paramIterator.hasNext()); i++)
        paramIterator.next();
    }
    return i;
  }

  public static <T> boolean all(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate);
    while (paramIterator.hasNext())
      if (!paramPredicate.apply(paramIterator.next()))
        return false;
    return true;
  }

  public static <T> boolean any(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    return indexOf(paramIterator, paramPredicate) != -1;
  }

  public static <T> Enumeration<T> asEnumeration(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    return new Enumeration()
    {
      public boolean hasMoreElements()
      {
        return this.val$iterator.hasNext();
      }

      public T nextElement()
      {
        return this.val$iterator.next();
      }
    };
  }

  static <T> ListIterator<T> cast(Iterator<T> paramIterator)
  {
    return (ListIterator)paramIterator;
  }

  static void checkNonnegative(int paramInt)
  {
    if (paramInt < 0)
      throw new IndexOutOfBoundsException(43 + "position (" + paramInt + ") must not be negative");
  }

  static void clear(Iterator<?> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    while (paramIterator.hasNext())
    {
      paramIterator.next();
      paramIterator.remove();
    }
  }

  public static <T> Iterator<T> concat(Iterator<? extends Iterator<? extends T>> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    return new Iterator()
    {
      Iterator<? extends T> current = Iterators.emptyIterator();
      Iterator<? extends T> removeFrom;

      public boolean hasNext()
      {
        boolean bool;
        while (true)
        {
          bool = ((Iterator)Preconditions.checkNotNull(this.current)).hasNext();
          if ((bool) || (!this.val$inputs.hasNext()))
            break;
          this.current = ((Iterator)this.val$inputs.next());
        }
        return bool;
      }

      public T next()
      {
        if (!hasNext())
          throw new NoSuchElementException();
        this.removeFrom = this.current;
        return this.current.next();
      }

      public void remove()
      {
        if (this.removeFrom != null);
        for (boolean bool = true; ; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          this.removeFrom.remove();
          this.removeFrom = null;
          return;
        }
      }
    };
  }

  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2).iterator());
  }

  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2, Iterator<? extends T> paramIterator3)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2, paramIterator3).iterator());
  }

  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2, Iterator<? extends T> paramIterator3, Iterator<? extends T> paramIterator4)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2, paramIterator3, paramIterator4).iterator());
  }

  public static <T> Iterator<T> concat(Iterator<? extends T>[] paramArrayOfIterator)
  {
    return concat(ImmutableList.copyOf(paramArrayOfIterator).iterator());
  }

  public static <T> Iterator<T> consumingIterator(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    return new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return this.val$iterator.hasNext();
      }

      public T next()
      {
        Object localObject = this.val$iterator.next();
        this.val$iterator.remove();
        return localObject;
      }

      public String toString()
      {
        return "Iterators.consumingIterator(...)";
      }
    };
  }

  public static boolean contains(Iterator<?> paramIterator, @Nullable Object paramObject)
  {
    return any(paramIterator, Predicates.equalTo(paramObject));
  }

  public static <T> Iterator<T> cycle(Iterable<T> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    return new Iterator()
    {
      Iterator<T> iterator = Iterators.emptyIterator();
      Iterator<T> removeFrom;

      public boolean hasNext()
      {
        if (!this.iterator.hasNext())
          this.iterator = this.val$iterable.iterator();
        return this.iterator.hasNext();
      }

      public T next()
      {
        if (!hasNext())
          throw new NoSuchElementException();
        this.removeFrom = this.iterator;
        return this.iterator.next();
      }

      public void remove()
      {
        if (this.removeFrom != null);
        for (boolean bool = true; ; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          this.removeFrom.remove();
          this.removeFrom = null;
          return;
        }
      }
    };
  }

  public static <T> Iterator<T> cycle(T[] paramArrayOfT)
  {
    return cycle(Lists.newArrayList(paramArrayOfT));
  }

  public static boolean elementsEqual(Iterator<?> paramIterator1, Iterator<?> paramIterator2)
  {
    if (paramIterator1.hasNext())
      if (paramIterator2.hasNext());
    while (paramIterator2.hasNext())
    {
      return false;
      if (Objects.equal(paramIterator1.next(), paramIterator2.next()))
        break;
      return false;
    }
    return true;
  }

  @Deprecated
  public static <T> UnmodifiableIterator<T> emptyIterator()
  {
    return emptyListIterator();
  }

  static <T> UnmodifiableListIterator<T> emptyListIterator()
  {
    return EMPTY_LIST_ITERATOR;
  }

  static <T> Iterator<T> emptyModifiableIterator()
  {
    return EMPTY_MODIFIABLE_ITERATOR;
  }

  public static <T> UnmodifiableIterator<T> filter(Iterator<T> paramIterator, final Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramIterator);
    Preconditions.checkNotNull(paramPredicate);
    return new AbstractIterator()
    {
      protected T computeNext()
      {
        while (this.val$unfiltered.hasNext())
        {
          Object localObject = this.val$unfiltered.next();
          if (paramPredicate.apply(localObject))
            return localObject;
        }
        return endOfData();
      }
    };
  }

  @GwtIncompatible("Class.isInstance")
  public static <T> UnmodifiableIterator<T> filter(Iterator<?> paramIterator, Class<T> paramClass)
  {
    return filter(paramIterator, Predicates.instanceOf(paramClass));
  }

  public static <T> T find(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    return filter(paramIterator, paramPredicate).next();
  }

  @Nullable
  public static <T> T find(Iterator<? extends T> paramIterator, Predicate<? super T> paramPredicate, @Nullable T paramT)
  {
    return getNext(filter(paramIterator, paramPredicate), paramT);
  }

  public static <T> UnmodifiableIterator<T> forArray(T[] paramArrayOfT)
  {
    return forArray(paramArrayOfT, 0, paramArrayOfT.length, 0);
  }

  static <T> UnmodifiableListIterator<T> forArray(final T[] paramArrayOfT, final int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt2 >= 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfT.length);
      Preconditions.checkPositionIndex(paramInt3, paramInt2);
      if (paramInt2 != 0)
        break;
      return emptyListIterator();
    }
    return new AbstractIndexedListIterator(paramInt2, paramInt3)
    {
      protected T get(int paramAnonymousInt)
      {
        return paramArrayOfT[(paramAnonymousInt + paramInt1)];
      }
    };
  }

  public static <T> UnmodifiableIterator<T> forEnumeration(Enumeration<T> paramEnumeration)
  {
    Preconditions.checkNotNull(paramEnumeration);
    return new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return this.val$enumeration.hasMoreElements();
      }

      public T next()
      {
        return this.val$enumeration.nextElement();
      }
    };
  }

  public static int frequency(Iterator<?> paramIterator, @Nullable Object paramObject)
  {
    return size(filter(paramIterator, Predicates.equalTo(paramObject)));
  }

  public static <T> T get(Iterator<T> paramIterator, int paramInt)
  {
    checkNonnegative(paramInt);
    int i = advance(paramIterator, paramInt);
    if (!paramIterator.hasNext())
      throw new IndexOutOfBoundsException(91 + "position (" + paramInt + ") must be less than the number of elements that remained (" + i + ")");
    return paramIterator.next();
  }

  @Nullable
  public static <T> T get(Iterator<? extends T> paramIterator, int paramInt, @Nullable T paramT)
  {
    checkNonnegative(paramInt);
    advance(paramIterator, paramInt);
    return getNext(paramIterator, paramT);
  }

  public static <T> T getLast(Iterator<T> paramIterator)
  {
    Object localObject;
    do
      localObject = paramIterator.next();
    while (paramIterator.hasNext());
    return localObject;
  }

  @Nullable
  public static <T> T getLast(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext())
      paramT = getLast(paramIterator);
    return paramT;
  }

  @Nullable
  public static <T> T getNext(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext())
      paramT = paramIterator.next();
    return paramT;
  }

  public static <T> T getOnlyElement(Iterator<T> paramIterator)
  {
    Object localObject = paramIterator.next();
    if (!paramIterator.hasNext())
      return localObject;
    StringBuilder localStringBuilder = new StringBuilder();
    String str1 = String.valueOf(String.valueOf(localObject));
    localStringBuilder.append(31 + str1.length() + "expected one element but was: <" + str1);
    for (int i = 0; (i < 4) && (paramIterator.hasNext()); i++)
    {
      String str2 = String.valueOf(String.valueOf(paramIterator.next()));
      localStringBuilder.append(2 + str2.length() + ", " + str2);
    }
    if (paramIterator.hasNext())
      localStringBuilder.append(", ...");
    localStringBuilder.append('>');
    throw new IllegalArgumentException(localStringBuilder.toString());
  }

  @Nullable
  public static <T> T getOnlyElement(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext())
      paramT = getOnlyElement(paramIterator);
    return paramT;
  }

  public static <T> int indexOf(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate, "predicate");
    for (int i = 0; paramIterator.hasNext(); i++)
      if (paramPredicate.apply(paramIterator.next()))
        return i;
    return -1;
  }

  public static <T> Iterator<T> limit(final Iterator<T> paramIterator, int paramInt)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt >= 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "limit is negative");
      return new Iterator()
      {
        private int count;

        public boolean hasNext()
        {
          return (this.count < this.val$limitSize) && (paramIterator.hasNext());
        }

        public T next()
        {
          if (!hasNext())
            throw new NoSuchElementException();
          this.count = (1 + this.count);
          return paramIterator.next();
        }

        public void remove()
        {
          paramIterator.remove();
        }
      };
    }
  }

  @Beta
  public static <T> UnmodifiableIterator<T> mergeSorted(Iterable<? extends Iterator<? extends T>> paramIterable, Comparator<? super T> paramComparator)
  {
    Preconditions.checkNotNull(paramIterable, "iterators");
    Preconditions.checkNotNull(paramComparator, "comparator");
    return new MergingIterator(paramIterable, paramComparator);
  }

  public static <T> UnmodifiableIterator<List<T>> paddedPartition(Iterator<T> paramIterator, int paramInt)
  {
    return partitionImpl(paramIterator, paramInt, true);
  }

  public static <T> UnmodifiableIterator<List<T>> partition(Iterator<T> paramIterator, int paramInt)
  {
    return partitionImpl(paramIterator, paramInt, false);
  }

  private static <T> UnmodifiableIterator<List<T>> partitionImpl(Iterator<T> paramIterator, final int paramInt, final boolean paramBoolean)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt > 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      return new UnmodifiableIterator()
      {
        public boolean hasNext()
        {
          return this.val$iterator.hasNext();
        }

        public List<T> next()
        {
          if (!hasNext())
            throw new NoSuchElementException();
          Object[] arrayOfObject = new Object[paramInt];
          for (int i = 0; (i < paramInt) && (this.val$iterator.hasNext()); i++)
            arrayOfObject[i] = this.val$iterator.next();
          for (int j = i; j < paramInt; j++)
            arrayOfObject[j] = null;
          List localList = Collections.unmodifiableList(Arrays.asList(arrayOfObject));
          if ((paramBoolean) || (i == paramInt))
            return localList;
          return localList.subList(0, i);
        }
      };
    }
  }

  @Deprecated
  public static <T> PeekingIterator<T> peekingIterator(PeekingIterator<T> paramPeekingIterator)
  {
    return (PeekingIterator)Preconditions.checkNotNull(paramPeekingIterator);
  }

  public static <T> PeekingIterator<T> peekingIterator(Iterator<? extends T> paramIterator)
  {
    if ((paramIterator instanceof PeekingImpl))
      return (PeekingImpl)paramIterator;
    return new PeekingImpl(paramIterator);
  }

  @Nullable
  static <T> T pollNext(Iterator<T> paramIterator)
  {
    if (paramIterator.hasNext())
    {
      Object localObject = paramIterator.next();
      paramIterator.remove();
      return localObject;
    }
    return null;
  }

  public static boolean removeAll(Iterator<?> paramIterator, Collection<?> paramCollection)
  {
    return removeIf(paramIterator, Predicates.in(paramCollection));
  }

  public static <T> boolean removeIf(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate);
    boolean bool = false;
    while (paramIterator.hasNext())
      if (paramPredicate.apply(paramIterator.next()))
      {
        paramIterator.remove();
        bool = true;
      }
    return bool;
  }

  public static boolean retainAll(Iterator<?> paramIterator, Collection<?> paramCollection)
  {
    return removeIf(paramIterator, Predicates.not(Predicates.in(paramCollection)));
  }

  public static <T> UnmodifiableIterator<T> singletonIterator(@Nullable T paramT)
  {
    return new UnmodifiableIterator()
    {
      boolean done;

      public boolean hasNext()
      {
        return !this.done;
      }

      public T next()
      {
        if (this.done)
          throw new NoSuchElementException();
        this.done = true;
        return this.val$value;
      }
    };
  }

  public static int size(Iterator<?> paramIterator)
  {
    for (int i = 0; paramIterator.hasNext(); i++)
      paramIterator.next();
    return i;
  }

  @GwtIncompatible("Array.newInstance(Class, int)")
  public static <T> T[] toArray(Iterator<? extends T> paramIterator, Class<T> paramClass)
  {
    return Iterables.toArray(Lists.newArrayList(paramIterator), paramClass);
  }

  public static String toString(Iterator<?> paramIterator)
  {
    return ']';
  }

  public static <F, T> Iterator<T> transform(Iterator<F> paramIterator, final Function<? super F, ? extends T> paramFunction)
  {
    Preconditions.checkNotNull(paramFunction);
    return new TransformedIterator(paramIterator)
    {
      T transform(F paramAnonymousF)
      {
        return paramFunction.apply(paramAnonymousF);
      }
    };
  }

  public static <T> Optional<T> tryFind(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    UnmodifiableIterator localUnmodifiableIterator = filter(paramIterator, paramPredicate);
    if (localUnmodifiableIterator.hasNext())
      return Optional.of(localUnmodifiableIterator.next());
    return Optional.absent();
  }

  @Deprecated
  public static <T> UnmodifiableIterator<T> unmodifiableIterator(UnmodifiableIterator<T> paramUnmodifiableIterator)
  {
    return (UnmodifiableIterator)Preconditions.checkNotNull(paramUnmodifiableIterator);
  }

  public static <T> UnmodifiableIterator<T> unmodifiableIterator(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    if ((paramIterator instanceof UnmodifiableIterator))
      return (UnmodifiableIterator)paramIterator;
    return new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return this.val$iterator.hasNext();
      }

      public T next()
      {
        return this.val$iterator.next();
      }
    };
  }

  private static class MergingIterator<T> extends UnmodifiableIterator<T>
  {
    final Queue<PeekingIterator<T>> queue;

    public MergingIterator(Iterable<? extends Iterator<? extends T>> paramIterable, final Comparator<? super T> paramComparator)
    {
      this.queue = new PriorityQueue(2, new Comparator()
      {
        public int compare(PeekingIterator<T> paramAnonymousPeekingIterator1, PeekingIterator<T> paramAnonymousPeekingIterator2)
        {
          return paramComparator.compare(paramAnonymousPeekingIterator1.peek(), paramAnonymousPeekingIterator2.peek());
        }
      });
      Iterator localIterator1 = paramIterable.iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator2 = (Iterator)localIterator1.next();
        if (localIterator2.hasNext())
          this.queue.add(Iterators.peekingIterator(localIterator2));
      }
    }

    public boolean hasNext()
    {
      return !this.queue.isEmpty();
    }

    public T next()
    {
      PeekingIterator localPeekingIterator = (PeekingIterator)this.queue.remove();
      Object localObject = localPeekingIterator.next();
      if (localPeekingIterator.hasNext())
        this.queue.add(localPeekingIterator);
      return localObject;
    }
  }

  private static class PeekingImpl<E>
    implements PeekingIterator<E>
  {
    private boolean hasPeeked;
    private final Iterator<? extends E> iterator;
    private E peekedElement;

    public PeekingImpl(Iterator<? extends E> paramIterator)
    {
      this.iterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
    }

    public boolean hasNext()
    {
      return (this.hasPeeked) || (this.iterator.hasNext());
    }

    public E next()
    {
      if (!this.hasPeeked)
        return this.iterator.next();
      Object localObject = this.peekedElement;
      this.hasPeeked = false;
      this.peekedElement = null;
      return localObject;
    }

    public E peek()
    {
      if (!this.hasPeeked)
      {
        this.peekedElement = this.iterator.next();
        this.hasPeeked = true;
      }
      return this.peekedElement;
    }

    public void remove()
    {
      if (!this.hasPeeked);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkState(bool, "Can't remove after you've peeked at next");
        this.iterator.remove();
        return;
      }
    }
  }
}