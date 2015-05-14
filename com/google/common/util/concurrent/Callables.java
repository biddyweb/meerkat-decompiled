package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.util.concurrent.Callable;
import javax.annotation.Nullable;

public final class Callables
{
  public static <T> Callable<T> returning(@Nullable T paramT)
  {
    return new Callable()
    {
      public T call()
      {
        return this.val$value;
      }
    };
  }

  static Runnable threadRenaming(final Runnable paramRunnable, Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramSupplier);
    Preconditions.checkNotNull(paramRunnable);
    return new Runnable()
    {
      public void run()
      {
        Thread localThread = Thread.currentThread();
        String str = localThread.getName();
        boolean bool = Callables.trySetName((String)this.val$nameSupplier.get(), localThread);
        try
        {
          paramRunnable.run();
          return;
        }
        finally
        {
          if (bool)
            Callables.trySetName(str, localThread);
        }
      }
    };
  }

  static <T> Callable<T> threadRenaming(final Callable<T> paramCallable, Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramSupplier);
    Preconditions.checkNotNull(paramCallable);
    return new Callable()
    {
      public T call()
        throws Exception
      {
        Thread localThread = Thread.currentThread();
        String str = localThread.getName();
        boolean bool = Callables.trySetName((String)this.val$nameSupplier.get(), localThread);
        try
        {
          Object localObject2 = paramCallable.call();
          return localObject2;
        }
        finally
        {
          if (bool)
            Callables.trySetName(str, localThread);
        }
      }
    };
  }

  private static boolean trySetName(String paramString, Thread paramThread)
  {
    try
    {
      paramThread.setName(paramString);
      return true;
    }
    catch (SecurityException localSecurityException)
    {
    }
    return false;
  }
}