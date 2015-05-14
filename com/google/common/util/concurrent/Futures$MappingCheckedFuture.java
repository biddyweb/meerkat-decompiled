package com.google.common.util.concurrent;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;

class Futures$MappingCheckedFuture<V, X extends Exception> extends AbstractCheckedFuture<V, X>
{
  final Function<? super Exception, X> mapper;

  Futures$MappingCheckedFuture(ListenableFuture<V> paramListenableFuture, Function<? super Exception, X> paramFunction)
  {
    super(paramListenableFuture);
    this.mapper = ((Function)Preconditions.checkNotNull(paramFunction));
  }

  protected X mapException(Exception paramException)
  {
    return (Exception)this.mapper.apply(paramException);
  }
}