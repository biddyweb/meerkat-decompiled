package com.google.common.util.concurrent;

import com.google.common.base.Function;

final class Futures$2
  implements AsyncFunction<I, O>
{
  Futures$2(Function paramFunction)
  {
  }

  public ListenableFuture<O> apply(I paramI)
  {
    return Futures.immediateFuture(this.val$function.apply(paramI));
  }
}