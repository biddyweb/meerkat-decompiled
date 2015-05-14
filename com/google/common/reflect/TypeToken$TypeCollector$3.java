package com.google.common.reflect;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import com.google.common.collect.ImmutableSet;
import java.util.Iterator;

class TypeToken$TypeCollector$3 extends TypeToken.TypeCollector.ForwardingTypeCollector<K>
{
  TypeToken$TypeCollector$3(TypeToken.TypeCollector paramTypeCollector1, TypeToken.TypeCollector paramTypeCollector2)
  {
    super(paramTypeCollector2);
  }

  ImmutableList<K> collectTypes(Iterable<? extends K> paramIterable)
  {
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      if (!getRawType(localObject).isInterface())
        localBuilder.add(localObject);
    }
    return super.collectTypes(localBuilder.build());
  }

  Iterable<? extends K> getInterfaces(K paramK)
  {
    return ImmutableSet.of();
  }
}