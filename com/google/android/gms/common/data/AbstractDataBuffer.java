package com.google.android.gms.common.data;

import android.os.Bundle;
import java.util.Iterator;

public abstract class AbstractDataBuffer<T>
  implements DataBuffer<T>
{
  protected final DataHolder zzMd;

  protected AbstractDataBuffer(DataHolder paramDataHolder)
  {
    this.zzMd = paramDataHolder;
    if (this.zzMd != null)
      this.zzMd.zzg(this);
  }

  @Deprecated
  public final void close()
  {
    release();
  }

  public abstract T get(int paramInt);

  public int getCount()
  {
    if (this.zzMd == null)
      return 0;
    return this.zzMd.getCount();
  }

  @Deprecated
  public boolean isClosed()
  {
    return (this.zzMd == null) || (this.zzMd.isClosed());
  }

  public Iterator<T> iterator()
  {
    return new zzc(this);
  }

  public void release()
  {
    if (this.zzMd != null)
      this.zzMd.close();
  }

  public Iterator<T> singleRefIterator()
  {
    return new zzh(this);
  }

  public Bundle zziu()
  {
    return this.zzMd.zziu();
  }
}