package com.google.android.exoplayer.upstream.cache;

import android.os.ConditionVariable;
import com.google.android.exoplayer.util.Assertions;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableSet;
import java.util.Set;
import java.util.TreeSet;

public class SimpleCache
  implements Cache
{
  private final File cacheDir;
  private final HashMap<String, TreeSet<CacheSpan>> cachedSpans;
  private final CacheEvictor evictor;
  private final HashMap<String, ArrayList<Cache.Listener>> listeners;
  private final HashMap<String, CacheSpan> lockedSpans;
  private long totalSpace = 0L;

  public SimpleCache(File paramFile, CacheEvictor paramCacheEvictor)
  {
    this.cacheDir = paramFile;
    this.evictor = paramCacheEvictor;
    this.lockedSpans = new HashMap();
    this.cachedSpans = new HashMap();
    this.listeners = new HashMap();
    final ConditionVariable localConditionVariable = new ConditionVariable();
    new Thread()
    {
      public void run()
      {
        synchronized (SimpleCache.this)
        {
          localConditionVariable.open();
          SimpleCache.this.initialize();
          return;
        }
      }
    }
    .start();
    localConditionVariable.block();
  }

  private void addSpan(CacheSpan paramCacheSpan)
  {
    TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(paramCacheSpan.key);
    if (localTreeSet == null)
    {
      localTreeSet = new TreeSet();
      this.cachedSpans.put(paramCacheSpan.key, localTreeSet);
    }
    localTreeSet.add(paramCacheSpan);
    this.totalSpace += paramCacheSpan.length;
    notifySpanAdded(paramCacheSpan);
  }

  private CacheSpan getSpan(CacheSpan paramCacheSpan)
  {
    String str = paramCacheSpan.key;
    long l = paramCacheSpan.position;
    TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(str);
    CacheSpan localCacheSpan1;
    if (localTreeSet == null)
      localCacheSpan1 = CacheSpan.createOpenHole(str, paramCacheSpan.position);
    do
    {
      return localCacheSpan1;
      localCacheSpan1 = (CacheSpan)localTreeSet.floor(paramCacheSpan);
      if ((localCacheSpan1 == null) || (localCacheSpan1.position > l) || (l >= localCacheSpan1.position + localCacheSpan1.length))
        break;
    }
    while (localCacheSpan1.file.exists());
    removeStaleSpans();
    return getSpan(paramCacheSpan);
    CacheSpan localCacheSpan2 = (CacheSpan)localTreeSet.ceiling(paramCacheSpan);
    if (localCacheSpan2 == null);
    for (CacheSpan localCacheSpan3 = CacheSpan.createOpenHole(str, paramCacheSpan.position); ; localCacheSpan3 = CacheSpan.createClosedHole(str, paramCacheSpan.position, localCacheSpan2.position - paramCacheSpan.position))
      return localCacheSpan3;
  }

  private void initialize()
  {
    if (!this.cacheDir.exists())
      this.cacheDir.mkdirs();
    File[] arrayOfFile = this.cacheDir.listFiles();
    if (arrayOfFile == null)
      return;
    int i = 0;
    label33: File localFile;
    if (i < arrayOfFile.length)
    {
      localFile = arrayOfFile[i];
      if (localFile.length() != 0L)
        break label63;
      localFile.delete();
    }
    while (true)
    {
      i++;
      break label33;
      break;
      label63: CacheSpan localCacheSpan = CacheSpan.createCacheEntry(localFile);
      if (localCacheSpan == null)
        localFile.delete();
      else
        addSpan(localCacheSpan);
    }
  }

  private void notifySpanAdded(CacheSpan paramCacheSpan)
  {
    ArrayList localArrayList = (ArrayList)this.listeners.get(paramCacheSpan.key);
    if (localArrayList != null)
      for (int i = -1 + localArrayList.size(); i >= 0; i--)
        ((Cache.Listener)localArrayList.get(i)).onSpanAdded(this, paramCacheSpan);
    this.evictor.onSpanAdded(this, paramCacheSpan);
  }

  private void notifySpanRemoved(CacheSpan paramCacheSpan)
  {
    ArrayList localArrayList = (ArrayList)this.listeners.get(paramCacheSpan.key);
    if (localArrayList != null)
      for (int i = -1 + localArrayList.size(); i >= 0; i--)
        ((Cache.Listener)localArrayList.get(i)).onSpanRemoved(this, paramCacheSpan);
    this.evictor.onSpanRemoved(this, paramCacheSpan);
  }

  private void notifySpanTouched(CacheSpan paramCacheSpan1, CacheSpan paramCacheSpan2)
  {
    ArrayList localArrayList = (ArrayList)this.listeners.get(paramCacheSpan1.key);
    if (localArrayList != null)
      for (int i = -1 + localArrayList.size(); i >= 0; i--)
        ((Cache.Listener)localArrayList.get(i)).onSpanTouched(this, paramCacheSpan1, paramCacheSpan2);
    this.evictor.onSpanTouched(this, paramCacheSpan1, paramCacheSpan2);
  }

  private void removeStaleSpans()
  {
    Iterator localIterator1 = this.cachedSpans.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Iterator localIterator2 = ((TreeSet)((Map.Entry)localIterator1.next()).getValue()).iterator();
      int i = 1;
      while (localIterator2.hasNext())
      {
        CacheSpan localCacheSpan = (CacheSpan)localIterator2.next();
        if (!localCacheSpan.file.exists())
        {
          localIterator2.remove();
          if (localCacheSpan.isCached)
            this.totalSpace -= localCacheSpan.length;
          notifySpanRemoved(localCacheSpan);
        }
        else
        {
          i = 0;
        }
      }
      if (i != 0)
        localIterator1.remove();
    }
  }

  private CacheSpan startReadWriteNonBlocking(CacheSpan paramCacheSpan)
  {
    try
    {
      CacheSpan localCacheSpan1 = getSpan(paramCacheSpan);
      CacheSpan localCacheSpan2;
      if (localCacheSpan1.isCached)
      {
        TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(localCacheSpan1.key);
        Assertions.checkState(localTreeSet.remove(localCacheSpan1));
        CacheSpan localCacheSpan3 = localCacheSpan1.touch();
        localTreeSet.add(localCacheSpan3);
        notifySpanTouched(localCacheSpan1, localCacheSpan3);
        localCacheSpan2 = localCacheSpan3;
      }
      while (true)
      {
        return localCacheSpan2;
        if (!this.lockedSpans.containsKey(paramCacheSpan.key))
        {
          this.lockedSpans.put(paramCacheSpan.key, localCacheSpan1);
          localCacheSpan2 = localCacheSpan1;
        }
        else
        {
          localCacheSpan2 = null;
        }
      }
    }
    finally
    {
    }
  }

  public NavigableSet<CacheSpan> addListener(String paramString, Cache.Listener paramListener)
  {
    try
    {
      ArrayList localArrayList = (ArrayList)this.listeners.get(paramString);
      if (localArrayList == null)
      {
        localArrayList = new ArrayList();
        this.listeners.put(paramString, localArrayList);
      }
      localArrayList.add(paramListener);
      NavigableSet localNavigableSet = getCachedSpans(paramString);
      return localNavigableSet;
    }
    finally
    {
    }
  }

  public void commitFile(File paramFile)
  {
    while (true)
    {
      CacheSpan localCacheSpan;
      try
      {
        localCacheSpan = CacheSpan.createCacheEntry(paramFile);
        boolean bool1;
        if (localCacheSpan != null)
        {
          bool1 = true;
          Assertions.checkState(bool1);
          Assertions.checkState(this.lockedSpans.containsKey(localCacheSpan.key));
          boolean bool2 = paramFile.exists();
          if (bool2);
        }
        else
        {
          bool1 = false;
          continue;
        }
        if (paramFile.length() == 0L)
        {
          paramFile.delete();
          continue;
        }
      }
      finally
      {
      }
      addSpan(localCacheSpan);
      notifyAll();
    }
  }

  public long getCacheSpace()
  {
    try
    {
      long l = this.totalSpace;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public NavigableSet<CacheSpan> getCachedSpans(String paramString)
  {
    try
    {
      TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(paramString);
      if (localTreeSet == null);
      for (Object localObject2 = null; ; localObject2 = new TreeSet(localTreeSet))
        return localObject2;
    }
    finally
    {
    }
  }

  public Set<String> getKeys()
  {
    try
    {
      HashSet localHashSet = new HashSet(this.cachedSpans.keySet());
      return localHashSet;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean isCached(String paramString, long paramLong1, long paramLong2)
  {
    while (true)
    {
      try
      {
        TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(paramString);
        if (localTreeSet == null)
        {
          bool = false;
          return bool;
        }
        CacheSpan localCacheSpan1 = (CacheSpan)localTreeSet.floor(CacheSpan.createLookup(paramString, paramLong1));
        if ((localCacheSpan1 != null) && (localCacheSpan1.position + localCacheSpan1.length > paramLong1))
        {
          long l1 = paramLong1 + paramLong2;
          long l2 = localCacheSpan1.position + localCacheSpan1.length;
          if (l2 >= l1)
          {
            bool = true;
            continue;
          }
          Iterator localIterator = localTreeSet.tailSet(localCacheSpan1, false).iterator();
          if (localIterator.hasNext())
          {
            CacheSpan localCacheSpan2 = (CacheSpan)localIterator.next();
            if (localCacheSpan2.position > l2)
            {
              bool = false;
              continue;
            }
            long l3 = Math.max(l2, localCacheSpan2.position + localCacheSpan2.length);
            l2 = l3;
            if (l2 < l1)
              continue;
            bool = true;
            continue;
          }
          bool = false;
          continue;
        }
      }
      finally
      {
      }
      boolean bool = false;
    }
  }

  public void releaseHoleSpan(CacheSpan paramCacheSpan)
  {
    try
    {
      if (paramCacheSpan == this.lockedSpans.remove(paramCacheSpan.key));
      for (boolean bool = true; ; bool = false)
      {
        Assertions.checkState(bool);
        notifyAll();
        return;
      }
    }
    finally
    {
    }
  }

  public void removeListener(String paramString, Cache.Listener paramListener)
  {
    try
    {
      ArrayList localArrayList = (ArrayList)this.listeners.get(paramString);
      if (localArrayList != null)
      {
        localArrayList.remove(paramListener);
        if (localArrayList.isEmpty())
          this.listeners.remove(paramString);
      }
      return;
    }
    finally
    {
    }
  }

  public void removeSpan(CacheSpan paramCacheSpan)
  {
    try
    {
      TreeSet localTreeSet = (TreeSet)this.cachedSpans.get(paramCacheSpan.key);
      this.totalSpace -= paramCacheSpan.length;
      Assertions.checkState(localTreeSet.remove(paramCacheSpan));
      paramCacheSpan.file.delete();
      if (localTreeSet.isEmpty())
        this.cachedSpans.remove(paramCacheSpan.key);
      notifySpanRemoved(paramCacheSpan);
      return;
    }
    finally
    {
    }
  }

  public File startFile(String paramString, long paramLong1, long paramLong2)
  {
    try
    {
      Assertions.checkState(this.lockedSpans.containsKey(paramString));
      if (!this.cacheDir.exists())
      {
        removeStaleSpans();
        this.cacheDir.mkdirs();
      }
      this.evictor.onStartFile(this, paramString, paramLong1, paramLong2);
      File localFile = CacheSpan.getCacheFileName(this.cacheDir, paramString, paramLong1, System.currentTimeMillis());
      return localFile;
    }
    finally
    {
    }
  }

  public CacheSpan startReadWrite(String paramString, long paramLong)
    throws InterruptedException
  {
    try
    {
      CacheSpan localCacheSpan1 = CacheSpan.createLookup(paramString, paramLong);
      while (true)
      {
        CacheSpan localCacheSpan2 = startReadWriteNonBlocking(localCacheSpan1);
        if (localCacheSpan2 != null)
          return localCacheSpan2;
        wait();
      }
    }
    finally
    {
    }
  }

  public CacheSpan startReadWriteNonBlocking(String paramString, long paramLong)
  {
    try
    {
      CacheSpan localCacheSpan = startReadWriteNonBlocking(CacheSpan.createLookup(paramString, paramLong));
      return localCacheSpan;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}