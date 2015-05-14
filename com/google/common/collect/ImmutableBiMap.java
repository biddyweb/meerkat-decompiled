package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableBiMap<K, V> extends ImmutableMap<K, V>
  implements BiMap<K, V>
{
  private static final Map.Entry<?, ?>[] EMPTY_ENTRY_ARRAY = new Map.Entry[0];

  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }

  public static <K, V> ImmutableBiMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    if ((paramMap instanceof ImmutableBiMap))
    {
      ImmutableBiMap localImmutableBiMap = (ImmutableBiMap)paramMap;
      if (!localImmutableBiMap.isPartialView())
        return localImmutableBiMap;
    }
    Map.Entry[] arrayOfEntry = (Map.Entry[])paramMap.entrySet().toArray(EMPTY_ENTRY_ARRAY);
    switch (arrayOfEntry.length)
    {
    default:
      return new RegularImmutableBiMap(arrayOfEntry);
    case 0:
      return of();
    case 1:
    }
    Map.Entry localEntry = arrayOfEntry[0];
    return of(localEntry.getKey(), localEntry.getValue());
  }

  public static <K, V> ImmutableBiMap<K, V> of()
  {
    return EmptyImmutableBiMap.INSTANCE;
  }

  public static <K, V> ImmutableBiMap<K, V> of(K paramK, V paramV)
  {
    return new SingletonImmutableBiMap(paramK, paramV);
  }

  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[2];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    return new RegularImmutableBiMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[3];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    return new RegularImmutableBiMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[4];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    arrayOfTerminalEntry[3] = entryOf(paramK4, paramV4);
    return new RegularImmutableBiMap(arrayOfTerminalEntry);
  }

  public static <K, V> ImmutableBiMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    ImmutableMapEntry.TerminalEntry[] arrayOfTerminalEntry = new ImmutableMapEntry.TerminalEntry[5];
    arrayOfTerminalEntry[0] = entryOf(paramK1, paramV1);
    arrayOfTerminalEntry[1] = entryOf(paramK2, paramV2);
    arrayOfTerminalEntry[2] = entryOf(paramK3, paramV3);
    arrayOfTerminalEntry[3] = entryOf(paramK4, paramV4);
    arrayOfTerminalEntry[4] = entryOf(paramK5, paramV5);
    return new RegularImmutableBiMap(arrayOfTerminalEntry);
  }

  @Deprecated
  public V forcePut(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }

  public abstract ImmutableBiMap<V, K> inverse();

  public ImmutableSet<V> values()
  {
    return inverse().keySet();
  }

  Object writeReplace()
  {
    return new SerializedForm(this);
  }

  public static final class Builder<K, V> extends ImmutableMap.Builder<K, V>
  {
    public ImmutableBiMap<K, V> build()
    {
      switch (this.size)
      {
      default:
        return new RegularImmutableBiMap(this.size, this.entries);
      case 0:
        return ImmutableBiMap.of();
      case 1:
      }
      return ImmutableBiMap.of(this.entries[0].getKey(), this.entries[0].getValue());
    }

    public Builder<K, V> put(K paramK, V paramV)
    {
      super.put(paramK, paramV);
      return this;
    }

    public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
    {
      super.putAll(paramMap);
      return this;
    }
  }

  private static class SerializedForm extends ImmutableMap.SerializedForm
  {
    private static final long serialVersionUID;

    SerializedForm(ImmutableBiMap<?, ?> paramImmutableBiMap)
    {
      super();
    }

    Object readResolve()
    {
      return createMap(new ImmutableBiMap.Builder());
    }
  }
}