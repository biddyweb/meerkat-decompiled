package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import com.google.common.collect.Ordering;
import com.google.common.collect.Queues;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.annotation.Nullable;

@Beta
public final class Futures
{
  private static final AsyncFunction<ListenableFuture<Object>, Object> DEREFERENCER = new Futures.4();
  private static final Ordering<Constructor<?>> WITH_STRING_PARAM_FIRST = Ordering.natural().onResultOf(new Futures.7()).reverse();

  public static <V> void addCallback(ListenableFuture<V> paramListenableFuture, FutureCallback<? super V> paramFutureCallback)
  {
    addCallback(paramListenableFuture, paramFutureCallback, MoreExecutors.directExecutor());
  }

  public static <V> void addCallback(ListenableFuture<V> paramListenableFuture, FutureCallback<? super V> paramFutureCallback, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFutureCallback);
    paramListenableFuture.addListener(new Futures.6(paramListenableFuture, paramFutureCallback), paramExecutor);
  }

  @Beta
  public static <V> ListenableFuture<List<V>> allAsList(Iterable<? extends ListenableFuture<? extends V>> paramIterable)
  {
    return listFuture(ImmutableList.copyOf(paramIterable), true, MoreExecutors.directExecutor());
  }

  @Beta
  public static <V> ListenableFuture<List<V>> allAsList(ListenableFuture<? extends V>[] paramArrayOfListenableFuture)
  {
    return listFuture(ImmutableList.copyOf(paramArrayOfListenableFuture), true, MoreExecutors.directExecutor());
  }

  private static <I, O> AsyncFunction<I, O> asAsyncFunction(Function<? super I, ? extends O> paramFunction)
  {
    return new Futures.2(paramFunction);
  }

  public static <V> ListenableFuture<V> dereference(ListenableFuture<? extends ListenableFuture<? extends V>> paramListenableFuture)
  {
    return transform(paramListenableFuture, DEREFERENCER);
  }

  public static <V, X extends Exception> V get(Future<V> paramFuture, long paramLong, TimeUnit paramTimeUnit, Class<X> paramClass)
    throws Exception
  {
    Preconditions.checkNotNull(paramFuture);
    Preconditions.checkNotNull(paramTimeUnit);
    boolean bool;
    if (!RuntimeException.class.isAssignableFrom(paramClass))
      bool = true;
    while (true)
    {
      Preconditions.checkArgument(bool, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] { paramClass });
      try
      {
        Object localObject = paramFuture.get(paramLong, paramTimeUnit);
        return localObject;
        bool = false;
      }
      catch (InterruptedException localInterruptedException)
      {
        Thread.currentThread().interrupt();
        throw newWithCause(paramClass, localInterruptedException);
      }
      catch (TimeoutException localTimeoutException)
      {
        throw newWithCause(paramClass, localTimeoutException);
      }
      catch (ExecutionException localExecutionException)
      {
        wrapAndThrowExceptionOrError(localExecutionException.getCause(), paramClass);
      }
    }
    throw new AssertionError();
  }

  public static <V, X extends Exception> V get(Future<V> paramFuture, Class<X> paramClass)
    throws Exception
  {
    Preconditions.checkNotNull(paramFuture);
    boolean bool;
    if (!RuntimeException.class.isAssignableFrom(paramClass))
      bool = true;
    while (true)
    {
      Preconditions.checkArgument(bool, "Futures.get exception type (%s) must not be a RuntimeException", new Object[] { paramClass });
      try
      {
        Object localObject = paramFuture.get();
        return localObject;
        bool = false;
      }
      catch (InterruptedException localInterruptedException)
      {
        Thread.currentThread().interrupt();
        throw newWithCause(paramClass, localInterruptedException);
      }
      catch (ExecutionException localExecutionException)
      {
        wrapAndThrowExceptionOrError(localExecutionException.getCause(), paramClass);
      }
    }
    throw new AssertionError();
  }

  public static <V> V getUnchecked(Future<V> paramFuture)
  {
    Preconditions.checkNotNull(paramFuture);
    try
    {
      Object localObject = Uninterruptibles.getUninterruptibly(paramFuture);
      return localObject;
    }
    catch (ExecutionException localExecutionException)
    {
      wrapAndThrowUnchecked(localExecutionException.getCause());
    }
    throw new AssertionError();
  }

  public static <V> ListenableFuture<V> immediateCancelledFuture()
  {
    return new Futures.ImmediateCancelledFuture();
  }

  public static <V, X extends Exception> CheckedFuture<V, X> immediateCheckedFuture(@Nullable V paramV)
  {
    return new ImmediateSuccessfulCheckedFuture(paramV);
  }

  public static <V, X extends Exception> CheckedFuture<V, X> immediateFailedCheckedFuture(X paramX)
  {
    Preconditions.checkNotNull(paramX);
    return new Futures.ImmediateFailedCheckedFuture(paramX);
  }

  public static <V> ListenableFuture<V> immediateFailedFuture(Throwable paramThrowable)
  {
    Preconditions.checkNotNull(paramThrowable);
    return new Futures.ImmediateFailedFuture(paramThrowable);
  }

  public static <V> ListenableFuture<V> immediateFuture(@Nullable V paramV)
  {
    return new ImmediateSuccessfulFuture(paramV);
  }

  @Beta
  public static <T> ImmutableList<ListenableFuture<T>> inCompletionOrder(Iterable<? extends ListenableFuture<? extends T>> paramIterable)
  {
    ConcurrentLinkedQueue localConcurrentLinkedQueue = Queues.newConcurrentLinkedQueue();
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    SerializingExecutor localSerializingExecutor = new SerializingExecutor(MoreExecutors.directExecutor());
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      ListenableFuture localListenableFuture = (ListenableFuture)localIterator.next();
      AsyncSettableFuture localAsyncSettableFuture = AsyncSettableFuture.create();
      localConcurrentLinkedQueue.add(localAsyncSettableFuture);
      localListenableFuture.addListener(new Futures.5(localConcurrentLinkedQueue, localListenableFuture), localSerializingExecutor);
      localBuilder.add(localAsyncSettableFuture);
    }
    return localBuilder.build();
  }

  public static <I, O> Future<O> lazyTransform(Future<I> paramFuture, Function<? super I, ? extends O> paramFunction)
  {
    Preconditions.checkNotNull(paramFuture);
    Preconditions.checkNotNull(paramFunction);
    return new Futures.3(paramFuture, paramFunction);
  }

  private static <V> ListenableFuture<List<V>> listFuture(ImmutableList<ListenableFuture<? extends V>> paramImmutableList, boolean paramBoolean, Executor paramExecutor)
  {
    return new Futures.CombinedFuture(paramImmutableList, paramBoolean, paramExecutor, new Futures.8());
  }

  public static <V, X extends Exception> CheckedFuture<V, X> makeChecked(ListenableFuture<V> paramListenableFuture, Function<? super Exception, X> paramFunction)
  {
    return new Futures.MappingCheckedFuture((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture), paramFunction);
  }

  @Nullable
  private static <X> X newFromConstructor(Constructor<X> paramConstructor, Throwable paramThrowable)
  {
    Class[] arrayOfClass = paramConstructor.getParameterTypes();
    Object[] arrayOfObject = new Object[arrayOfClass.length];
    int i = 0;
    Object localObject2;
    if (i < arrayOfClass.length)
    {
      Class localClass = arrayOfClass[i];
      if (localClass.equals(String.class))
        arrayOfObject[i] = paramThrowable.toString();
      while (true)
      {
        i++;
        break;
        boolean bool = localClass.equals(Throwable.class);
        localObject2 = null;
        if (!bool)
          break label89;
        arrayOfObject[i] = paramThrowable;
      }
    }
    try
    {
      Object localObject1 = paramConstructor.newInstance(arrayOfObject);
      localObject2 = localObject1;
      label89: return localObject2;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      return null;
    }
    catch (InstantiationException localInstantiationException)
    {
      return null;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      return null;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
    }
    return null;
  }

  private static <X extends Exception> X newWithCause(Class<X> paramClass, Throwable paramThrowable)
  {
    Iterator localIterator = preferringStrings(Arrays.asList(paramClass.getConstructors())).iterator();
    while (localIterator.hasNext())
    {
      Exception localException = (Exception)newFromConstructor((Constructor)localIterator.next(), paramThrowable);
      if (localException != null)
      {
        if (localException.getCause() == null)
          localException.initCause(paramThrowable);
        return localException;
      }
    }
    String str = String.valueOf(String.valueOf(paramClass));
    throw new IllegalArgumentException(82 + str.length() + "No appropriate constructor for exception of type " + str + " in response to chained exception", paramThrowable);
  }

  public static <V> ListenableFuture<V> nonCancellationPropagating(ListenableFuture<V> paramListenableFuture)
  {
    return new Futures.NonCancellationPropagatingFuture(paramListenableFuture);
  }

  private static <X extends Exception> List<Constructor<X>> preferringStrings(List<Constructor<X>> paramList)
  {
    return WITH_STRING_PARAM_FIRST.sortedCopy(paramList);
  }

  private static Runnable rejectionPropagatingRunnable(AbstractFuture<?> paramAbstractFuture, Runnable paramRunnable, Executor paramExecutor)
  {
    return new Futures.1(paramExecutor, paramRunnable, paramAbstractFuture);
  }

  @Beta
  public static <V> ListenableFuture<List<V>> successfulAsList(Iterable<? extends ListenableFuture<? extends V>> paramIterable)
  {
    return listFuture(ImmutableList.copyOf(paramIterable), false, MoreExecutors.directExecutor());
  }

  @Beta
  public static <V> ListenableFuture<List<V>> successfulAsList(ListenableFuture<? extends V>[] paramArrayOfListenableFuture)
  {
    return listFuture(ImmutableList.copyOf(paramArrayOfListenableFuture), false, MoreExecutors.directExecutor());
  }

  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, Function<? super I, ? extends O> paramFunction)
  {
    Preconditions.checkNotNull(paramFunction);
    Futures.ChainingListenableFuture localChainingListenableFuture = new Futures.ChainingListenableFuture(asAsyncFunction(paramFunction), paramListenableFuture, null);
    paramListenableFuture.addListener(localChainingListenableFuture, MoreExecutors.directExecutor());
    return localChainingListenableFuture;
  }

  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, Function<? super I, ? extends O> paramFunction, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFunction);
    return transform(paramListenableFuture, asAsyncFunction(paramFunction), paramExecutor);
  }

  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, AsyncFunction<? super I, ? extends O> paramAsyncFunction)
  {
    Futures.ChainingListenableFuture localChainingListenableFuture = new Futures.ChainingListenableFuture(paramAsyncFunction, paramListenableFuture, null);
    paramListenableFuture.addListener(localChainingListenableFuture, MoreExecutors.directExecutor());
    return localChainingListenableFuture;
  }

  public static <I, O> ListenableFuture<O> transform(ListenableFuture<I> paramListenableFuture, AsyncFunction<? super I, ? extends O> paramAsyncFunction, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramExecutor);
    Futures.ChainingListenableFuture localChainingListenableFuture = new Futures.ChainingListenableFuture(paramAsyncFunction, paramListenableFuture, null);
    paramListenableFuture.addListener(rejectionPropagatingRunnable(localChainingListenableFuture, localChainingListenableFuture, paramExecutor), MoreExecutors.directExecutor());
    return localChainingListenableFuture;
  }

  public static <V> ListenableFuture<V> withFallback(ListenableFuture<? extends V> paramListenableFuture, FutureFallback<? extends V> paramFutureFallback)
  {
    return withFallback(paramListenableFuture, paramFutureFallback, MoreExecutors.directExecutor());
  }

  public static <V> ListenableFuture<V> withFallback(ListenableFuture<? extends V> paramListenableFuture, FutureFallback<? extends V> paramFutureFallback, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramFutureFallback);
    return new Futures.FallbackFuture(paramListenableFuture, paramFutureFallback, paramExecutor);
  }

  private static <X extends Exception> void wrapAndThrowExceptionOrError(Throwable paramThrowable, Class<X> paramClass)
    throws Exception
  {
    if ((paramThrowable instanceof Error))
      throw new ExecutionError((Error)paramThrowable);
    if ((paramThrowable instanceof RuntimeException))
      throw new UncheckedExecutionException(paramThrowable);
    throw newWithCause(paramClass, paramThrowable);
  }

  private static void wrapAndThrowUnchecked(Throwable paramThrowable)
  {
    if ((paramThrowable instanceof Error))
      throw new ExecutionError((Error)paramThrowable);
    throw new UncheckedExecutionException(paramThrowable);
  }

  private static class ImmediateSuccessfulCheckedFuture<V, X extends Exception> extends Futures.ImmediateFuture<V>
    implements CheckedFuture<V, X>
  {

    @Nullable
    private final V value;

    ImmediateSuccessfulCheckedFuture(@Nullable V paramV)
    {
      super();
      this.value = paramV;
    }

    public V checkedGet()
    {
      return this.value;
    }

    public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
    {
      Preconditions.checkNotNull(paramTimeUnit);
      return this.value;
    }

    public V get()
    {
      return this.value;
    }
  }

  private static class ImmediateSuccessfulFuture<V> extends Futures.ImmediateFuture<V>
  {

    @Nullable
    private final V value;

    ImmediateSuccessfulFuture(@Nullable V paramV)
    {
      super();
      this.value = paramV;
    }

    public V get()
    {
      return this.value;
    }
  }
}