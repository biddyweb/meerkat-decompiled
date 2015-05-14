package com.google.common.util.concurrent;

import java.util.concurrent.Executor;

class Futures$FallbackFuture<V> extends AbstractFuture<V>
{
  private volatile ListenableFuture<? extends V> running;

  Futures$FallbackFuture(ListenableFuture<? extends V> paramListenableFuture, final FutureFallback<? extends V> paramFutureFallback, Executor paramExecutor)
  {
    this.running = paramListenableFuture;
    Futures.addCallback(this.running, new FutureCallback()
    {
      public void onFailure(Throwable paramAnonymousThrowable)
      {
        if (Futures.FallbackFuture.this.isCancelled())
          return;
        try
        {
          Futures.FallbackFuture.access$102(Futures.FallbackFuture.this, paramFutureFallback.create(paramAnonymousThrowable));
          if (Futures.FallbackFuture.this.isCancelled())
          {
            Futures.FallbackFuture.this.running.cancel(Futures.FallbackFuture.this.wasInterrupted());
            return;
          }
        }
        catch (Throwable localThrowable)
        {
          Futures.FallbackFuture.this.setException(localThrowable);
          return;
        }
        Futures.addCallback(Futures.FallbackFuture.this.running, new FutureCallback()
        {
          public void onFailure(Throwable paramAnonymous2Throwable)
          {
            if (Futures.FallbackFuture.this.running.isCancelled())
            {
              Futures.FallbackFuture.this.cancel(false);
              return;
            }
            Futures.FallbackFuture.this.setException(paramAnonymous2Throwable);
          }

          public void onSuccess(V paramAnonymous2V)
          {
            Futures.FallbackFuture.this.set(paramAnonymous2V);
          }
        }
        , MoreExecutors.directExecutor());
      }

      public void onSuccess(V paramAnonymousV)
      {
        Futures.FallbackFuture.this.set(paramAnonymousV);
      }
    }
    , paramExecutor);
  }

  public boolean cancel(boolean paramBoolean)
  {
    if (super.cancel(paramBoolean))
    {
      this.running.cancel(paramBoolean);
      return true;
    }
    return false;
  }
}