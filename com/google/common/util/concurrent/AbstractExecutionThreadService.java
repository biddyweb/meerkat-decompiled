package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Supplier;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.logging.Logger;

@Beta
public abstract class AbstractExecutionThreadService
  implements Service
{
  private static final Logger logger = Logger.getLogger(AbstractExecutionThreadService.class.getName());
  private final Service delegate = new AbstractService()
  {
    protected final void doStart()
    {
      MoreExecutors.renamingDecorator(AbstractExecutionThreadService.this.executor(), new Supplier()
      {
        public String get()
        {
          return AbstractExecutionThreadService.this.serviceName();
        }
      }).execute(new Runnable()
      {
        // ERROR //
        public void run()
        {
          // Byte code:
          //   0: aload_0
          //   1: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   4: getfield 28\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
          //   7: invokevirtual 33\011com/google/common/util/concurrent/AbstractExecutionThreadService:startUp\011()V
          //   10: aload_0
          //   11: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   14: invokevirtual 36\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyStarted\011()V
          //   17: aload_0
          //   18: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   21: invokevirtual 40\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:isRunning\011()Z
          //   24: istore_2
          //   25: iload_2
          //   26: ifeq +13 -> 39
          //   29: aload_0
          //   30: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   33: getfield 28\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
          //   36: invokevirtual 42\011com/google/common/util/concurrent/AbstractExecutionThreadService:run\011()V
          //   39: aload_0
          //   40: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   43: getfield 28\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
          //   46: invokevirtual 45\011com/google/common/util/concurrent/AbstractExecutionThreadService:shutDown\011()V
          //   49: aload_0
          //   50: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   53: invokevirtual 48\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyStopped\011()V
          //   56: return
          //   57: astore_3
          //   58: aload_0
          //   59: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   62: getfield 28\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:this$0\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService;
          //   65: invokevirtual 45\011com/google/common/util/concurrent/AbstractExecutionThreadService:shutDown\011()V
          //   68: aload_3
          //   69: athrow
          //   70: astore_1
          //   71: aload_0
          //   72: getfield 17\011com/google/common/util/concurrent/AbstractExecutionThreadService$1$2:this$1\011Lcom/google/common/util/concurrent/AbstractExecutionThreadService$1;
          //   75: aload_1
          //   76: invokevirtual 52\011com/google/common/util/concurrent/AbstractExecutionThreadService$1:notifyFailed\011(Ljava/lang/Throwable;)V
          //   79: aload_1
          //   80: invokestatic 58\011com/google/common/base/Throwables:propagate\011(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
          //   83: athrow
          //   84: astore 4
          //   86: invokestatic 62\011com/google/common/util/concurrent/AbstractExecutionThreadService:access$000\011()Ljava/util/logging/Logger;
          //   89: getstatic 68\011java/util/logging/Level:WARNING\011Ljava/util/logging/Level;
          //   92: ldc 70
          //   94: aload 4
          //   96: invokevirtual 76\011java/util/logging/Logger:log\011(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
          //   99: goto -31 -> 68
          //
          // Exception table:
          //   from\011to\011target\011type
          //   29\01139\01157\011java/lang/Throwable
          //   0\01125\01170\011java/lang/Throwable
          //   39\01156\01170\011java/lang/Throwable
          //   58\01168\01170\011java/lang/Throwable
          //   68\01170\01170\011java/lang/Throwable
          //   86\01199\01170\011java/lang/Throwable
          //   58\01168\01184\011java/lang/Exception
        }
      });
    }

    protected void doStop()
    {
      AbstractExecutionThreadService.this.triggerShutdown();
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
        MoreExecutors.newThread(AbstractExecutionThreadService.this.serviceName(), paramAnonymousRunnable).start();
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

  protected abstract void run()
    throws Exception;

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

  protected void triggerShutdown()
  {
  }
}