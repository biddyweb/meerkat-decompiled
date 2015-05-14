package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
class RegularImmutableBiMap<K, V> extends ImmutableBiMap<K, V>
{
  static final double MAX_LOAD_FACTOR = 1.2D;
  private final transient ImmutableMapEntry<K, V>[] entries;
  private final transient int hashCode;
  private transient ImmutableBiMap<V, K> inverse;
  private final transient ImmutableMapEntry<K, V>[] keyTable;
  private final transient int mask;
  private final transient ImmutableMapEntry<K, V>[] valueTable;

  RegularImmutableBiMap(int paramInt, ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    int i = Hashing.closedTableSize(paramInt, 1.2D);
    this.mask = (i - 1);
    ImmutableMapEntry[] arrayOfImmutableMapEntry1 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry2 = createEntryArray(i);
    ImmutableMapEntry[] arrayOfImmutableMapEntry3 = createEntryArray(paramInt);
    int j = 0;
    int k = 0;
    if (k < paramInt)
    {
      ImmutableMapEntry.TerminalEntry<?, ?> localTerminalEntry = paramArrayOfTerminalEntry[k];
      Object localObject1 = localTerminalEntry.getKey();
      Object localObject2 = localTerminalEntry.getValue();
      int m = localObject1.hashCode();
      int n = localObject2.hashCode();
      int i1 = Hashing.smear(m) & this.mask;
      int i2 = Hashing.smear(n) & this.mask;
      ImmutableMapEntry localImmutableMapEntry1 = arrayOfImmutableMapEntry1[i1];
      ImmutableMapEntry localImmutableMapEntry2 = localImmutableMapEntry1;
      if (localImmutableMapEntry2 != null)
      {
        if (!localObject1.equals(localImmutableMapEntry2.getKey()));
        for (boolean bool2 = true; ; bool2 = false)
        {
          checkNoConflict(bool2, "key", localTerminalEntry, localImmutableMapEntry2);
          localImmutableMapEntry2 = localImmutableMapEntry2.getNextInKeyBucket();
          break;
        }
      }
      ImmutableMapEntry localImmutableMapEntry3 = arrayOfImmutableMapEntry2[i2];
      ImmutableMapEntry localImmutableMapEntry4 = localImmutableMapEntry3;
      if (localImmutableMapEntry4 != null)
      {
        if (!localObject2.equals(localImmutableMapEntry4.getValue()));
        for (boolean bool1 = true; ; bool1 = false)
        {
          checkNoConflict(bool1, "value", localTerminalEntry, localImmutableMapEntry4);
          localImmutableMapEntry4 = localImmutableMapEntry4.getNextInValueBucket();
          break;
        }
      }
      if ((localImmutableMapEntry1 == null) && (localImmutableMapEntry3 == null));
      for (Object localObject3 = localTerminalEntry; ; localObject3 = new NonTerminalBiMapEntry(localTerminalEntry, localImmutableMapEntry1, localImmutableMapEntry3))
      {
        arrayOfImmutableMapEntry1[i1] = localObject3;
        arrayOfImmutableMapEntry2[i2] = localObject3;
        arrayOfImmutableMapEntry3[k] = localObject3;
        j += (m ^ n);
        k++;
        break;
      }
    }
    this.keyTable = arrayOfImmutableMapEntry1;
    this.valueTable = arrayOfImmutableMapEntry2;
    this.entries = arrayOfImmutableMapEntry3;
    this.hashCode = j;
  }

  RegularImmutableBiMap(ImmutableMapEntry.TerminalEntry<?, ?>[] paramArrayOfTerminalEntry)
  {
    this(paramArrayOfTerminalEntry.length, paramArrayOfTerminalEntry);
  }

  RegularImmutableBiMap(Map.Entry<?, ?>[] paramArrayOfEntry)
  {
    int i = paramArrayOfEntry.length;
    int j = Hashing.closedTableSize(i, 1.2D);
    this.mask = (j - 1);
    ImmutableMapEntry[] arrayOfImmutableMapEntry1 = createEntryArray(j);
    ImmutableMapEntry[] arrayOfImmutableMapEntry2 = createEntryArray(j);
    ImmutableMapEntry[] arrayOfImmutableMapEntry3 = createEntryArray(i);
    int k = 0;
    int m = 0;
    if (m < i)
    {
      Map.Entry<?, ?> localEntry = paramArrayOfEntry[m];
      Object localObject1 = localEntry.getKey();
      Object localObject2 = localEntry.getValue();
      CollectPreconditions.checkEntryNotNull(localObject1, localObject2);
      int n = localObject1.hashCode();
      int i1 = localObject2.hashCode();
      int i2 = Hashing.smear(n) & this.mask;
      int i3 = Hashing.smear(i1) & this.mask;
      ImmutableMapEntry localImmutableMapEntry1 = arrayOfImmutableMapEntry1[i2];
      ImmutableMapEntry localImmutableMapEntry2 = localImmutableMapEntry1;
      if (localImmutableMapEntry2 != null)
      {
        if (!localObject1.equals(localImmutableMapEntry2.getKey()));
        for (boolean bool2 = true; ; bool2 = false)
        {
          checkNoConflict(bool2, "key", localEntry, localImmutableMapEntry2);
          localImmutableMapEntry2 = localImmutableMapEntry2.getNextInKeyBucket();
          break;
        }
      }
      ImmutableMapEntry localImmutableMapEntry3 = arrayOfImmutableMapEntry2[i3];
      ImmutableMapEntry localImmutableMapEntry4 = localImmutableMapEntry3;
      if (localImmutableMapEntry4 != null)
      {
        if (!localObject2.equals(localImmutableMapEntry4.getValue()));
        for (boolean bool1 = true; ; bool1 = false)
        {
          checkNoConflict(bool1, "value", localEntry, localImmutableMapEntry4);
          localImmutableMapEntry4 = localImmutableMapEntry4.getNextInValueBucket();
          break;
        }
      }
      if ((localImmutableMapEntry1 == null) && (localImmutableMapEntry3 == null));
      for (Object localObject3 = new ImmutableMapEntry.TerminalEntry(localObject1, localObject2); ; localObject3 = new NonTerminalBiMapEntry(localObject1, localObject2, localImmutableMapEntry1, localImmutableMapEntry3))
      {
        arrayOfImmutableMapEntry1[i2] = localObject3;
        arrayOfImmutableMapEntry2[i3] = localObject3;
        arrayOfImmutableMapEntry3[m] = localObject3;
        k += (n ^ i1);
        m++;
        break;
      }
    }
    this.keyTable = arrayOfImmutableMapEntry1;
    this.valueTable = arrayOfImmutableMapEntry2;
    this.entries = arrayOfImmutableMapEntry3;
    this.hashCode = k;
  }

  private static <K, V> ImmutableMapEntry<K, V>[] createEntryArray(int paramInt)
  {
    return new ImmutableMapEntry[paramInt];
  }

  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    return new RegularImmutableBiMap.1(this);
  }

  @Nullable
  public V get(@Nullable Object paramObject)
  {
    if (paramObject == null);
    while (true)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode()) & this.mask;
      for (ImmutableMapEntry localImmutableMapEntry = this.keyTable[i]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInKeyBucket())
        if (paramObject.equals(localImmutableMapEntry.getKey()))
          return localImmutableMapEntry.getValue();
    }
  }

  public ImmutableBiMap<V, K> inverse()
  {
    Object localObject = this.inverse;
    if (localObject == null)
    {
      localObject = new RegularImmutableBiMap.Inverse(this, null);
      this.inverse = ((ImmutableBiMap)localObject);
    }
    return localObject;
  }

  boolean isPartialView()
  {
    return false;
  }

  public int size()
  {
    return this.entries.length;
  }

  private static final class NonTerminalBiMapEntry<K, V> extends ImmutableMapEntry<K, V>
  {

    @Nullable
    private final ImmutableMapEntry<K, V> nextInKeyBucket;

    @Nullable
    private final ImmutableMapEntry<K, V> nextInValueBucket;

    NonTerminalBiMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry3)
    {
      super();
      this.nextInKeyBucket = paramImmutableMapEntry2;
      this.nextInValueBucket = paramImmutableMapEntry3;
    }

    NonTerminalBiMapEntry(K paramK, V paramV, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2)
    {
      super(paramV);
      this.nextInKeyBucket = paramImmutableMapEntry1;
      this.nextInValueBucket = paramImmutableMapEntry2;
    }

    @Nullable
    ImmutableMapEntry<K, V> getNextInKeyBucket()
    {
      return this.nextInKeyBucket;
    }

    @Nullable
    ImmutableMapEntry<K, V> getNextInValueBucket()
    {
      return this.nextInValueBucket;
    }
  }
}