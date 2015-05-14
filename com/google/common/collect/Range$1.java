package com.google.common.collect;

import com.google.common.base.Function;

final class Range$1
  implements Function<Range, Cut>
{
  public Cut apply(Range paramRange)
  {
    return paramRange.lowerBound;
  }
}