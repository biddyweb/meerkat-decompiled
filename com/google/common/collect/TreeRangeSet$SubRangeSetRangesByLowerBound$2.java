package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;

class TreeRangeSet$SubRangeSetRangesByLowerBound$2 extends AbstractIterator<Map.Entry<Cut<C>, Range<C>>>
{
  TreeRangeSet$SubRangeSetRangesByLowerBound$2(TreeRangeSet.SubRangeSetRangesByLowerBound paramSubRangeSetRangesByLowerBound, Iterator paramIterator)
  {
  }

  protected Map.Entry<Cut<C>, Range<C>> computeNext()
  {
    if (!this.val$completeRangeItr.hasNext())
      return (Map.Entry)endOfData();
    Range localRange1 = (Range)this.val$completeRangeItr.next();
    if (TreeRangeSet.SubRangeSetRangesByLowerBound.access$300(this.this$0).lowerBound.compareTo(localRange1.upperBound) >= 0)
      return (Map.Entry)endOfData();
    Range localRange2 = localRange1.intersection(TreeRangeSet.SubRangeSetRangesByLowerBound.access$300(this.this$0));
    if (TreeRangeSet.SubRangeSetRangesByLowerBound.access$400(this.this$0).contains(localRange2.lowerBound))
      return Maps.immutableEntry(localRange2.lowerBound, localRange2);
    return (Map.Entry)endOfData();
  }
}