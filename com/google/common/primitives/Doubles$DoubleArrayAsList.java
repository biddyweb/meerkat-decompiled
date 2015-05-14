package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Doubles$DoubleArrayAsList extends AbstractList<Double>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID;
  final double[] array;
  final int end;
  final int start;

  Doubles$DoubleArrayAsList(double[] paramArrayOfDouble)
  {
    this(paramArrayOfDouble, 0, paramArrayOfDouble.length);
  }

  Doubles$DoubleArrayAsList(double[] paramArrayOfDouble, int paramInt1, int paramInt2)
  {
    this.array = paramArrayOfDouble;
    this.start = paramInt1;
    this.end = paramInt2;
  }

  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Double)) && (Doubles.access$000(this.array, ((Double)paramObject).doubleValue(), this.start, this.end) != -1);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    while (true)
    {
      return true;
      if (!(paramObject instanceof DoubleArrayAsList))
        break;
      DoubleArrayAsList localDoubleArrayAsList = (DoubleArrayAsList)paramObject;
      int i = size();
      if (localDoubleArrayAsList.size() != i)
        return false;
      for (int j = 0; j < i; j++)
        if (this.array[(j + this.start)] != localDoubleArrayAsList.array[(j + localDoubleArrayAsList.start)])
          return false;
    }
    return super.equals(paramObject);
  }

  public Double get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Double.valueOf(this.array[(paramInt + this.start)]);
  }

  public int hashCode()
  {
    int i = 1;
    for (int j = this.start; j < this.end; j++)
      i = i * 31 + Doubles.hashCode(this.array[j]);
    return i;
  }

  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Double))
    {
      int i = Doubles.access$000(this.array, ((Double)paramObject).doubleValue(), this.start, this.end);
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
    if ((paramObject instanceof Double))
    {
      int i = Doubles.access$100(this.array, ((Double)paramObject).doubleValue(), this.start, this.end);
      if (i >= 0)
        return i - this.start;
    }
    return -1;
  }

  public Double set(int paramInt, Double paramDouble)
  {
    Preconditions.checkElementIndex(paramInt, size());
    double d = this.array[(paramInt + this.start)];
    this.array[(paramInt + this.start)] = ((Double)Preconditions.checkNotNull(paramDouble)).doubleValue();
    return Double.valueOf(d);
  }

  public int size()
  {
    return this.end - this.start;
  }

  public List<Double> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2)
      return Collections.emptyList();
    return new DoubleArrayAsList(this.array, paramInt1 + this.start, paramInt2 + this.start);
  }

  double[] toDoubleArray()
  {
    int i = size();
    double[] arrayOfDouble = new double[i];
    System.arraycopy(this.array, this.start, arrayOfDouble, 0, i);
    return arrayOfDouble;
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