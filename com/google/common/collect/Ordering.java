package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible
public abstract class Ordering<T>
  implements Comparator<T>
{
  static final int LEFT_IS_GREATER = 1;
  static final int RIGHT_IS_GREATER = -1;

  @GwtCompatible(serializable=true)
  public static Ordering<Object> allEqual()
  {
    return AllEqualOrdering.INSTANCE;
  }

  public static Ordering<Object> arbitrary()
  {
    return Ordering.ArbitraryOrderingHolder.ARBITRARY_ORDERING;
  }

  @GwtCompatible(serializable=true)
  public static <T> Ordering<T> compound(Iterable<? extends Comparator<? super T>> paramIterable)
  {
    return new CompoundOrdering(paramIterable);
  }

  @GwtCompatible(serializable=true)
  public static <T> Ordering<T> explicit(T paramT, T[] paramArrayOfT)
  {
    return explicit(Lists.asList(paramT, paramArrayOfT));
  }

  @GwtCompatible(serializable=true)
  public static <T> Ordering<T> explicit(List<T> paramList)
  {
    return new ExplicitOrdering(paramList);
  }

  @Deprecated
  @GwtCompatible(serializable=true)
  public static <T> Ordering<T> from(Ordering<T> paramOrdering)
  {
    return (Ordering)Preconditions.checkNotNull(paramOrdering);
  }

  @GwtCompatible(serializable=true)
  public static <T> Ordering<T> from(Comparator<T> paramComparator)
  {
    if ((paramComparator instanceof Ordering))
      return (Ordering)paramComparator;
    return new ComparatorOrdering(paramComparator);
  }

  @GwtCompatible(serializable=true)
  public static <C extends Comparable> Ordering<C> natural()
  {
    return NaturalOrdering.INSTANCE;
  }

  private <E extends T> int partition(E[] paramArrayOfE, int paramInt1, int paramInt2, int paramInt3)
  {
    E ? = paramArrayOfE[paramInt3];
    paramArrayOfE[paramInt3] = paramArrayOfE[paramInt2];
    paramArrayOfE[paramInt2] = ?;
    int i = paramInt1;
    for (int j = paramInt1; j < paramInt2; j++)
      if (compare(paramArrayOfE[j], ?) < 0)
      {
        ObjectArrays.swap(paramArrayOfE, i, j);
        i++;
      }
    ObjectArrays.swap(paramArrayOfE, paramInt2, i);
    return i;
  }

  @GwtCompatible(serializable=true)
  public static Ordering<Object> usingToString()
  {
    return UsingToStringOrdering.INSTANCE;
  }

  public int binarySearch(List<? extends T> paramList, @Nullable T paramT)
  {
    return Collections.binarySearch(paramList, paramT, this);
  }

  public abstract int compare(@Nullable T paramT1, @Nullable T paramT2);

  @GwtCompatible(serializable=true)
  public <U extends T> Ordering<U> compound(Comparator<? super U> paramComparator)
  {
    return new CompoundOrdering(this, (Comparator)Preconditions.checkNotNull(paramComparator));
  }

  public <E extends T> List<E> greatestOf(Iterable<E> paramIterable, int paramInt)
  {
    return reverse().leastOf(paramIterable, paramInt);
  }

  public <E extends T> List<E> greatestOf(Iterator<E> paramIterator, int paramInt)
  {
    return reverse().leastOf(paramIterator, paramInt);
  }

  public <E extends T> ImmutableList<E> immutableSortedCopy(Iterable<E> paramIterable)
  {
    Object[] arrayOfObject = (Object[])Iterables.toArray(paramIterable);
    int i = arrayOfObject.length;
    for (int j = 0; j < i; j++)
      Preconditions.checkNotNull(arrayOfObject[j]);
    Arrays.sort(arrayOfObject, this);
    return ImmutableList.asImmutableList(arrayOfObject);
  }

  public boolean isOrdered(Iterable<? extends T> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    if (localIterator.hasNext())
    {
      Object localObject2;
      for (Object localObject1 = localIterator.next(); localIterator.hasNext(); localObject1 = localObject2)
      {
        localObject2 = localIterator.next();
        if (compare(localObject1, localObject2) > 0)
          return false;
      }
    }
    return true;
  }

  public boolean isStrictlyOrdered(Iterable<? extends T> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    if (localIterator.hasNext())
    {
      Object localObject2;
      for (Object localObject1 = localIterator.next(); localIterator.hasNext(); localObject1 = localObject2)
      {
        localObject2 = localIterator.next();
        if (compare(localObject1, localObject2) >= 0)
          return false;
      }
    }
    return true;
  }

  public <E extends T> List<E> leastOf(Iterable<E> paramIterable, int paramInt)
  {
    if ((paramIterable instanceof Collection))
    {
      Collection localCollection = (Collection)paramIterable;
      if (localCollection.size() <= 2L * paramInt)
      {
        Object[] arrayOfObject = (Object[])localCollection.toArray();
        Arrays.sort(arrayOfObject, this);
        if (arrayOfObject.length > paramInt)
          arrayOfObject = ObjectArrays.arraysCopyOf(arrayOfObject, paramInt);
        return Collections.unmodifiableList(Arrays.asList(arrayOfObject));
      }
    }
    return leastOf(paramIterable.iterator(), paramInt);
  }

  public <E extends T> List<E> leastOf(Iterator<E> paramIterator, int paramInt)
  {
    Preconditions.checkNotNull(paramIterator);
    CollectPreconditions.checkNonnegative(paramInt, "k");
    if ((paramInt == 0) || (!paramIterator.hasNext()))
      return ImmutableList.of();
    if (paramInt >= 1073741823)
    {
      ArrayList localArrayList = Lists.newArrayList(paramIterator);
      Collections.sort(localArrayList, this);
      if (localArrayList.size() > paramInt)
        localArrayList.subList(paramInt, localArrayList.size()).clear();
      localArrayList.trimToSize();
      return Collections.unmodifiableList(localArrayList);
    }
    int i = paramInt * 2;
    Object[] arrayOfObject = (Object[])new Object[i];
    Object localObject1 = paramIterator.next();
    arrayOfObject[0] = localObject1;
    int i4;
    for (int j = 1; (j < paramInt) && (paramIterator.hasNext()); j = i4)
    {
      Object localObject3 = paramIterator.next();
      i4 = j + 1;
      arrayOfObject[j] = localObject3;
      localObject1 = max(localObject1, localObject3);
    }
    while (true)
    {
      int k;
      if (paramIterator.hasNext())
      {
        Object localObject2 = paramIterator.next();
        if (compare(localObject2, localObject1) < 0)
        {
          j = k + 1;
          arrayOfObject[k] = localObject2;
          if (j == i)
          {
            int m = 0;
            int n = i - 1;
            int i1 = 0;
            while (m < n)
            {
              int i3 = partition(arrayOfObject, m, n, 1 + (m + n) >>> 1);
              if (i3 > paramInt)
              {
                n = i3 - 1;
              }
              else
              {
                if (i3 >= paramInt)
                  break;
                m = Math.max(i3, m + 1);
                i1 = i3;
              }
            }
            k = paramInt;
            localObject1 = arrayOfObject[i1];
            for (int i2 = i1 + 1; i2 < k; i2++)
              localObject1 = max(localObject1, arrayOfObject[i2]);
          }
        }
      }
      else
      {
        Arrays.sort(arrayOfObject, 0, k, this);
        return Collections.unmodifiableList(Arrays.asList(ObjectArrays.arraysCopyOf(arrayOfObject, Math.min(k, paramInt))));
        k = j;
      }
    }
  }

  @GwtCompatible(serializable=true)
  public <S extends T> Ordering<Iterable<S>> lexicographical()
  {
    return new LexicographicalOrdering(this);
  }

  public <E extends T> E max(Iterable<E> paramIterable)
  {
    return max(paramIterable.iterator());
  }

  public <E extends T> E max(@Nullable E paramE1, @Nullable E paramE2)
  {
    if (compare(paramE1, paramE2) >= 0)
      return paramE1;
    return paramE2;
  }

  public <E extends T> E max(@Nullable E paramE1, @Nullable E paramE2, @Nullable E paramE3, E[] paramArrayOfE)
  {
    Object localObject = max(max(paramE1, paramE2), paramE3);
    int i = paramArrayOfE.length;
    for (int j = 0; j < i; j++)
      localObject = max(localObject, paramArrayOfE[j]);
    return localObject;
  }

  public <E extends T> E max(Iterator<E> paramIterator)
  {
    for (Object localObject = paramIterator.next(); paramIterator.hasNext(); localObject = max(localObject, paramIterator.next()));
    return localObject;
  }

  public <E extends T> E min(Iterable<E> paramIterable)
  {
    return min(paramIterable.iterator());
  }

  public <E extends T> E min(@Nullable E paramE1, @Nullable E paramE2)
  {
    if (compare(paramE1, paramE2) <= 0)
      return paramE1;
    return paramE2;
  }

  public <E extends T> E min(@Nullable E paramE1, @Nullable E paramE2, @Nullable E paramE3, E[] paramArrayOfE)
  {
    Object localObject = min(min(paramE1, paramE2), paramE3);
    int i = paramArrayOfE.length;
    for (int j = 0; j < i; j++)
      localObject = min(localObject, paramArrayOfE[j]);
    return localObject;
  }

  public <E extends T> E min(Iterator<E> paramIterator)
  {
    for (Object localObject = paramIterator.next(); paramIterator.hasNext(); localObject = min(localObject, paramIterator.next()));
    return localObject;
  }

  @GwtCompatible(serializable=true)
  public <S extends T> Ordering<S> nullsFirst()
  {
    return new NullsFirstOrdering(this);
  }

  @GwtCompatible(serializable=true)
  public <S extends T> Ordering<S> nullsLast()
  {
    return new NullsLastOrdering(this);
  }

  <T2 extends T> Ordering<Map.Entry<T2, ?>> onKeys()
  {
    return onResultOf(Maps.keyFunction());
  }

  @GwtCompatible(serializable=true)
  public <F> Ordering<F> onResultOf(Function<F, ? extends T> paramFunction)
  {
    return new ByFunctionOrdering(paramFunction, this);
  }

  @GwtCompatible(serializable=true)
  public <S extends T> Ordering<S> reverse()
  {
    return new ReverseOrdering(this);
  }

  public <E extends T> List<E> sortedCopy(Iterable<E> paramIterable)
  {
    Object[] arrayOfObject = (Object[])Iterables.toArray(paramIterable);
    Arrays.sort(arrayOfObject, this);
    return Lists.newArrayList(Arrays.asList(arrayOfObject));
  }
}