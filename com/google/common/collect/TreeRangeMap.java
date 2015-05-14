package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("NavigableMap")
public final class TreeRangeMap<K extends Comparable, V>
  implements RangeMap<K, V>
{
  private static final RangeMap EMPTY_SUB_RANGE_MAP = new RangeMap()
  {
    public Map<Range, Object> asMapOfRanges()
    {
      return Collections.emptyMap();
    }

    public void clear()
    {
    }

    @Nullable
    public Object get(Comparable paramAnonymousComparable)
    {
      return null;
    }

    @Nullable
    public Map.Entry<Range, Object> getEntry(Comparable paramAnonymousComparable)
    {
      return null;
    }

    public void put(Range paramAnonymousRange, Object paramAnonymousObject)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
      String str = String.valueOf(String.valueOf(paramAnonymousRange));
      throw new IllegalArgumentException(46 + str.length() + "Cannot insert range " + str + " into an empty subRangeMap");
    }

    public void putAll(RangeMap paramAnonymousRangeMap)
    {
      if (!paramAnonymousRangeMap.asMapOfRanges().isEmpty())
        throw new IllegalArgumentException("Cannot putAll(nonEmptyRangeMap) into an empty subRangeMap");
    }

    public void remove(Range paramAnonymousRange)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
    }

    public Range span()
    {
      throw new NoSuchElementException();
    }

    public RangeMap subRangeMap(Range paramAnonymousRange)
    {
      Preconditions.checkNotNull(paramAnonymousRange);
      return this;
    }
  };
  private final NavigableMap<Cut<K>, TreeRangeMap.RangeMapEntry<K, V>> entriesByLowerBound = Maps.newTreeMap();

  public static <K extends Comparable, V> TreeRangeMap<K, V> create()
  {
    return new TreeRangeMap();
  }

  private RangeMap<K, V> emptySubRangeMap()
  {
    return EMPTY_SUB_RANGE_MAP;
  }

  private void putRangeMapEntry(Cut<K> paramCut1, Cut<K> paramCut2, V paramV)
  {
    this.entriesByLowerBound.put(paramCut1, new TreeRangeMap.RangeMapEntry(paramCut1, paramCut2, paramV));
  }

  public Map<Range<K>, V> asMapOfRanges()
  {
    return new TreeRangeMap.AsMapOfRanges(this, null);
  }

  public void clear()
  {
    this.entriesByLowerBound.clear();
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof RangeMap))
    {
      RangeMap localRangeMap = (RangeMap)paramObject;
      return asMapOfRanges().equals(localRangeMap.asMapOfRanges());
    }
    return false;
  }

  @Nullable
  public V get(K paramK)
  {
    Map.Entry localEntry = getEntry(paramK);
    if (localEntry == null)
      return null;
    return localEntry.getValue();
  }

  @Nullable
  public Map.Entry<Range<K>, V> getEntry(K paramK)
  {
    Map.Entry localEntry = this.entriesByLowerBound.floorEntry(Cut.belowValue(paramK));
    if ((localEntry != null) && (((TreeRangeMap.RangeMapEntry)localEntry.getValue()).contains(paramK)))
      return (Map.Entry)localEntry.getValue();
    return null;
  }

  public int hashCode()
  {
    return asMapOfRanges().hashCode();
  }

  public void put(Range<K> paramRange, V paramV)
  {
    if (!paramRange.isEmpty())
    {
      Preconditions.checkNotNull(paramV);
      remove(paramRange);
      this.entriesByLowerBound.put(paramRange.lowerBound, new TreeRangeMap.RangeMapEntry(paramRange, paramV));
    }
  }

  public void putAll(RangeMap<K, V> paramRangeMap)
  {
    Iterator localIterator = paramRangeMap.asMapOfRanges().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      put((Range)localEntry.getKey(), localEntry.getValue());
    }
  }

  public void remove(Range<K> paramRange)
  {
    if (paramRange.isEmpty())
      return;
    Map.Entry localEntry1 = this.entriesByLowerBound.lowerEntry(paramRange.lowerBound);
    if (localEntry1 != null)
    {
      TreeRangeMap.RangeMapEntry localRangeMapEntry2 = (TreeRangeMap.RangeMapEntry)localEntry1.getValue();
      if (localRangeMapEntry2.getUpperBound().compareTo(paramRange.lowerBound) > 0)
      {
        if (localRangeMapEntry2.getUpperBound().compareTo(paramRange.upperBound) > 0)
          putRangeMapEntry(paramRange.upperBound, localRangeMapEntry2.getUpperBound(), ((TreeRangeMap.RangeMapEntry)localEntry1.getValue()).getValue());
        putRangeMapEntry(localRangeMapEntry2.getLowerBound(), paramRange.lowerBound, ((TreeRangeMap.RangeMapEntry)localEntry1.getValue()).getValue());
      }
    }
    Map.Entry localEntry2 = this.entriesByLowerBound.lowerEntry(paramRange.upperBound);
    if (localEntry2 != null)
    {
      TreeRangeMap.RangeMapEntry localRangeMapEntry1 = (TreeRangeMap.RangeMapEntry)localEntry2.getValue();
      if (localRangeMapEntry1.getUpperBound().compareTo(paramRange.upperBound) > 0)
      {
        putRangeMapEntry(paramRange.upperBound, localRangeMapEntry1.getUpperBound(), ((TreeRangeMap.RangeMapEntry)localEntry2.getValue()).getValue());
        this.entriesByLowerBound.remove(paramRange.lowerBound);
      }
    }
    this.entriesByLowerBound.subMap(paramRange.lowerBound, paramRange.upperBound).clear();
  }

  public Range<K> span()
  {
    Map.Entry localEntry1 = this.entriesByLowerBound.firstEntry();
    Map.Entry localEntry2 = this.entriesByLowerBound.lastEntry();
    if (localEntry1 == null)
      throw new NoSuchElementException();
    return Range.create(((TreeRangeMap.RangeMapEntry)localEntry1.getValue()).getKey().lowerBound, ((TreeRangeMap.RangeMapEntry)localEntry2.getValue()).getKey().upperBound);
  }

  public RangeMap<K, V> subRangeMap(Range<K> paramRange)
  {
    if (paramRange.equals(Range.all()))
      return this;
    return new SubRangeMap(paramRange);
  }

  public String toString()
  {
    return this.entriesByLowerBound.values().toString();
  }

  private class SubRangeMap
    implements RangeMap<K, V>
  {
    private final Range<K> subRange;

    SubRangeMap()
    {
      Object localObject;
      this.subRange = localObject;
    }

    public Map<Range<K>, V> asMapOfRanges()
    {
      return new TreeRangeMap.SubRangeMap.SubRangeMapAsMap(this);
    }

    public void clear()
    {
      TreeRangeMap.this.remove(this.subRange);
    }

    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof RangeMap))
      {
        RangeMap localRangeMap = (RangeMap)paramObject;
        return asMapOfRanges().equals(localRangeMap.asMapOfRanges());
      }
      return false;
    }

    @Nullable
    public V get(K paramK)
    {
      if (this.subRange.contains(paramK))
        return TreeRangeMap.this.get(paramK);
      return null;
    }

    @Nullable
    public Map.Entry<Range<K>, V> getEntry(K paramK)
    {
      if (this.subRange.contains(paramK))
      {
        Map.Entry localEntry = TreeRangeMap.this.getEntry(paramK);
        if (localEntry != null)
          return Maps.immutableEntry(((Range)localEntry.getKey()).intersection(this.subRange), localEntry.getValue());
      }
      return null;
    }

    public int hashCode()
    {
      return asMapOfRanges().hashCode();
    }

    public void put(Range<K> paramRange, V paramV)
    {
      boolean bool = this.subRange.encloses(paramRange);
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramRange;
      arrayOfObject[1] = this.subRange;
      Preconditions.checkArgument(bool, "Cannot put range %s into a subRangeMap(%s)", arrayOfObject);
      TreeRangeMap.this.put(paramRange, paramV);
    }

    public void putAll(RangeMap<K, V> paramRangeMap)
    {
      if (paramRangeMap.asMapOfRanges().isEmpty())
        return;
      Range localRange = paramRangeMap.span();
      boolean bool = this.subRange.encloses(localRange);
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localRange;
      arrayOfObject[1] = this.subRange;
      Preconditions.checkArgument(bool, "Cannot putAll rangeMap with span %s into a subRangeMap(%s)", arrayOfObject);
      TreeRangeMap.this.putAll(paramRangeMap);
    }

    public void remove(Range<K> paramRange)
    {
      if (paramRange.isConnected(this.subRange))
        TreeRangeMap.this.remove(paramRange.intersection(this.subRange));
    }

    public Range<K> span()
    {
      Map.Entry localEntry1 = TreeRangeMap.this.entriesByLowerBound.floorEntry(this.subRange.lowerBound);
      Cut localCut1;
      if ((localEntry1 != null) && (((TreeRangeMap.RangeMapEntry)localEntry1.getValue()).getUpperBound().compareTo(this.subRange.lowerBound) > 0))
        localCut1 = this.subRange.lowerBound;
      Map.Entry localEntry2;
      do
      {
        localEntry2 = TreeRangeMap.this.entriesByLowerBound.lowerEntry(this.subRange.upperBound);
        if (localEntry2 != null)
          break;
        throw new NoSuchElementException();
        localCut1 = (Cut)TreeRangeMap.this.entriesByLowerBound.ceilingKey(this.subRange.lowerBound);
      }
      while ((localCut1 != null) && (localCut1.compareTo(this.subRange.upperBound) < 0));
      throw new NoSuchElementException();
      if (((TreeRangeMap.RangeMapEntry)localEntry2.getValue()).getUpperBound().compareTo(this.subRange.upperBound) >= 0);
      for (Cut localCut2 = this.subRange.upperBound; ; localCut2 = ((TreeRangeMap.RangeMapEntry)localEntry2.getValue()).getUpperBound())
        return Range.create(localCut1, localCut2);
    }

    public RangeMap<K, V> subRangeMap(Range<K> paramRange)
    {
      if (!paramRange.isConnected(this.subRange))
        return TreeRangeMap.this.emptySubRangeMap();
      return TreeRangeMap.this.subRangeMap(paramRange.intersection(this.subRange));
    }

    public String toString()
    {
      return asMapOfRanges().toString();
    }
  }
}