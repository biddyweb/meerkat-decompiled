package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import javax.annotation.Nullable;

class Futures$ChainingListenableFuture<I, O> extends AbstractFuture<O>
  implements Runnable
{
  private AsyncFunction<? super I, ? extends O> function;
  private ListenableFuture<? extends I> inputFuture;
  private volatile ListenableFuture<? extends O> outputFuture;

  private Futures$ChainingListenableFuture(AsyncFunction<? super I, ? extends O> paramAsyncFunction, ListenableFuture<? extends I> paramListenableFuture)
  {
    this.function = ((AsyncFunction)Preconditions.checkNotNull(paramAsyncFunction));
    this.inputFuture = ((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
  }

  private void cancel(@Nullable Future<?> paramFuture, boolean paramBoolean)
  {
    if (paramFuture != null)
      paramFuture.cancel(paramBoolean);
  }

  public boolean cancel(boolean paramBoolean)
  {
    if (super.cancel(paramBoolean))
    {
      cancel(this.inputFuture, paramBoolean);
      cancel(this.outputFuture, paramBoolean);
      return true;
    }
    return false;
  }

  public void run()
  {
    try
    {
      Object localObject2 = Uninterruptibles.getUninterruptibly(this.inputFuture);
      localListenableFuture = (ListenableFuture)Preconditions.checkNotNull(this.function.apply(localObject2), "AsyncFunction may not return null.");
      this.outputFuture = localListenableFuture;
      if (isCancelled())
      {
        localListenableFuture.cancel(wasInterrupted());
        this.outputFuture = null;
        return;
      }
    }
    catch (CancellationException localCancellationException)
    {
      cancel(false);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      final ListenableFuture localListenableFuture;
      setException(localExecutionException.getCause());
      return;
      localListenableFuture.addListener(new Runnable()
      {
        public void run()
        {
          try
          {
            Futures.ChainingListenableFuture.this.set(Uninterruptibles.getUninterruptibly(localListenableFuture));
            return;
          }
          catch (CancellationException localCancellationException)
          {
            Futures.ChainingListenableFuture.this.cancel(false);
            return;
          }
          catch (ExecutionException localExecutionException)
          {
            Futures.ChainingListenableFuture.this.setException(localExecutionException.getCause());
            return;
          }
          finally
          {
            Futures.ChainingListenableFuture.access$302(Futures.ChainingListenableFuture.this, null);
          }
        }
      }
      , MoreExecutors.directExecutor());
      return;
    }
    catch (UndeclaredThrowableException localUndeclaredThrowableException)
    {
      setException(localUndeclaredThrowableException.getCause());
      return;
    }
    catch (Throwable localThrowable)
    {
      setException(localThrowable);
      return;
    }
    finally
    {
      this.function = null;
      this.inputFuture = null;
    }
  }
}