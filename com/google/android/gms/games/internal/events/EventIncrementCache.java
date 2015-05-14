package com.google.android.gms.games.internal.events;

import android.os.Handler;
import android.os.Looper;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class EventIncrementCache
{
  final Object zzahN = new Object();
  private Handler zzahO;
  private boolean zzahP;
  private HashMap<String, AtomicInteger> zzahQ;
  private int zzahR;

  public EventIncrementCache(Looper paramLooper, int paramInt)
  {
    this.zzahO = new Handler(paramLooper);
    this.zzahQ = new HashMap();
    this.zzahR = paramInt;
  }

  private void zzog()
  {
    synchronized (this.zzahN)
    {
      this.zzahP = false;
      flush();
      return;
    }
  }

  public void flush()
  {
    synchronized (this.zzahN)
    {
      Iterator localIterator = this.zzahQ.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        zzs((String)localEntry.getKey(), ((AtomicInteger)localEntry.getValue()).get());
      }
    }
    this.zzahQ.clear();
  }

  protected abstract void zzs(String paramString, int paramInt);

  public void zzz(String paramString, int paramInt)
  {
    synchronized (this.zzahN)
    {
      if (!this.zzahP)
      {
        this.zzahP = true;
        this.zzahO.postDelayed(new Runnable()
        {
          public void run()
          {
            EventIncrementCache.zza(EventIncrementCache.this);
          }
        }
        , this.zzahR);
      }
      AtomicInteger localAtomicInteger = (AtomicInteger)this.zzahQ.get(paramString);
      if (localAtomicInteger == null)
      {
        localAtomicInteger = new AtomicInteger();
        this.zzahQ.put(paramString, localAtomicInteger);
      }
      localAtomicInteger.addAndGet(paramInt);
      return;
    }
  }
}