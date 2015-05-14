package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.SortedMap;
import java.util.SortedSet;
import javax.annotation.Nullable;

class TreeBasedTable$TreeRow extends StandardTable<R, C, V>.Row
  implements SortedMap<C, V>
{

  @Nullable
  final C lowerBound;

  @Nullable
  final C upperBound;
  transient SortedMap<C, V> wholeRow;

  TreeBasedTable$TreeRow(R paramR)
  {
    this(paramR, localObject, null, null);
  }

  TreeBasedTable$TreeRow(R paramR, @Nullable C paramC1, @Nullable C paramC2)
  {
    super(paramR, paramC1);
    this.lowerBound = paramC2;
    Object localObject;
    this.upperBound = localObject;
    if ((paramC2 == null) || (localObject == null) || (compare(paramC2, localObject) <= 0));
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      return;
    }
  }

  SortedMap<C, V> backingRowMap()
  {
    return (SortedMap)super.backingRowMap();
  }

  public Comparator<? super C> comparator()
  {
    return this.this$0.columnComparator();
  }

  int compare(Object paramObject1, Object paramObject2)
  {
    return comparator().compare(paramObject1, paramObject2);
  }

  SortedMap<C, V> computeBackingRowMap()
  {
    SortedMap localSortedMap = wholeRow();
    if (localSortedMap != null)
    {
      if (this.lowerBound != null)
        localSortedMap = localSortedMap.tailMap(this.lowerBound);
      if (this.upperBound != null)
        localSortedMap = localSortedMap.headMap(this.upperBound);
      return localSortedMap;
    }
    return null;
  }

  public boolean containsKey(Object paramObject)
  {
    return (rangeContains(paramObject)) && (super.containsKey(paramObject));
  }

  public C firstKey()
  {
    if (backingRowMap() == null)
      throw new NoSuchElementException();
    return backingRowMap().firstKey();
  }

  public SortedMap<C, V> headMap(C paramC)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return new TreeRow(this.this$0, this.rowKey, this.lowerBound, paramC);
  }

  public SortedSet<C> keySet()
  {
    return new Maps.SortedKeySet(this);
  }

  public C lastKey()
  {
    if (backingRowMap() == null)
      throw new NoSuchElementException();
    return backingRowMap().lastKey();
  }

  void maintainEmptyInvariant()
  {
    if ((wholeRow() != null) && (this.wholeRow.isEmpty()))
    {
      this.this$0.backingMap.remove(this.rowKey);
      this.wholeRow = null;
      this.backingRowMap = null;
    }
  }

  public V put(C paramC, V paramV)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return super.put(paramC, paramV);
  }

  boolean rangeContains(@Nullable Object paramObject)
  {
    return (paramObject != null) && ((this.lowerBound == null) || (compare(this.lowerBound, paramObject) <= 0)) && ((this.upperBound == null) || (compare(this.upperBound, paramObject) > 0));
  }

  public SortedMap<C, V> subMap(C paramC1, C paramC2)
  {
    if ((rangeContains(Preconditions.checkNotNull(paramC1))) && (rangeContains(Preconditions.checkNotNull(paramC2))));
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      return new TreeRow(this.this$0, this.rowKey, paramC1, paramC2);
    }
  }

  public SortedMap<C, V> tailMap(C paramC)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return new TreeRow(this.this$0, this.rowKey, paramC, this.upperBound);
  }

  SortedMap<C, V> wholeRow()
  {
    if ((this.wholeRow == null) || ((this.wholeRow.isEmpty()) && (this.this$0.backingMap.containsKey(this.rowKey))))
      this.wholeRow = ((SortedMap)this.this$0.backingMap.get(this.rowKey));
    return this.wholeRow;
  }
}