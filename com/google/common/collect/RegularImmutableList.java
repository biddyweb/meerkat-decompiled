package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
class RegularImmutableList<E> extends ImmutableList<E>
{
  private final transient Object[] array;
  private final transient int offset;
  private final transient int size;

  RegularImmutableList(Object[] paramArrayOfObject)
  {
    this(paramArrayOfObject, 0, paramArrayOfObject.length);
  }

  RegularImmutableList(Object[] paramArrayOfObject, int paramInt1, int paramInt2)
  {
    this.offset = paramInt1;
    this.size = paramInt2;
    this.array = paramArrayOfObject;
  }

  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    System.arraycopy(this.array, this.offset, paramArrayOfObject, paramInt, this.size);
    return paramInt + this.size;
  }

  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, this.size);
    return this.array[(paramInt + this.offset)];
  }

  public int indexOf(@Nullable Object paramObject)
  {
    if (paramObject == null)
    {
      i = -1;
      return i;
    }
    for (int i = 0; ; i++)
    {
      if (i >= this.size)
        break label42;
      if (this.array[(i + this.offset)].equals(paramObject))
        break;
    }
    label42: return -1;
  }

  boolean isPartialView()
  {
    return this.size != this.array.length;
  }

  public int lastIndexOf(@Nullable Object paramObject)
  {
    if (paramObject == null)
    {
      i = -1;
      return i;
    }
    for (int i = -1 + this.size; ; i--)
    {
      if (i < 0)
        break label43;
      if (this.array[(i + this.offset)].equals(paramObject))
        break;
    }
    label43: return -1;
  }

  public UnmodifiableListIterator<E> listIterator(int paramInt)
  {
    return Iterators.forArray(this.array, this.offset, this.size, paramInt);
  }

  public int size()
  {
    return this.size;
  }

  ImmutableList<E> subListUnchecked(int paramInt1, int paramInt2)
  {
    return new RegularImmutableList(this.array, paramInt1 + this.offset, paramInt2 - paramInt1);
  }
}