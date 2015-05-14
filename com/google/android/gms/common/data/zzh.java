package com.google.android.gms.common.data;

import java.util.NoSuchElementException;

public class zzh<T> extends zzc<T>
{
  private T zzOk;

  public zzh(DataBuffer<T> paramDataBuffer)
  {
    super(paramDataBuffer);
  }

  public T next()
  {
    if (!hasNext())
      throw new NoSuchElementException("Cannot advance the iterator beyond " + this.zzNO);
    this.zzNO = (1 + this.zzNO);
    if (this.zzNO == 0)
    {
      this.zzOk = this.zzNN.get(0);
      if (!(this.zzOk instanceof zzd))
        throw new IllegalStateException("DataBuffer reference of type " + this.zzOk.getClass() + " is not movable");
    }
    else
    {
      ((zzd)this.zzOk).zzav(this.zzNO);
    }
    return this.zzOk;
  }
}