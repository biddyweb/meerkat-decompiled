package com.google.common.collect;

import java.util.Map.Entry;

class TreeRangeSet$ComplementRangesByLowerBound$2 extends AbstractIterator<Map.Entry<Cut<C>, Range<C>>>
{
  Cut<C> nextComplementRangeUpperBound = this.val$firstComplementRangeUpperBound;

  TreeRangeSet$ComplementRangesByLowerBound$2(TreeRangeSet.ComplementRangesByLowerBound paramComplementRangesByLowerBound, Cut paramCut, PeekingIterator paramPeekingIterator)
  {
  }

  protected Map.Entry<Cut<C>, Range<C>> computeNext()
  {
    if (this.nextComplementRangeUpperBound == Cut.belowAll())
      return (Map.Entry)endOfData();
    if (this.val$positiveItr.hasNext())
    {
      Range localRange2 = (Range)this.val$positiveItr.next();
      Range localRange3 = Range.create(localRange2.upperBound, this.nextComplementRangeUpperBound);
      this.nextComplementRangeUpperBound = localRange2.lowerBound;
      if (TreeRangeSet.ComplementRangesByLowerBound.access$100(this.this$0).lowerBound.isLessThan(localRange3.lowerBound))
        return Maps.immutableEntry(localRange3.lowerBound, localRange3);
    }
    else if (TreeRangeSet.ComplementRangesByLowerBound.access$100(this.this$0).lowerBound.isLessThan(Cut.belowAll()))
    {
      Range localRange1 = Range.create(Cut.belowAll(), this.nextComplementRangeUpperBound);
      this.nextComplementRangeUpperBound = Cut.belowAll();
      return Maps.immutableEntry(Cut.belowAll(), localRange1);
    }
    return (Map.Entry)endOfData();
  }
}