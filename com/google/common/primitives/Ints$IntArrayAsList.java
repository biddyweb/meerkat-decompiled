package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Ints$IntArrayAsList extends AbstractList<Integer>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID;
  final int[] array;
  final int end;
  final int start;

  Ints$IntArrayAsList(int[] paramArrayOfInt)
  {
    this(paramArrayOfInt, 0, paramArrayOfInt.length);
  }

  Ints$IntArrayAsList(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    this.array = paramArrayOfInt;
    this.start = paramInt1;
    this.end = paramInt2;
  }

  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Integer)) && (Ints.access$000(this.array, ((Integer)paramObject).intValue(), this.start, this.end) != -1);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    while (true)
    {
      return true;
      if (!(paramObject instanceof IntArrayAsList))
        break;
      IntArrayAsList localIntArrayAsList = (IntArrayAsList)paramObject;
      int i = size();
      if (localIntArrayAsList.size() != i)
        return false;
      for (int j = 0; j < i; j++)
        if (this.array[(j + this.start)] != localIntArrayAsList.array[(j + localIntArrayAsList.start)])
          return false;
    }
    return super.equals(paramObject);
  }

  public Integer get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Integer.valueOf(this.array[(paramInt + this.start)]);
  }

  public int hashCode()
  {
    int i = 1;
    for (int j = this.start; j < this.end; j++)
      i = i * 31 + Ints.hashCode(this.array[j]);
    return i;
  }

  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Integer))
    {
      int i = Ints.access$000(this.array, ((Integer)paramObject).intValue(), this.start, this.end);
      if (i >= 0)
        return i - this.start;
    }
    return -1;
  }

  public boolean isEmpty()
  {
    return false;
  }

  public int lastIndexOf(Object paramObject)
  {
    if ((paramObject instanceof Integer))
    {
      int i = Ints.access$100(this.array, ((Integer)paramObject).intValue(), this.start, this.end);
      if (i >= 0)
        return i - this.start;
    }
    return -1;
  }

  public Integer set(int paramInt, Integer paramInteger)
  {
    Preconditions.checkElementIndex(paramInt, size());
    int i = this.array[(paramInt + this.start)];
    this.array[(paramInt + this.start)] = ((Integer)Preconditions.checkNotNull(paramInteger)).intValue();
    return Integer.valueOf(i);
  }

  public int size()
  {
    return this.end - this.start;
  }

  public List<Integer> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2)
      return Collections.emptyList();
    return new IntArrayAsList(this.array, paramInt1 + this.start, paramInt2 + this.start);
  }

  int[] toIntArray()
  {
    int i = size();
    int[] arrayOfInt = new int[i];
    System.arraycopy(this.array, this.start, arrayOfInt, 0, i);
    return arrayOfInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(5 * size());
    localStringBuilder.append('[').append(this.array[this.start]);
    for (int i = 1 + this.start; i < this.end; i++)
      localStringBuilder.append(", ").append(this.array[i]);
    return ']';
  }
}