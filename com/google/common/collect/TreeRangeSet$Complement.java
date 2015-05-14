package com.google.common.collect;

final class TreeRangeSet$Complement extends TreeRangeSet<C>
{
  TreeRangeSet$Complement(TreeRangeSet paramTreeRangeSet)
  {
    super(new TreeRangeSet.ComplementRangesByLowerBound(paramTreeRangeSet.rangesByLowerBound), null);
  }

  public void add(Range<C> paramRange)
  {
    this.this$0.remove(paramRange);
  }

  public RangeSet<C> complement()
  {
    return this.this$0;
  }

  public boolean contains(C paramC)
  {
    return !this.this$0.contains(paramC);
  }

  public void remove(Range<C> paramRange)
  {
    this.this$0.add(paramRange);
  }
}