package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

@Beta
public abstract class AbstractScheduledService
  implements Service
{
  private static final Logger logger = Logger.getLogger(AbstractScheduledService.class.getName());
  private final AbstractService delegate = new AbstractService()
  {
    private volatile ScheduledExecutorService executorService;
    private final ReentrantLock lock = new ReentrantLock();
    private volatile Future<?> runningTask;
    private final Runnable task = new Runnable()
    {
      // ERROR //
      public void run()
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   4: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   7: invokevirtual 31\011java/util/concurrent/locks/ReentrantLock:lock\011()V
        //   10: aload_0
        //   11: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   14: getfield 35\011com/google/common/util/concurrent/AbstractScheduledService$1:this$0\011Lcom/google/common/util/concurrent/AbstractScheduledService;
        //   17: invokevirtual 40\011com/google/common/util/concurrent/AbstractScheduledService:runOneIteration\011()V
        //   20: aload_0
        //   21: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   24: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   27: invokevirtual 43\011java/util/concurrent/locks/ReentrantLock:unlock\011()V
        //   30: return
        //   31: astore_2
        //   32: aload_0
        //   33: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   36: getfield 35\011com/google/common/util/concurrent/AbstractScheduledService$1:this$0\011Lcom/google/common/util/concurrent/AbstractScheduledService;
        //   39: invokevirtual 46\011com/google/common/util/concurrent/AbstractScheduledService:shutDown\011()V
        //   42: aload_0
        //   43: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   46: aload_2
        //   47: invokevirtual 50\011com/google/common/util/concurrent/AbstractScheduledService$1:notifyFailed\011(Ljava/lang/Throwable;)V
        //   50: aload_2
        //   51: invokestatic 56\011com/google/common/base/Throwables:propagate\011(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
        //   54: athrow
        //   55: astore_1
        //   56: aload_0
        //   57: getfield 14\011com/google/common/util/concurrent/AbstractScheduledService$1$1:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
        //   60: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
        //   63: invokevirtual 43\011java/util/concurrent/locks/ReentrantLock:unlock\011()V
        //   66: aload_1
        //   67: athrow
        //   68: astore_3
        //   69: invokestatic 60\011com/google/common/util/concurrent/AbstractScheduledService:access$200\011()Ljava/util/logging/Logger;
        //   72: getstatic 66\011java/util/logging/Level:WARNING\011Ljava/util/logging/Level;
        //   75: ldc 68
        //   77: aload_3
        //   78: invokevirtual 74\011java/util/logging/Logger:log\011(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
        //   81: goto -39 -> 42
        //
        // Exception table:
        //   from\011to\011target\011type
        //   10\01120\01131\011java/lang/Throwable
        //   10\01120\01155\011finally
        //   32\01142\01155\011finally
        //   42\01155\01155\011finally
        //   69\01181\01155\011finally
        //   32\01142\01168\011java/lang/Exception
      }
    };

    protected final void doStart()
    {
      this.executorService = MoreExecutors.renamingDecorator(AbstractScheduledService.this.executor(), new Supplier()
      {
        public String get()
        {
          String str1 = String.valueOf(String.valueOf(AbstractScheduledService.this.serviceName()));
          String str2 = String.valueOf(String.valueOf(AbstractScheduledService.1.this.state()));
          return 1 + str1.length() + str2.length() + str1 + " " + str2;
        }
      });
      this.executorService.execute(new Runnable()
      {
        public void run()
        {
          AbstractScheduledService.1.this.lock.lock();
          try
          {
            AbstractScheduledService.this.startUp();
            AbstractScheduledService.1.access$302(AbstractScheduledService.1.this, AbstractScheduledService.this.scheduler().schedule(AbstractScheduledService.this.delegate, AbstractScheduledService.1.this.executorService, AbstractScheduledService.1.this.task));
            AbstractScheduledService.1.this.notifyStarted();
            return;
          }
          catch (Throwable localThrowable)
          {
            AbstractScheduledService.1.this.notifyFailed(localThrowable);
            throw Throwables.propagate(localThrowable);
          }
          finally
          {
            AbstractScheduledService.1.this.lock.unlock();
          }
        }
      });
    }

    protected final void doStop()
    {
      this.runningTask.cancel(false);
      this.executorService.execute(new Runnable()
      {
        // ERROR //
        public void run()
        {
          // Byte code:
          //   0: aload_0
          //   1: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   4: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   7: invokevirtual 31\011java/util/concurrent/locks/ReentrantLock:lock\011()V
          //   10: aload_0
          //   11: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   14: invokevirtual 35\011com/google/common/util/concurrent/AbstractScheduledService$1:state\011()Lcom/google/common/util/concurrent/Service$State;
          //   17: astore_3
          //   18: getstatic 41\011com/google/common/util/concurrent/Service$State:STOPPING\011Lcom/google/common/util/concurrent/Service$State;
          //   21: astore 4
          //   23: aload_3
          //   24: aload 4
          //   26: if_acmpeq +14 -> 40
          //   29: aload_0
          //   30: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   33: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   36: invokevirtual 44\011java/util/concurrent/locks/ReentrantLock:unlock\011()V
          //   39: return
          //   40: aload_0
          //   41: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   44: getfield 48\011com/google/common/util/concurrent/AbstractScheduledService$1:this$0\011Lcom/google/common/util/concurrent/AbstractScheduledService;
          //   47: invokevirtual 53\011com/google/common/util/concurrent/AbstractScheduledService:shutDown\011()V
          //   50: aload_0
          //   51: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   54: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   57: invokevirtual 44\011java/util/concurrent/locks/ReentrantLock:unlock\011()V
          //   60: aload_0
          //   61: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   64: invokevirtual 56\011com/google/common/util/concurrent/AbstractScheduledService$1:notifyStopped\011()V
          //   67: return
          //   68: astore_1
          //   69: aload_0
          //   70: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   73: aload_1
          //   74: invokevirtual 60\011com/google/common/util/concurrent/AbstractScheduledService$1:notifyFailed\011(Ljava/lang/Throwable;)V
          //   77: aload_1
          //   78: invokestatic 66\011com/google/common/base/Throwables:propagate\011(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
          //   81: athrow
          //   82: astore_2
          //   83: aload_0
          //   84: getfield 17\011com/google/common/util/concurrent/AbstractScheduledService$1$4:this$1\011Lcom/google/common/util/concurrent/AbstractScheduledService$1;
          //   87: invokestatic 26\011com/google/common/util/concurrent/AbstractScheduledService$1:access$100\011(Lcom/google/common/util/concurrent/AbstractScheduledService$1;)Ljava/util/concurrent/locks/ReentrantLock;
          //   90: invokevirtual 44\011java/util/concurrent/locks/ReentrantLock:unlock\011()V
          //   93: aload_2
          //   94: athrow
          //
          // Exception table:
          //   from\011to\011target\011type
          //   0\01110\01168\011java/lang/Throwable
          //   29\01139\01168\011java/lang/Throwable
          //   50\01167\01168\011java/lang/Throwable
          //   83\01195\01168\011java/lang/Throwable
          //   10\01123\01182\011finally
          //   40\01150\01182\011finally
        }
      });
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

  protected ScheduledExecutorService executor()
  {
    final ScheduledExecutorService localScheduledExecutorService = Executors.newSingleThreadScheduledExecutor(new ThreadFactory()
    {
      public Thread newThread(Runnable paramAnonymousRunnable)
      {
        return MoreExecutors.newThread(AbstractScheduledService.this.serviceName(), paramAnonymousRunnable);
      }
    });
    addListener(new Service.Listener()
    {
      public void failed(Service.State paramAnonymousState, Throwable paramAnonymousThrowable)
      {
        localScheduledExecutorService.shutdown();
      }

      public void terminated(Service.State paramAnonymousState)
      {
        localScheduledExecutorService.shutdown();
      }
    }
    , MoreExecutors.directExecutor());
    return localScheduledExecutorService;
  }

  public final Throwable failureCause()
  {
    return this.delegate.failureCause();
  }

  public final boolean isRunning()
  {
    return this.delegate.isRunning();
  }

  protected abstract void runOneIteration()
    throws Exception;

  protected abstract Scheduler scheduler();

  protected String serviceName()
  {
    return getClass().getSimpleName();
  }

  protected void shutDown()
    throws Exception
  {
  }

  public final Service startAsync()
  {
    this.delegate.startAsync();
    return this;
  }

  protected void startUp()
    throws Exception
  {
  }

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

  @Beta
  public static abstract class CustomScheduler extends AbstractScheduledService.Scheduler
  {
    public CustomScheduler()
    {
      super();
    }

    protected abstract Schedule getNextSchedule()
      throws Exception;

    final Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable)
    {
      ReschedulableCallable localReschedulableCallable = new ReschedulableCallable(paramAbstractService, paramScheduledExecutorService, paramRunnable);
      localReschedulableCallable.reschedule();
      return localReschedulableCallable;
    }

    private class ReschedulableCallable extends ForwardingFuture<Void>
      implements Callable<Void>
    {

      @GuardedBy("lock")
      private Future<Void> currentFuture;
      private final ScheduledExecutorService executor;
      private final ReentrantLock lock = new ReentrantLock();
      private final AbstractService service;
      private final Runnable wrappedRunnable;

      ReschedulableCallable(AbstractService paramScheduledExecutorService, ScheduledExecutorService paramRunnable, Runnable arg4)
      {
        Object localObject;
        this.wrappedRunnable = localObject;
        this.executor = paramRunnable;
        this.service = paramScheduledExecutorService;
      }

      public Void call()
        throws Exception
      {
        this.wrappedRunnable.run();
        reschedule();
        return null;
      }

      public boolean cancel(boolean paramBoolean)
      {
        this.lock.lock();
        try
        {
          boolean bool = this.currentFuture.cancel(paramBoolean);
          return bool;
        }
        finally
        {
          this.lock.unlock();
        }
      }

      protected Future<Void> delegate()
      {
        throw new UnsupportedOperationException("Only cancel is supported by this future");
      }

      public void reschedule()
      {
        this.lock.lock();
        try
        {
          if ((this.currentFuture == null) || (!this.currentFuture.isCancelled()))
          {
            AbstractScheduledService.CustomScheduler.Schedule localSchedule = AbstractScheduledService.CustomScheduler.this.getNextSchedule();
            this.currentFuture = this.executor.schedule(this, AbstractScheduledService.CustomScheduler.Schedule.access$700(localSchedule), AbstractScheduledService.CustomScheduler.Schedule.access$800(localSchedule));
          }
          return;
        }
        catch (Throwable localThrowable)
        {
          this.service.notifyFailed(localThrowable);
          return;
        }
        finally
        {
          this.lock.unlock();
        }
      }
    }

    @Beta
    protected static final class Schedule
    {
      private final long delay;
      private final TimeUnit unit;

      public Schedule(long paramLong, TimeUnit paramTimeUnit)
      {
        this.delay = paramLong;
        this.unit = ((TimeUnit)Preconditions.checkNotNull(paramTimeUnit));
      }
    }
  }

  public static abstract class Scheduler
  {
    public static Scheduler newFixedDelaySchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
    {
      return new Scheduler(paramLong1)
      {
        public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
        {
          return paramAnonymousScheduledExecutorService.scheduleWithFixedDelay(paramAnonymousRunnable, this.val$initialDelay, paramTimeUnit, this.val$unit);
        }
      };
    }

    public static Scheduler newFixedRateSchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
    {
      return new Scheduler(paramLong1)
      {
        public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
        {
          return paramAnonymousScheduledExecutorService.scheduleAtFixedRate(paramAnonymousRunnable, this.val$initialDelay, paramTimeUnit, this.val$unit);
        }
      };
    }

    abstract Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable);
  }
}