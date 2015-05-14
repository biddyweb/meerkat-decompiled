package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableSet<E> extends ImmutableCollection<E>
  implements Set<E>
{
  private static final int CUTOFF = 751619276;
  private static final double DESIRED_LOAD_FACTOR = 0.7D;
  static final int MAX_TABLE_SIZE = 1073741824;

  public static <E> Builder<E> builder()
  {
    return new Builder();
  }

  @VisibleForTesting
  static int chooseTableSize(int paramInt)
  {
    int i = 1073741824;
    if (paramInt < 751619276)
    {
      i = Integer.highestOneBit(paramInt - 1) << 1;
      while (0.7D * i < paramInt)
        i <<= 1;
    }
    if (paramInt < i);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "collection too large");
      return i;
    }
  }

  private static <E> ImmutableSet<E> construct(int paramInt, Object[] paramArrayOfObject)
  {
    int i;
    Object[] arrayOfObject1;
    int j;
    int k;
    int m;
    int n;
    Object localObject2;
    int i2;
    switch (paramInt)
    {
    default:
      i = chooseTableSize(paramInt);
      arrayOfObject1 = new Object[i];
      j = i - 1;
      k = 0;
      m = 0;
      n = 0;
      if (m < paramInt)
      {
        localObject2 = ObjectArrays.checkElementNotNull(paramArrayOfObject[m], m);
        i2 = localObject2.hashCode();
      }
      break;
    case 0:
    case 1:
      label160: for (int i3 = Hashing.smear(i2); ; i3++)
      {
        int i4 = i3 & j;
        Object localObject3 = arrayOfObject1[i4];
        int i5;
        if (localObject3 == null)
        {
          i5 = n + 1;
          paramArrayOfObject[n] = localObject2;
          arrayOfObject1[i4] = localObject2;
          k += i2;
        }
        while (true)
        {
          m++;
          n = i5;
          break;
          return of();
          return of(paramArrayOfObject[0]);
          if (!localObject3.equals(localObject2))
            break label160;
          i5 = n;
        }
      }
    }
    Arrays.fill(paramArrayOfObject, n, paramInt, null);
    if (n == 1)
    {
      Object localObject1 = paramArrayOfObject[0];
      SingletonImmutableSet localSingletonImmutableSet = new SingletonImmutableSet(localObject1, k);
      return localSingletonImmutableSet;
    }
    if (i != chooseTableSize(n))
      return construct(n, paramArrayOfObject);
    int i1 = paramArrayOfObject.length;
    if (n < i1);
    for (Object[] arrayOfObject2 = ObjectArrays.arraysCopyOf(paramArrayOfObject, n); ; arrayOfObject2 = paramArrayOfObject)
    {
      RegularImmutableSet localRegularImmutableSet = new RegularImmutableSet(arrayOfObject2, k, arrayOfObject1, j);
      return localRegularImmutableSet;
    }
  }

  public static <E> ImmutableSet<E> copyOf(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return copyOf((Collection)paramIterable);
    return copyOf(paramIterable.iterator());
  }

  public static <E> ImmutableSet<E> copyOf(Collection<? extends E> paramCollection)
  {
    if (((paramCollection instanceof ImmutableSet)) && (!(paramCollection instanceof ImmutableSortedSet)))
    {
      ImmutableSet localImmutableSet = (ImmutableSet)paramCollection;
      if (!localImmutableSet.isPartialView())
        return localImmutableSet;
    }
    else if ((paramCollection instanceof EnumSet))
    {
      return copyOfEnumSet((EnumSet)paramCollection);
    }
    Object[] arrayOfObject = paramCollection.toArray();
    return construct(arrayOfObject.length, arrayOfObject);
  }

  public static <E> ImmutableSet<E> copyOf(Iterator<? extends E> paramIterator)
  {
    if (!paramIterator.hasNext())
      return of();
    Object localObject = paramIterator.next();
    if (!paramIterator.hasNext())
      return of(localObject);
    return new Builder().add(localObject).addAll(paramIterator).build();
  }

  public static <E> ImmutableSet<E> copyOf(E[] paramArrayOfE)
  {
    switch (paramArrayOfE.length)
    {
    default:
      return construct(paramArrayOfE.length, (Object[])paramArrayOfE.clone());
    case 0:
      return of();
    case 1:
    }
    return of(paramArrayOfE[0]);
  }

  private static <E extends Enum<E>> ImmutableSet<E> copyOfEnumSet(EnumSet<E> paramEnumSet)
  {
    return ImmutableEnumSet.asImmutable(EnumSet.copyOf(paramEnumSet));
  }

  public static <E> ImmutableSet<E> of()
  {
    return EmptyImmutableSet.INSTANCE;
  }

  public static <E> ImmutableSet<E> of(E paramE)
  {
    return new SingletonImmutableSet(paramE);
  }

  public static <E> ImmutableSet<E> of(E paramE1, E paramE2)
  {
    return construct(2, new Object[] { paramE1, paramE2 });
  }

  public static <E> ImmutableSet<E> of(E paramE1, E paramE2, E paramE3)
  {
    return construct(3, new Object[] { paramE1, paramE2, paramE3 });
  }

  public static <E> ImmutableSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4)
  {
    return construct(4, new Object[] { paramE1, paramE2, paramE3, paramE4 });
  }

  public static <E> ImmutableSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5)
  {
    return construct(5, new Object[] { paramE1, paramE2, paramE3, paramE4, paramE5 });
  }

  public static <E> ImmutableSet<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5, E paramE6, E[] paramArrayOfE)
  {
    Object[] arrayOfObject = new Object[6 + paramArrayOfE.length];
    arrayOfObject[0] = paramE1;
    arrayOfObject[1] = paramE2;
    arrayOfObject[2] = paramE3;
    arrayOfObject[3] = paramE4;
    arrayOfObject[4] = paramE5;
    arrayOfObject[5] = paramE6;
    System.arraycopy(paramArrayOfE, 0, arrayOfObject, 6, paramArrayOfE.length);
    return construct(arrayOfObject.length, arrayOfObject);
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this)
      return true;
    if (((paramObject instanceof ImmutableSet)) && (isHashCodeFast()) && (((ImmutableSet)paramObject).isHashCodeFast()) && (hashCode() != paramObject.hashCode()))
      return false;
    return Sets.equalsImpl(this, paramObject);
  }

  public int hashCode()
  {
    return Sets.hashCodeImpl(this);
  }

  boolean isHashCodeFast()
  {
    return false;
  }

  public abstract UnmodifiableIterator<E> iterator();

  Object writeReplace()
  {
    return new SerializedForm(toArray());
  }

  public static class Builder<E> extends ImmutableCollection.ArrayBasedBuilder<E>
  {
    public Builder()
    {
      this(4);
    }

    Builder(int paramInt)
    {
      super();
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

    public ImmutableSet<E> build()
    {
      ImmutableSet localImmutableSet = ImmutableSet.construct(this.size, this.contents);
      this.size = localImmutableSet.size();
      return localImmutableSet;
    }
  }

  private static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID;
    final Object[] elements;

    SerializedForm(Object[] paramArrayOfObject)
    {
      this.elements = paramArrayOfObject;
    }

    Object readResolve()
    {
      return ImmutableSet.copyOf(this.elements);
    }
  }
}