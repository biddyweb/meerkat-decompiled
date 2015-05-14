package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import java.util.List;

abstract interface Futures$FutureCombiner<V, C>
{
  public abstract C combine(List<Optional<V>> paramList);
}