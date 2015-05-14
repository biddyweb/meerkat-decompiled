package com.google.common.collect;

final class TreeRangeMap$RangeMapEntry<K extends Comparable, V> extends AbstractMapEntry<Range<K>, V>
{
  private final Range<K> range;
  private final V value;

  TreeRangeMap$RangeMapEntry(Cut<K> paramCut1, Cut<K> paramCut2, V paramV)
  {
    this(Range.create(paramCut1, paramCut2), paramV);
  }

  TreeRangeMap$RangeMapEntry(Range<K> paramRange, V paramV)
  {
    this.range = paramRange;
    this.value = paramV;
  }

  public boolean contains(K paramK)
  {
    return this.range.contains(paramK);
  }

  public Range<K> getKey()
  {
    return this.range;
  }

  Cut<K> getLowerBound()
  {
    return this.range.lowerBound;
  }

  Cut<K> getUpperBound()
  {
    return this.range.upperBound;
  }

  public V getValue()
  {
    return this.value;
  }
}