package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Floats$FloatArrayAsList extends AbstractList<Float>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID;
  final float[] array;
  final int end;
  final int start;

  Floats$FloatArrayAsList(float[] paramArrayOfFloat)
  {
    this(paramArrayOfFloat, 0, paramArrayOfFloat.length);
  }

  Floats$FloatArrayAsList(float[] paramArrayOfFloat, int paramInt1, int paramInt2)
  {
    this.array = paramArrayOfFloat;
    this.start = paramInt1;
    this.end = paramInt2;
  }

  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Float)) && (Floats.access$000(this.array, ((Float)paramObject).floatValue(), this.start, this.end) != -1);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    while (true)
    {
      return true;
      if (!(paramObject instanceof FloatArrayAsList))
        break;
      FloatArrayAsList localFloatArrayAsList = (FloatArrayAsList)paramObject;
      int i = size();
      if (localFloatArrayAsList.size() != i)
        return false;
      for (int j = 0; j < i; j++)
        if (this.array[(j + this.start)] != localFloatArrayAsList.array[(j + localFloatArrayAsList.start)])
          return false;
    }
    return super.equals(paramObject);
  }

  public Float get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Float.valueOf(this.array[(paramInt + this.start)]);
  }

  public int hashCode()
  {
    int i = 1;
    for (int j = this.start; j < this.end; j++)
      i = i * 31 + Floats.hashCode(this.array[j]);
    return i;
  }

  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Float))
    {
      int i = Floats.access$000(this.array, ((Float)paramObject).floatValue(), this.start, this.end);
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
    if ((paramObject instanceof Float))
    {
      int i = Floats.access$100(this.array, ((Float)paramObject).floatValue(), this.start, this.end);
      if (i >= 0)
        return i - this.start;
    }
    return -1;
  }

  public Float set(int paramInt, Float paramFloat)
  {
    Preconditions.checkElementIndex(paramInt, size());
    float f = this.array[(paramInt + this.start)];
    this.array[(paramInt + this.start)] = ((Float)Preconditions.checkNotNull(paramFloat)).floatValue();
    return Float.valueOf(f);
  }

  public int size()
  {
    return this.end - this.start;
  }

  public List<Float> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2)
      return Collections.emptyList();
    return new FloatArrayAsList(this.array, paramInt1 + this.start, paramInt2 + this.start);
  }

  float[] toFloatArray()
  {
    int i = size();
    float[] arrayOfFloat = new float[i];
    System.arraycopy(this.array, this.start, arrayOfFloat, 0, i);
    return arrayOfFloat;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(12 * size());
    localStringBuilder.append('[').append(this.array[this.start]);
    for (int i = 1 + this.start; i < this.end; i++)
      localStringBuilder.append(", ").append(this.array[i]);
    return ']';
  }
}