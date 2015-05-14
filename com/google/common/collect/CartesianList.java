package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import javax.annotation.Nullable;

@GwtCompatible
final class CartesianList<E> extends AbstractList<List<E>>
  implements RandomAccess
{
  private final transient ImmutableList<List<E>> axes;
  private final transient int[] axesSizeProduct;

  CartesianList(ImmutableList<List<E>> paramImmutableList)
  {
    this.axes = paramImmutableList;
    int[] arrayOfInt = new int[1 + paramImmutableList.size()];
    arrayOfInt[paramImmutableList.size()] = 1;
    try
    {
      for (int i = -1 + paramImmutableList.size(); i >= 0; i--)
        arrayOfInt[i] = IntMath.checkedMultiply(arrayOfInt[(i + 1)], ((List)paramImmutableList.get(i)).size());
    }
    catch (ArithmeticException localArithmeticException)
    {
      throw new IllegalArgumentException("Cartesian product too large; must have size at most Integer.MAX_VALUE");
    }
    this.axesSizeProduct = arrayOfInt;
  }

  static <E> List<List<E>> create(List<? extends List<? extends E>> paramList)
  {
    ImmutableList.Builder localBuilder = new ImmutableList.Builder(paramList.size());
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      ImmutableList localImmutableList = ImmutableList.copyOf((List)localIterator.next());
      if (localImmutableList.isEmpty())
        return ImmutableList.of();
      localBuilder.add(localImmutableList);
    }
    return new CartesianList(localBuilder.build());
  }

  private int getAxisIndexForProductIndex(int paramInt1, int paramInt2)
  {
    return paramInt1 / this.axesSizeProduct[(paramInt2 + 1)] % ((List)this.axes.get(paramInt2)).size();
  }

  public boolean contains(@Nullable Object paramObject)
  {
    if (!(paramObject instanceof List))
      return false;
    List localList = (List)paramObject;
    if (localList.size() != this.axes.size())
      return false;
    ListIterator localListIterator = localList.listIterator();
    while (localListIterator.hasNext())
    {
      int i = localListIterator.nextIndex();
      if (!((List)this.axes.get(i)).contains(localListIterator.next()))
        return false;
    }
    return true;
  }

  public ImmutableList<E> get(final int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return new ImmutableList()
    {
      public E get(int paramAnonymousInt)
      {
        Preconditions.checkElementIndex(paramAnonymousInt, size());
        int i = CartesianList.this.getAxisIndexForProductIndex(paramInt, paramAnonymousInt);
        return ((List)CartesianList.this.axes.get(paramAnonymousInt)).get(i);
      }

      boolean isPartialView()
      {
        return true;
      }

      public int size()
      {
        return CartesianList.this.axes.size();
      }
    };
  }

  public int size()
  {
    return this.axesSizeProduct[0];
  }
}