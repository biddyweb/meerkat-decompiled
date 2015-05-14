package com.google.android.gms.games.internal.events;

import java.util.concurrent.atomic.AtomicReference;

public abstract class EventIncrementManager
{
  private final AtomicReference<EventIncrementCache> zzahT = new AtomicReference();

  public void flush()
  {
    EventIncrementCache localEventIncrementCache = (EventIncrementCache)this.zzahT.get();
    if (localEventIncrementCache != null)
      localEventIncrementCache.flush();
  }

  protected abstract EventIncrementCache zznM();

  public void zzp(String paramString, int paramInt)
  {
    EventIncrementCache localEventIncrementCache = (EventIncrementCache)this.zzahT.get();
    if (localEventIncrementCache == null)
    {
      localEventIncrementCache = zznM();
      if (!this.zzahT.compareAndSet(null, localEventIncrementCache))
        localEventIncrementCache = (EventIncrementCache)this.zzahT.get();
    }
    localEventIncrementCache.zzz(paramString, paramInt);
  }
}