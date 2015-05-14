package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
class RegularImmutableMultiset<E> extends ImmutableMultiset<E>
{
  private final transient ImmutableMap<E, Integer> map;
  private final transient int size;

  RegularImmutableMultiset(ImmutableMap<E, Integer> paramImmutableMap, int paramInt)
  {
    this.map = paramImmutableMap;
    this.size = paramInt;
  }

  public boolean contains(@Nullable Object paramObject)
  {
    return this.map.containsKey(paramObject);
  }

  public int count(@Nullable Object paramObject)
  {
    Integer localInteger = (Integer)this.map.get(paramObject);
    if (localInteger == null)
      return 0;
    return localInteger.intValue();
  }

  public ImmutableSet<E> elementSet()
  {
    return this.map.keySet();
  }

  Multiset.Entry<E> getEntry(int paramInt)
  {
    Map.Entry localEntry = (Map.Entry)this.map.entrySet().asList().get(paramInt);
    return Multisets.immutableEntry(localEntry.getKey(), ((Integer)localEntry.getValue()).intValue());
  }

  public int hashCode()
  {
    return this.map.hashCode();
  }

  boolean isPartialView()
  {
    return this.map.isPartialView();
  }

  public int size()
  {
    return this.size;
  }
}