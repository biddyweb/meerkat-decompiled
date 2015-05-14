package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Beta
public abstract class AbstractIdleService
  implements Service
{
  private final Service delegate = new AbstractService()
  {
    protected final void doStart()
    {
      MoreExecutors.renamingDecorator(AbstractIdleService.this.executor(), AbstractIdleService.this.threadNameSupplier).execute(new Runnable()
      {
        public void run()
        {
          try
          {
            AbstractIdleService.this.startUp();
            AbstractIdleService.2.this.notifyStarted();
            return;
          }
          catch (Throwable localThrowable)
          {
            AbstractIdleService.2.this.notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
        }
      });
    }

    protected final void doStop()
    {
      MoreExecutors.renamingDecorator(AbstractIdleService.this.executor(), AbstractIdleService.this.threadNameSupplier).execute(new Runnable()
      {
        public void run()
        {
          try
          {
            AbstractIdleService.this.shutDown();
            AbstractIdleService.2.this.notifyStopped();
            return;
          }
          catch (Throwable localThrowable)
          {
            AbstractIdleService.2.this.notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
        }
      });
    }
  };
  private final Supplier<String> threadNameSupplier = new Supplier()
  {
    public String get()
    {
      String str1 = String.valueOf(String.valueOf(AbstractIdleService.this.serviceName()));
      String str2 = String.valueOf(String.valueOf(AbstractIdleService.this.state()));
      return 1 + str1.length() + str2.length() + str1 + " " + str2;
    }
  };

  public final void addListener(Service.Listener paramListener, Executor paramExecutor)
  {
    this.delegate.addListener(paramListener, paramExecutor);
  }

  public final void awaitRunning()
  {
    this.delegate.awaitRunning();
  }

  public final void awaitRunning(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    this.delegate.awaitRunning(paramLong, paramTimeUnit);
  }

  public final void awaitTerminated()
  {
    this.delegate.awaitTerminated();
  }

  public final void awaitTerminated(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    this.delegate.awaitTerminated(paramLong, paramTimeUnit);
  }

  protected Executor executor()
  {
    return new Executor()
    {
      public void execute(Runnable paramAnonymousRunnable)
      {
        MoreExecutors.newThread((String)AbstractIdleService.this.threadNameSupplier.get(), paramAnonymousRunnable).start();
      }
    };
  }

  public final Throwable failureCause()
  {
    return this.delegate.failureCause();
  }

  public final boolean isRunning()
  {
    return this.delegate.isRunning();
  }

  protected String serviceName()
  {
    return getClass().getSimpleName();
  }

  protected abstract void shutDown()
    throws Exception;

  public final Service startAsync()
  {
    this.delegate.startAsync();
    return this;
  }

  protected abstract void startUp()
    throws Exception;

  public final Service.State state()
  {
    return this.delegate.state();
  }

  public final Service stopAsync()
  {
    this.delegate.stopAsync();
    return this;
  }

  public String toString()
  {
    String str1 = String.valueOf(String.valueOf(serviceName()));
    String str2 = String.valueOf(String.valueOf(state()));
    return 3 + str1.length() + str2.length() + str1 + " [" + str2 + "]";
  }
}