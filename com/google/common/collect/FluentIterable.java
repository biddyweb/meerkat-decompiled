package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public abstract class FluentIterable<E>
  implements Iterable<E>
{
  private final Iterable<E> iterable;

  protected FluentIterable()
  {
    this.iterable = this;
  }

  FluentIterable(Iterable<E> paramIterable)
  {
    this.iterable = ((Iterable)Preconditions.checkNotNull(paramIterable));
  }

  @Deprecated
  public static <E> FluentIterable<E> from(FluentIterable<E> paramFluentIterable)
  {
    return (FluentIterable)Preconditions.checkNotNull(paramFluentIterable);
  }

  public static <E> FluentIterable<E> from(final Iterable<E> paramIterable)
  {
    if ((paramIterable instanceof FluentIterable))
      return (FluentIterable)paramIterable;
    return new FluentIterable(paramIterable)
    {
      public Iterator<E> iterator()
      {
        return paramIterable.iterator();
      }
    };
  }

  @Beta
  public static <E> FluentIterable<E> of(E[] paramArrayOfE)
  {
    return from(Lists.newArrayList(paramArrayOfE));
  }

  public final boolean allMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.all(this.iterable, paramPredicate);
  }

  public final boolean anyMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.any(this.iterable, paramPredicate);
  }

  @CheckReturnValue
  @Beta
  public final FluentIterable<E> append(Iterable<? extends E> paramIterable)
  {
    return from(Iterables.concat(this.iterable, paramIterable));
  }

  @CheckReturnValue
  @Beta
  public final FluentIterable<E> append(E[] paramArrayOfE)
  {
    return from(Iterables.concat(this.iterable, Arrays.asList(paramArrayOfE)));
  }

  public final boolean contains(@Nullable Object paramObject)
  {
    return Iterables.contains(this.iterable, paramObject);
  }

  public final <C extends Collection<? super E>> C copyInto(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    if ((this.iterable instanceof Collection))
      paramC.addAll(Collections2.cast(this.iterable));
    while (true)
    {
      return paramC;
      Iterator localIterator = this.iterable.iterator();
      while (localIterator.hasNext())
        paramC.add(localIterator.next());
    }
  }

  @CheckReturnValue
  public final FluentIterable<E> cycle()
  {
    return from(Iterables.cycle(this.iterable));
  }

  @CheckReturnValue
  public final FluentIterable<E> filter(Predicate<? super E> paramPredicate)
  {
    return from(Iterables.filter(this.iterable, paramPredicate));
  }

  @CheckReturnValue
  @GwtIncompatible("Class.isInstance")
  public final <T> FluentIterable<T> filter(Class<T> paramClass)
  {
    return from(Iterables.filter(this.iterable, paramClass));
  }

  public final Optional<E> first()
  {
    Iterator localIterator = this.iterable.iterator();
    if (localIterator.hasNext())
      return Optional.of(localIterator.next());
    return Optional.absent();
  }

  public final Optional<E> firstMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.tryFind(this.iterable, paramPredicate);
  }

  public final E get(int paramInt)
  {
    return Iterables.get(this.iterable, paramInt);
  }

  public final <K> ImmutableListMultimap<K, E> index(Function<? super E, K> paramFunction)
  {
    return Multimaps.index(this.iterable, paramFunction);
  }

  public final boolean isEmpty()
  {
    return !this.iterable.iterator().hasNext();
  }

  @Beta
  public final String join(Joiner paramJoiner)
  {
    return paramJoiner.join(this);
  }

  public final Optional<E> last()
  {
    if ((this.iterable instanceof List))
    {
      List localList = (List)this.iterable;
      if (localList.isEmpty())
        return Optional.absent();
      return Optional.of(localList.get(-1 + localList.size()));
    }
    Iterator localIterator = this.iterable.iterator();
    if (!localIterator.hasNext())
      return Optional.absent();
    if ((this.iterable instanceof SortedSet))
      return Optional.of(((SortedSet)this.iterable).last());
    Object localObject;
    do
      localObject = localIterator.next();
    while (localIterator.hasNext());
    return Optional.of(localObject);
  }

  @CheckReturnValue
  public final FluentIterable<E> limit(int paramInt)
  {
    return from(Iterables.limit(this.iterable, paramInt));
  }

  public final int size()
  {
    return Iterables.size(this.iterable);
  }

  @CheckReturnValue
  public final FluentIterable<E> skip(int paramInt)
  {
    return from(Iterables.skip(this.iterable, paramInt));
  }

  @GwtIncompatible("Array.newArray(Class, int)")
  public final E[] toArray(Class<E> paramClass)
  {
    return Iterables.toArray(this.iterable, paramClass);
  }

  public final ImmutableList<E> toList()
  {
    return ImmutableList.copyOf(this.iterable);
  }

  public final <V> ImmutableMap<E, V> toMap(Function<? super E, V> paramFunction)
  {
    return Maps.toMap(this.iterable, paramFunction);
  }

  public final ImmutableSet<E> toSet()
  {
    return ImmutableSet.copyOf(this.iterable);
  }

  public final ImmutableList<E> toSortedList(Comparator<? super E> paramComparator)
  {
    return Ordering.from(paramComparator).immutableSortedCopy(this.iterable);
  }

  public final ImmutableSortedSet<E> toSortedSet(Comparator<? super E> paramComparator)
  {
    return ImmutableSortedSet.copyOf(paramComparator, this.iterable);
  }

  public String toString()
  {
    return Iterables.toString(this.iterable);
  }

  public final <T> FluentIterable<T> transform(Function<? super E, T> paramFunction)
  {
    return from(Iterables.transform(this.iterable, paramFunction));
  }

  public <T> FluentIterable<T> transformAndConcat(Function<? super E, ? extends Iterable<? extends T>> paramFunction)
  {
    return from(Iterables.concat(transform(paramFunction)));
  }

  public final <K> ImmutableMap<K, E> uniqueIndex(Function<? super E, K> paramFunction)
  {
    return Maps.uniqueIndex(this.iterable, paramFunction);
  }

  private static class FromIterableFunction<E>
    implements Function<Iterable<E>, FluentIterable<E>>
  {
    public FluentIterable<E> apply(Iterable<E> paramIterable)
    {
      return FluentIterable.from(paramIterable);
    }
  }
}