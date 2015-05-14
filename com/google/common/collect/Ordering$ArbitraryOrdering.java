package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Function;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

@VisibleForTesting
class Ordering$ArbitraryOrdering extends Ordering<Object>
{
  private Map<Object, Integer> uids = Platform.tryWeakKeys(new MapMaker()).makeComputingMap(new Function()
  {
    final AtomicInteger counter = new AtomicInteger(0);

    public Integer apply(Object paramAnonymousObject)
    {
      return Integer.valueOf(this.counter.getAndIncrement());
    }
  });

  public int compare(Object paramObject1, Object paramObject2)
  {
    int i = -1;
    if (paramObject1 == paramObject2)
      i = 0;
    int j;
    int k;
    do
    {
      do
        return i;
      while (paramObject1 == null);
      if (paramObject2 == null)
        return 1;
      j = identityHashCode(paramObject1);
      k = identityHashCode(paramObject2);
      if (j == k)
        break;
    }
    while (j < k);
    return 1;
    int m = ((Integer)this.uids.get(paramObject1)).compareTo((Integer)this.uids.get(paramObject2));
    if (m == 0)
      throw new AssertionError();
    return m;
  }

  int identityHashCode(Object paramObject)
  {
    return System.identityHashCode(paramObject);
  }

  public String toString()
  {
    return "Ordering.arbitrary()";
  }
}