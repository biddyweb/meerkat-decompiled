package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;

class TreeRangeSet$SubRangeSetRangesByLowerBound$1 extends AbstractIterator<Map.Entry<Cut<C>, Range<C>>>
{
  TreeRangeSet$SubRangeSetRangesByLowerBound$1(TreeRangeSet.SubRangeSetRangesByLowerBound paramSubRangeSetRangesByLowerBound, Iterator paramIterator, Cut paramCut)
  {
  }

  protected Map.Entry<Cut<C>, Range<C>> computeNext()
  {
    if (!this.val$completeRangeItr.hasNext())
      return (Map.Entry)endOfData();
    Range localRange1 = (Range)this.val$completeRangeItr.next();
    if (this.val$upperBoundOnLowerBounds.isLessThan(localRange1.lowerBound))
      return (Map.Entry)endOfData();
    Range localRange2 = localRange1.intersection(TreeRangeSet.SubRangeSetRangesByLowerBound.access$300(this.this$0));
    return Maps.immutableEntry(localRange2.lowerBound, localRange2);
  }
}