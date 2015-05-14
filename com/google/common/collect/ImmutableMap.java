package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableMap<K, V>
  implements Map<K, V>, Serializable
{
  private static final Map.Entry<?, ?>[] EMPTY_ENTRY_ARRAY = new Map.Entry[0];
  private transient ImmutableSet<Map.Entry<K, V>> entrySet;
  private transient ImmutableSet<K> keySet;
  private transient ImmutableSetMultimap<K, V> multimapView;
  private transient ImmutableCollection<V> values;

  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }

  static void checkNoConflict(boolean paramBoolean, String paramString, Map.Entry<?, ?> paramEntry1, Map.Entry<?, ?> paramEntry2)
  {
    if (!paramBoolean)
    {
      String str1 = String.valueOf(String.valueOf(paramString));
      String str2 = String.valueOf(String.valueOf(paramEntry1));
      String str3 = String.valueOf(String.valueOf(paramEntry2));
      throw new IllegalArgumentException(34 + str1.length() + str2.length() + str3.length() + "Multiple entries with same " + str1 + ": " + str2 + " and " + str3);
    }
  }

  public static <K, V> ImmutableMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    if (((paramMap instanceof ImmutableMap)) && (!(paramMap instanceof ImmutableSortedMap)))
    {
      ImmutableMap localImmutableMap = (ImmutableMap)paramMap;
      if (!localImmutableMap.isPartialView())
        return localImmutableMap;
    }
    else if ((paramMap instanceof EnumMap))
    {
      return copyOfEnumMapUnsafe(paramMap);
    }
    Map.Entry[] arrayOfEntry = (Map.Entry[])paramMap.entrySet().toArray(EMPTY_ENTRY_ARRAY);
    switch (arrayOfEntry.length)
    {
    default:
      return new RegularImmutableMap(arrayOfEntry);
    case 0:
      return of();
    case 1:
    }
    Map.Entry localEntry = arrayOfEntry[0];
    return of(localEntry.getKey(), localEntry.getValue());
  }

  private static <K extends Enum<K>, V> ImmutableMap<K, V> copyOfEnumMap(Map<K, ? extends V> paramMap)
  {
    EnumMap localEnumMap = new EnumMap(paramMap);
    Iterator localIterator = localEnumMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      CollectPreconditions.checkEntryNotNull(localEntry.getKey(), localEntry.getValue());
    }
    return ImmutableEnumMap.asImmutable(localEnumMap);
  }

  private static <K, V> ImmutableMap<K, V> copyOfEnumMapUnsafe(Map<? extends K, ? extends V> paramMap)
  {
    return copyOfEnumMap((EnumMap)paramMap);
  }

  private ImmutableSetMultimap<K, V> createMultimapView()
  {
    ImmutableMap localImmutableMap = viewMapValuesAsSingletonSets();
    return new ImmutableSetMultimap(localImmutableMap, localImmutableMap.size(), null);
  }

  static <K, V> ImmutableMapEntry.TerminalEntry<K, V> entryOf(K paramK, V paramV)
  {
    CollectPreconditions.checkEntryNotNull(paramK, paramV);
    return new ImmutableMapEntry.TerminalEntry(paramK, paramV);
  }

  public static <K, V> ImmutableMap<K, V> of()
  {
    return ImmutableBiMap.of();
  }

  public static <K, V> ImmutableMap<K, V> of(K paramK, V paramV)
  {
    return ImmutableBiMap.of(paramK, paramV);
  }

  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[2];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    return new RegularImmutableMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[3];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    return new RegularImmutableMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[4];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    arrayOfTerminalEntry[3] = entryOf(paramK4, paramV4);
    return new RegularImmutableMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[5];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    arrayOfTerminalEntry[3] = entryOf(paramK4, paramV4);
    arrayOfTerminalEntry[4] = entryOf(paramK5, paramV5);
    return new RegularImmutableMap(arrayOfTerminalEntry);
  }

  private ImmutableMap<K, ImmutableSet<V>> viewMapValuesAsSingletonSets()
  {
    return new MapViewOfValuesAsSingletonSets(this);
  }

  @Beta
  public ImmutableSetMultimap<K, V> asMultimap()
  {
    ImmutableSetMultimap localImmutableSetMultimap = this.multimapView;
    if (localImmutableSetMultimap == null)
    {
      localImmutableSetMultimap = createMultimapView();
      this.multimapView = localImmutableSetMultimap;
    }
    return localImmutableSetMultimap;
  }

  @Deprecated
  public final void clear()
  {
    throw new UnsupportedOperationException();
  }

  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    return values().contains(paramObject);
  }

  abstract ImmutableSet<Map.Entry<K, V>> createEntrySet();

  ImmutableSet<K> createKeySet()
  {
    return new ImmutableMapKeySet(this);
  }

  public ImmutableSet<Map.Entry<K, V>> entrySet()
  {
    ImmutableSet localImmutableSet = this.entrySet;
    if (localImmutableSet == null)
    {
      localImmutableSet = createEntrySet();
      this.entrySet = localImmutableSet;
    }
    return localImmutableSet;
  }

  public boolean equals(@Nullable Object paramObject)
  {
    return Maps.equalsImpl(this, paramObject);
  }

  public abstract V get(@Nullable Object paramObject);

  public int hashCode()
  {
    return entrySet().hashCode();
  }

  public boolean isEmpty()
  {
    return size() == 0;
  }

  abstract boolean isPartialView();

  public ImmutableSet<K> keySet()
  {
    ImmutableSet localImmutableSet = this.keySet;
    if (localImmutableSet == null)
    {
      localImmutableSet = createKeySet();
      this.keySet = localImmutableSet;
    }
    return localImmutableSet;
  }

  @Deprecated
  public final V put(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }

  @Deprecated
  public final void putAll(Map<? extends K, ? extends V> paramMap)
  {
    throw new UnsupportedOperationException();
  }

  @Deprecated
  public final V remove(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }

  public String toString()
  {
    return Maps.toStringImpl(this);
  }

  public ImmutableCollection<V> values()
  {
    Object localObject = this.values;
    if (localObject == null)
    {
      localObject = new ImmutableMapValues(this);
      this.values = ((ImmutableCollection)localObject);
    }
    return localObject;
  }

  Object writeReplace()
  {
    return new SerializedForm(this);
  }

  public static class Builder<K, V>
  {
    ImmutableMapEntry.TerminalEntry<K, V>[] entries;
    int size;

    public Builder()
    {
      this(4);
    }

    Builder(int paramInt)
    {
      this.entries = new ImmutableMapEntry.TerminalEntry[paramInt];
      this.size = 0;
    }

    private void ensureCapacity(int paramInt)
    {
      if (paramInt > this.entries.length)
        this.entries = ((ImmutableMapEntry.TerminalEntry[])ObjectArrays.arraysCopyOf(this.entries, ImmutableCollection.Builder.expandedCapacity(this.entries.length, paramInt)));
    }

    public ImmutableMap<K, V> build()
    {
      switch (this.size)
      {
      default:
        return new RegularImmutableMap(this.size, this.entries);
      case 0:
        return ImmutableMap.of();
      case 1:
      }
      return ImmutableMap.of(this.entries[0].getKey(), this.entries[0].getValue());
    }

    public Builder<K, V> put(K paramK, V paramV)
    {
      ensureCapacity(1 + this.size);
      ImmutableMapEntry.TerminalEntry localTerminalEntry = ImmutableMap.entryOf(paramK, paramV);
      ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = this.entries;
      int i = this.size;
      this.size = (i + 1);
      arrayOfTerminalEntry[i] = localTerminalEntry;
      return this;
    }

    public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
    {
      return put(paramEntry.getKey(), paramEntry.getValue());
    }

    public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
    {
      ensureCapacity(this.size + paramMap.size());
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
        put((Map.Entry)localIterator.next());
      return this;
    }
  }

  private static final class MapViewOfValuesAsSingletonSets<K, V> extends ImmutableMap<K, ImmutableSet<V>>
  {
    private final ImmutableMap<K, V> delegate;

    MapViewOfValuesAsSingletonSets(ImmutableMap<K, V> paramImmutableMap)
    {
      this.delegate = ((ImmutableMap)Preconditions.checkNotNull(paramImmutableMap));
    }

    public boolean containsKey(@Nullable Object paramObject)
    {
      return this.delegate.containsKey(paramObject);
    }

    ImmutableSet<Map.Entry<K, ImmutableSet<V>>> createEntrySet()
    {
      return new ImmutableMapEntrySet()
      {
        public UnmodifiableIterator<Map.Entry<K, ImmutableSet<V>>> iterator()
        {
          return new UnmodifiableIterator()
          {
            public boolean hasNext()
            {
              return this.val$backingIterator.hasNext();
            }

            public Map.Entry<K, ImmutableSet<V>> next()
            {
              return new AbstractMapEntry()
              {
                public K getKey()
                {
                  return this.val$backingEntry.getKey();
                }

                public ImmutableSet<V> getValue()
                {
                  return ImmutableSet.of(this.val$backingEntry.getValue());
                }
              };
            }
          };
        }

        ImmutableMap<K, ImmutableSet<V>> map()
        {
          return ImmutableMap.MapViewOfValuesAsSingletonSets.this;
        }
      };
    }

    public ImmutableSet<V> get(@Nullable Object paramObject)
    {
      Object localObject = this.delegate.get(paramObject);
      if (localObject == null)
        return null;
      return ImmutableSet.of(localObject);
    }

    boolean isPartialView()
    {
      return false;
    }

    public int size()
    {
      return this.delegate.size();
    }
  }

  static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID;
    private final Object[] keys;
    private final Object[] values;

    SerializedForm(ImmutableMap<?, ?> paramImmutableMap)
    {
      this.keys = new Object[paramImmutableMap.size()];
      this.values = new Object[paramImmutableMap.size()];
      int i = 0;
      Iterator localIterator = paramImmutableMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        this.keys[i] = localEntry.getKey();
        this.values[i] = localEntry.getValue();
        i++;
      }
    }

    Object createMap(ImmutableMap.Builder<Object, Object> paramBuilder)
    {
      for (int i = 0; i < this.keys.length; i++)
        paramBuilder.put(this.keys[i], this.values[i]);
      return paramBuilder.build();
    }

    Object readResolve()
    {
      return createMap(new ImmutableMap.Builder());
    }
  }
}