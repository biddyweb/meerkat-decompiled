package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

@zzgi
public class zzib<T>
  implements zzia<T>
{
  private final Object zznh = new Object();
  protected int zzrX = 0;
  protected final BlockingQueue<zzib<T>.zza> zzzL = new LinkedBlockingQueue();
  protected T zzzM;

  public int getStatus()
  {
    return this.zzrX;
  }

  public void reject()
  {
    synchronized (this.zznh)
    {
      if (this.zzrX != 0)
        throw new UnsupportedOperationException();
    }
    this.zzrX = -1;
    Iterator localIterator = this.zzzL.iterator();
    while (localIterator.hasNext())
      ((zzib.zza)localIterator.next()).zzzO.run();
  }

  public void zza(zzia.zzd<T> paramzzd, zzia.zza paramzza)
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zzrX == 1)
        {
          paramzzd.zza(this.zzzM);
          return;
        }
        if (this.zzrX == -1)
          paramzza.run();
      }
      if (this.zzrX == 0)
        this.zzzL.add(new zzib.zza(this, paramzzd, paramzza));
    }
  }

  public void zzc(T paramT)
  {
    synchronized (this.zznh)
    {
      if (this.zzrX != 0)
        throw new UnsupportedOperationException();
    }
    this.zzzM = paramT;
    this.zzrX = 1;
    Iterator localIterator = this.zzzL.iterator();
    while (localIterator.hasNext())
      ((zzib.zza)localIterator.next()).zzzN.zza(paramT);
  }
}