package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class RegularImmutableMap<K, V> extends ImmutableMap<K, V>
{
  private static final double MAX_LOAD_FACTOR = 1.2D;
  private static final long serialVersionUID;
  private final transient ImmutableMapEntry<K, V>[] entries;
  private final transient int mask;
  private final transient ImmutableMapEntry<K, V>[] table;

  RegularImmutableMap(int paramInt, ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    this.entries = createEntryArray(paramInt);
    int i = Hashing.closedTableSize(paramInt, 1.2D);
    this.table = createEntryArray(i);
    this.mask = (i - 1);
    int j = 0;
    if (j < paramInt)
    {
      ImmutableMapEntry.TerminalEntry<?, ?> localTerminalEntry = paramArrayOfTerminalEntry[j];
      Object localObject1 = localTerminalEntry.getKey();
      int k = Hashing.smear(localObject1.hashCode()) & this.mask;
      ImmutableMapEntry localImmutableMapEntry = this.table[k];
      if (localImmutableMapEntry == null);
      for (Object localObject2 = localTerminalEntry; ; localObject2 = new RegularImmutableMap.NonTerminalMapEntry(localTerminalEntry, localImmutableMapEntry))
      {
        this.table[k] = localObject2;
        this.entries[j] = localObject2;
        checkNoConflictInBucket(localObject1, (ImmutableMapEntry)localObject2, localImmutableMapEntry);
        j++;
        break;
      }
    }
  }

  RegularImmutableMap(ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    this(paramArrayOfTerminalEntry.length, paramArrayOfTerminalEntry);
  }

  RegularImmutableMap(Map.Entry<?, ?>[] paramArrayOfEntry)
  {
    int i = paramArrayOfEntry.length;
    this.entries = createEntryArray(i);
    int j = Hashing.closedTableSize(i, 1.2D);
    this.table = createEntryArray(j);
    this.mask = (j - 1);
    int k = 0;
    if (k < i)
    {
      Map.Entry<?, ?> localEntry = paramArrayOfEntry[k];
      Object localObject1 = localEntry.getKey();
      Object localObject2 = localEntry.getValue();
      CollectPreconditions.checkEntryNotNull(localObject1, localObject2);
      int m = Hashing.smear(localObject1.hashCode()) & this.mask;
      ImmutableMapEntry localImmutableMapEntry = this.table[m];
      if (localImmutableMapEntry == null);
      for (Object localObject3 = new ImmutableMapEntry.TerminalEntry(localObject1, localObject2); ; localObject3 = new RegularImmutableMap.NonTerminalMapEntry(localObject1, localObject2, localImmutableMapEntry))
      {
        this.table[m] = localObject3;
        this.entries[k] = localObject3;
        checkNoConflictInBucket(localObject1, (ImmutableMapEntry)localObject3, localImmutableMapEntry);
        k++;
        break;
      }
    }
  }

  private void checkNoConflictInBucket(K paramK, ImmutableMapEntry<K, V> paramImmutableMapEntry1, ImmutableMapEntry<K, V> paramImmutableMapEntry2)
  {
    if (paramImmutableMapEntry2 != null)
    {
      if (!paramK.equals(paramImmutableMapEntry2.getKey()));
      for (boolean bool = true; ; bool = false)
      {
        checkNoConflict(bool, "key", paramImmutableMapEntry1, paramImmutableMapEntry2);
        paramImmutableMapEntry2 = paramImmutableMapEntry2.getNextInKeyBucket();
        break;
      }
    }
  }

  private ImmutableMapEntry<K, V>[] createEntryArray(int paramInt)
  {
    return new ImmutableMapEntry[paramInt];
  }

  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    return new EntrySet(null);
  }

  public V get(@Nullable Object paramObject)
  {
    if (paramObject == null);
    while (true)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode()) & this.mask;
      for (ImmutableMapEntry localImmutableMapEntry = this.table[i]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInKeyBucket())
        if (paramObject.equals(localImmutableMapEntry.getKey()))
          return localImmutableMapEntry.getValue();
    }
  }

  boolean isPartialView()
  {
    return false;
  }

  public int size()
  {
    return this.entries.length;
  }

  private class EntrySet extends ImmutableMapEntrySet<K, V>
  {
    private EntrySet()
    {
    }

    ImmutableList<Map.Entry<K, V>> createAsList()
    {
      return new RegularImmutableAsList(this, RegularImmutableMap.this.entries);
    }

    public UnmodifiableIterator<Map.Entry<K, V>> iterator()
    {
      return asList().iterator();
    }

    ImmutableMap<K, V> map()
    {
      return RegularImmutableMap.this;
    }
  }
}