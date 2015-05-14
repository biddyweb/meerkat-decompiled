package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;

class Futures$NonCancellationPropagatingFuture<V> extends AbstractFuture<V>
{
  Futures$NonCancellationPropagatingFuture(final ListenableFuture<V> paramListenableFuture)
  {
    Preconditions.checkNotNull(paramListenableFuture);
    Futures.addCallback(paramListenableFuture, new FutureCallback()
    {
      public void onFailure(Throwable paramAnonymousThrowable)
      {
        if (paramListenableFuture.isCancelled())
        {
          Futures.NonCancellationPropagatingFuture.this.cancel(false);
          return;
        }
        Futures.NonCancellationPropagatingFuture.this.setException(paramAnonymousThrowable);
      }

      public void onSuccess(V paramAnonymousV)
      {
        Futures.NonCancellationPropagatingFuture.this.set(paramAnonymousV);
      }
    }
    , MoreExecutors.directExecutor());
  }
}