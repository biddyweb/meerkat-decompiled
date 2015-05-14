package com.google.common.collect;

final class Range$3 extends Ordering<Range<?>>
{
  public int compare(Range<?> paramRange1, Range<?> paramRange2)
  {
    return ComparisonChain.start().compare(paramRange1.lowerBound, paramRange2.lowerBound).compare(paramRange1.upperBound, paramRange2.upperBound).result();
  }
}