package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

final class Futures$8
  implements Futures.FutureCombiner<V, List<V>>
{
  public List<V> combine(List<Optional<V>> paramList)
  {
    ArrayList localArrayList = Lists.newArrayList();
    Iterator localIterator = paramList.iterator();
    if (localIterator.hasNext())
    {
      Optional localOptional = (Optional)localIterator.next();
      if (localOptional != null);
      for (Object localObject = localOptional.orNull(); ; localObject = null)
      {
        localArrayList.add(localObject);
        break;
      }
    }
    return Collections.unmodifiableList(localArrayList);
  }
}