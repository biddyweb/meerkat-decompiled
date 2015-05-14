package com.google.common.collect;

import com.google.common.base.Function;

final class Range$2
  implements Function<Range, Cut>
{
  public Cut apply(Range paramRange)
  {
    return paramRange.upperBound;
  }
}