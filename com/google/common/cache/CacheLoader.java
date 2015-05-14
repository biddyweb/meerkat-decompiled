package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListenableFutureTask;
import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;

@GwtCompatible(emulated=true)
public abstract class CacheLoader<K, V>
{
  @Beta
  @GwtIncompatible("Executor + Futures")
  public static <K, V> CacheLoader<K, V> asyncReloading(CacheLoader<K, V> paramCacheLoader, final Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramCacheLoader);
    Preconditions.checkNotNull(paramExecutor);
    return new CacheLoader()
    {
      public V load(K paramAnonymousK)
        throws Exception
      {
        return this.val$loader.load(paramAnonymousK);
      }

      public Map<K, V> loadAll(Iterable<? extends K> paramAnonymousIterable)
        throws Exception
      {
        return this.val$loader.loadAll(paramAnonymousIterable);
      }

      public ListenableFuture<V> reload(final K paramAnonymousK, final V paramAnonymousV)
        throws Exception
      {
        ListenableFutureTask localListenableFutureTask = ListenableFutureTask.create(new Callable()
        {
          public V call()
            throws Exception
          {
            return CacheLoader.1.this.val$loader.reload(paramAnonymousK, paramAnonymousV).get();
          }
        });
        paramExecutor.execute(localListenableFutureTask);
        return localListenableFutureTask;
      }
    };
  }

  @Beta
  public static <K, V> CacheLoader<K, V> from(Function<K, V> paramFunction)
  {
    return new FunctionToCacheLoader(paramFunction);
  }

  @Beta
  public static <V> CacheLoader<Object, V> from(Supplier<V> paramSupplier)
  {
    return new SupplierToCacheLoader(paramSupplier);
  }

  public abstract V load(K paramK)
    throws Exception;

  public Map<K, V> loadAll(Iterable<? extends K> paramIterable)
    throws Exception
  {
    throw new UnsupportedLoadingOperationException();
  }

  @GwtIncompatible("Futures")
  public ListenableFuture<V> reload(K paramK, V paramV)
    throws Exception
  {
    Preconditions.checkNotNull(paramK);
    Preconditions.checkNotNull(paramV);
    return Futures.immediateFuture(load(paramK));
  }

  private static final class FunctionToCacheLoader<K, V> extends CacheLoader<K, V>
    implements Serializable
  {
    private static final long serialVersionUID;
    private final Function<K, V> computingFunction;

    public FunctionToCacheLoader(Function<K, V> paramFunction)
    {
      this.computingFunction = ((Function)Preconditions.checkNotNull(paramFunction));
    }

    public V load(K paramK)
    {
      return this.computingFunction.apply(Preconditions.checkNotNull(paramK));
    }
  }

  public static final class InvalidCacheLoadException extends RuntimeException
  {
    public InvalidCacheLoadException(String paramString)
    {
      super();
    }
  }

  private static final class SupplierToCacheLoader<V> extends CacheLoader<Object, V>
    implements Serializable
  {
    private static final long serialVersionUID;
    private final Supplier<V> computingSupplier;

    public SupplierToCacheLoader(Supplier<V> paramSupplier)
    {
      this.computingSupplier = ((Supplier)Preconditions.checkNotNull(paramSupplier));
    }

    public V load(Object paramObject)
    {
      Preconditions.checkNotNull(paramObject);
      return this.computingSupplier.get();
    }
  }

  static final class UnsupportedLoadingOperationException extends UnsupportedOperationException
  {
  }
}