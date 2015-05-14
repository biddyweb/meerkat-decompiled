package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

final class AsyncSettableFuture<V> extends ForwardingListenableFuture<V>
{
  private final ListenableFuture<V> dereferenced = Futures.dereference(this.nested);
  private final NestedFuture<V> nested = new NestedFuture(null);

  public static <V> AsyncSettableFuture<V> create()
  {
    return new AsyncSettableFuture();
  }

  protected ListenableFuture<V> delegate()
  {
    return this.dereferenced;
  }

  public boolean isSet()
  {
    return this.nested.isDone();
  }

  public boolean setException(Throwable paramThrowable)
  {
    return setFuture(Futures.immediateFailedFuture(paramThrowable));
  }

  public boolean setFuture(ListenableFuture<? extends V> paramListenableFuture)
  {
    return this.nested.setFuture((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
  }

  public boolean setValue(@Nullable V paramV)
  {
    return setFuture(Futures.immediateFuture(paramV));
  }

  private static final class NestedFuture<V> extends AbstractFuture<ListenableFuture<? extends V>>
  {
    boolean setFuture(ListenableFuture<? extends V> paramListenableFuture)
    {
      boolean bool = set(paramListenableFuture);
      if (isCancelled())
        paramListenableFuture.cancel(wasInterrupted());
      return bool;
    }
  }
}