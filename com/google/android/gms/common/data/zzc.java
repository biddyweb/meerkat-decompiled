package com.google.android.gms.common.data;

import com.google.android.gms.common.internal.zzx;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class zzc<T>
  implements Iterator<T>
{
  protected final DataBuffer<T> zzNN;
  protected int zzNO;

  public zzc(DataBuffer<T> paramDataBuffer)
  {
    this.zzNN = ((DataBuffer)zzx.zzl(paramDataBuffer));
    this.zzNO = -1;
  }

  public boolean hasNext()
  {
    return this.zzNO < -1 + this.zzNN.getCount();
  }

  public T next()
  {
    if (!hasNext())
      throw new NoSuchElementException("Cannot advance the iterator beyond " + this.zzNO);
    DataBuffer localDataBuffer = this.zzNN;
    int i = 1 + this.zzNO;
    this.zzNO = i;
    return localDataBuffer.get(i);
  }

  public void remove()
  {
    throw new UnsupportedOperationException("Cannot remove elements from a DataBufferIterator");
  }
}