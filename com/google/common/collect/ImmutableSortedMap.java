package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableSortedMap<K, V> extends ImmutableSortedMapFauxverideShim<K, V>
  implements NavigableMap<K, V>
{
  private static final ImmutableSortedMap<Comparable, Object> NATURAL_EMPTY_MAP = new EmptyImmutableSortedMap(NATURAL_ORDER);
  private static final Comparator<Comparable> NATURAL_ORDER = Ordering.natural();
  private static final long serialVersionUID;
  private transient ImmutableSortedMap<K, V> descendingMap;

  ImmutableSortedMap()
  {
  }

  ImmutableSortedMap(ImmutableSortedMap<K, V> paramImmutableSortedMap)
  {
    this.descendingMap = paramImmutableSortedMap;
  }

  public static <K, V> ImmutableSortedMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap)
  {
    return copyOfInternal(paramMap, Ordering.natural());
  }

  public static <K, V> ImmutableSortedMap<K, V> copyOf(Map<? extends K, ? extends V> paramMap, Comparator<? super K> paramComparator)
  {
    return copyOfInternal(paramMap, (Comparator)Preconditions.checkNotNull(paramComparator));
  }

  private static <K, V> ImmutableSortedMap<K, V> copyOfInternal(Map<? extends K, ? extends V> paramMap, Comparator<? super K> paramComparator)
  {
    boolean bool1 = paramMap instanceof SortedMap;
    boolean bool2 = false;
    Comparator localComparator;
    if (bool1)
    {
      localComparator = ((SortedMap)paramMap).comparator();
      if (localComparator != null)
        break label69;
      if (paramComparator != NATURAL_ORDER)
        break label64;
      bool2 = true;
    }
    while ((bool2) && ((paramMap instanceof ImmutableSortedMap)))
    {
      ImmutableSortedMap localImmutableSortedMap = (ImmutableSortedMap)paramMap;
      if (localImmutableSortedMap.isPartialView())
        break;
      return localImmutableSortedMap;
      label64: bool2 = false;
      continue;
      label69: bool2 = paramComparator.equals(localComparator);
    }
    Map.Entry[] arrayOfEntry = (Map.Entry[])paramMap.entrySet().toArray(new Map.Entry[0]);
    return fromEntries(paramComparator, bool2, arrayOfEntry.length, arrayOfEntry);
  }

  public static <K, V> ImmutableSortedMap<K, V> copyOfSorted(SortedMap<K, ? extends V> paramSortedMap)
  {
    Comparator localComparator = paramSortedMap.comparator();
    if (localComparator == null)
      localComparator = NATURAL_ORDER;
    return copyOfInternal(paramSortedMap, localComparator);
  }

  static <K, V> ImmutableSortedMap<K, V> emptyMap(Comparator<? super K> paramComparator)
  {
    if (Ordering.natural().equals(paramComparator))
      return of();
    return new EmptyImmutableSortedMap(paramComparator);
  }

  static <K, V> ImmutableSortedMap<K, V> from(ImmutableSortedSet<K> paramImmutableSortedSet, ImmutableList<V> paramImmutableList)
  {
    if (paramImmutableSortedSet.isEmpty())
      return emptyMap(paramImmutableSortedSet.comparator());
    return new RegularImmutableSortedMap((RegularImmutableSortedSet)paramImmutableSortedSet, paramImmutableList);
  }

  static <K, V> ImmutableSortedMap<K, V> fromEntries(Comparator<? super K> paramComparator, boolean paramBoolean, int paramInt, Map.Entry<K, V>[] paramArrayOfEntry)
  {
    for (int i = 0; i < paramInt; i++)
    {
      Map.Entry<K, V> localEntry = paramArrayOfEntry[i];
      paramArrayOfEntry[i] = entryOf(localEntry.getKey(), localEntry.getValue());
    }
    if (!paramBoolean)
    {
      sortEntries(paramComparator, paramInt, paramArrayOfEntry);
      validateEntries(paramInt, paramArrayOfEntry, paramComparator);
    }
    return fromSortedEntries(paramComparator, paramInt, paramArrayOfEntry);
  }

  static <K, V> ImmutableSortedMap<K, V> fromSortedEntries(Comparator<? super K> paramComparator, int paramInt, Map.Entry<K, V>[] paramArrayOfEntry)
  {
    if (paramInt == 0)
      return emptyMap(paramComparator);
    ImmutableList.Builder localBuilder1 = ImmutableList.builder();
    ImmutableList.Builder localBuilder2 = ImmutableList.builder();
    for (int i = 0; i < paramInt; i++)
    {
      Map.Entry<K, V> localEntry = paramArrayOfEntry[i];
      localBuilder1.add(localEntry.getKey());
      localBuilder2.add(localEntry.getValue());
    }
    return new RegularImmutableSortedMap(new RegularImmutableSortedSet(localBuilder1.build(), paramComparator), localBuilder2.build());
  }

  public static <K extends Comparable<?>, V> Builder<K, V> naturalOrder()
  {
    return new Builder(Ordering.natural());
  }

  public static <K, V> ImmutableSortedMap<K, V> of()
  {
    return NATURAL_EMPTY_MAP;
  }

  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK, V paramV)
  {
    return from(ImmutableSortedSet.of(paramK), ImmutableList.of(paramV));
  }

  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    Ordering localOrdering = Ordering.natural();
    Map.Entry[] arrayOfEntry = new Map.Entry[2];
    arrayOfEntry[0] = entryOf(paramK1, paramV1);
    arrayOfEntry[1] = entryOf(paramK2, paramV2);
    return fromEntries(localOrdering, false, 2, arrayOfEntry);
  }

  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    Ordering localOrdering = Ordering.natural();
    Map.Entry[] arrayOfEntry = new Map.Entry[3];
    arrayOfEntry[0] = entryOf(paramK1, paramV1);
    arrayOfEntry[1] = entryOf(paramK2, paramV2);
    arrayOfEntry[2] = entryOf(paramK3, paramV3);
    return fromEntries(localOrdering, false, 3, arrayOfEntry);
  }

  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    Ordering localOrdering = Ordering.natural();
    Map.Entry[] arrayOfEntry = new Map.Entry[4];
    arrayOfEntry[0] = entryOf(paramK1, paramV1);
    arrayOfEntry[1] = entryOf(paramK2, paramV2);
    arrayOfEntry[2] = entryOf(paramK3, paramV3);
    arrayOfEntry[3] = entryOf(paramK4, paramV4);
    return fromEntries(localOrdering, false, 4, arrayOfEntry);
  }

  public static <K extends Comparable<? super K>, V> ImmutableSortedMap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    Ordering localOrdering = Ordering.natural();
    Map.Entry[] arrayOfEntry = new Map.Entry[5];
    arrayOfEntry[0] = entryOf(paramK1, paramV1);
    arrayOfEntry[1] = entryOf(paramK2, paramV2);
    arrayOfEntry[2] = entryOf(paramK3, paramV3);
    arrayOfEntry[3] = entryOf(paramK4, paramV4);
    arrayOfEntry[4] = entryOf(paramK5, paramV5);
    return fromEntries(localOrdering, false, 5, arrayOfEntry);
  }

  public static <K, V> Builder<K, V> orderedBy(Comparator<K> paramComparator)
  {
    return new Builder(paramComparator);
  }

  public static <K extends Comparable<?>, V> Builder<K, V> reverseOrder()
  {
    return new Builder(Ordering.natural().reverse());
  }

  private static <K, V> void sortEntries(Comparator<? super K> paramComparator, int paramInt, Map.Entry<K, V>[] paramArrayOfEntry)
  {
    Arrays.sort(paramArrayOfEntry, 0, paramInt, Ordering.from(paramComparator).onKeys());
  }

  private static <K, V> void validateEntries(int paramInt, Map.Entry<K, V>[] paramArrayOfEntry, Comparator<? super K> paramComparator)
  {
    int i = 1;
    if (i < paramInt)
    {
      if (paramComparator.compare(paramArrayOfEntry[(i - 1)].getKey(), paramArrayOfEntry[i].getKey()) != 0);
      for (boolean bool = true; ; bool = false)
      {
        checkNoConflict(bool, "key", paramArrayOfEntry[(i - 1)], paramArrayOfEntry[i]);
        i++;
        break;
      }
    }
  }

  public Map.Entry<K, V> ceilingEntry(K paramK)
  {
    return tailMap(paramK, true).firstEntry();
  }

  public K ceilingKey(K paramK)
  {
    return Maps.keyOrNull(ceilingEntry(paramK));
  }

  public Comparator<? super K> comparator()
  {
    return keySet().comparator();
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    return values().contains(paramObject);
  }

  abstract ImmutableSortedMap<K, V> createDescendingMap();

  public ImmutableSortedSet<K> descendingKeySet()
  {
    return keySet().descendingSet();
  }

  public ImmutableSortedMap<K, V> descendingMap()
  {
    ImmutableSortedMap localImmutableSortedMap = this.descendingMap;
    if (localImmutableSortedMap == null)
    {
      localImmutableSortedMap = createDescendingMap();
      this.descendingMap = localImmutableSortedMap;
    }
    return localImmutableSortedMap;
  }

  public ImmutableSet<Map.Entry<K, V>> entrySet()
  {
    return super.entrySet();
  }

  public Map.Entry<K, V> firstEntry()
  {
    if (isEmpty())
      return null;
    return (Map.Entry)entrySet().asList().get(0);
  }

  public K firstKey()
  {
    return keySet().first();
  }

  public Map.Entry<K, V> floorEntry(K paramK)
  {
    return headMap(paramK, true).lastEntry();
  }

  public K floorKey(K paramK)
  {
    return Maps.keyOrNull(floorEntry(paramK));
  }

  public ImmutableSortedMap<K, V> headMap(K paramK)
  {
    return headMap(paramK, false);
  }

  public abstract ImmutableSortedMap<K, V> headMap(K paramK, boolean paramBoolean);

  public Map.Entry<K, V> higherEntry(K paramK)
  {
    return tailMap(paramK, false).firstEntry();
  }

  public K higherKey(K paramK)
  {
    return Maps.keyOrNull(higherEntry(paramK));
  }

  boolean isPartialView()
  {
    return (keySet().isPartialView()) || (values().isPartialView());
  }

  public abstract ImmutableSortedSet<K> keySet();

  public Map.Entry<K, V> lastEntry()
  {
    if (isEmpty())
      return null;
    return (Map.Entry)entrySet().asList().get(-1 + size());
  }

  public K lastKey()
  {
    return keySet().last();
  }

  public Map.Entry<K, V> lowerEntry(K paramK)
  {
    return headMap(paramK, false).lastEntry();
  }

  public K lowerKey(K paramK)
  {
    return Maps.keyOrNull(lowerEntry(paramK));
  }

  public ImmutableSortedSet<K> navigableKeySet()
  {
    return keySet();
  }

  @Deprecated
  public final Map.Entry<K, V> pollFirstEntry()
  {
    throw new UnsupportedOperationException();
  }

  @Deprecated
  public final Map.Entry<K, V> pollLastEntry()
  {
    throw new UnsupportedOperationException();
  }

  public int size()
  {
    return values().size();
  }

  public ImmutableSortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }

  public ImmutableSortedMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    Preconditions.checkNotNull(paramK1);
    Preconditions.checkNotNull(paramK2);
    if (comparator().compare(paramK1, paramK2) <= 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "expected fromKey <= toKey but %s > %s", new Object[] { paramK1, paramK2 });
      return headMap(paramK2, paramBoolean2).tailMap(paramK1, paramBoolean1);
    }
  }

  public ImmutableSortedMap<K, V> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }

  public abstract ImmutableSortedMap<K, V> tailMap(K paramK, boolean paramBoolean);

  public abstract ImmutableCollection<V> values();

  Object writeReplace()
  {
    return new SerializedForm(this);
  }

  public static class Builder<K, V> extends ImmutableMap.Builder<K, V>
  {
    private final Comparator<? super K> comparator;

    public Builder(Comparator<? super K> paramComparator)
    {
      this.comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    }

    public ImmutableSortedMap<K, V> build()
    {
      return ImmutableSortedMap.fromEntries(this.comparator, false, this.size, this.entries);
    }

    public Builder<K, V> put(K paramK, V paramV)
    {
      super.put(paramK, paramV);
      return this;
    }

    public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
    {
      super.put(paramEntry);
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
    private final Comparator<Object> comparator;

    SerializedForm(ImmutableSortedMap<?, ?> paramImmutableSortedMap)
    {
      super();
      this.comparator = paramImmutableSortedMap.comparator();
    }

    Object readResolve()
    {
      return createMap(new ImmutableSortedMap.Builder(this.comparator));
    }
  }
}