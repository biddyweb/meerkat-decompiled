package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

public final class ExecutionList
{

  @VisibleForTesting
  static final Logger log = Logger.getLogger(ExecutionList.class.getName());

  @GuardedBy("this")
  private boolean executed;

  @GuardedBy("this")
  private ExecutionList.RunnableExecutorPair runnables;

  private static void executeListener(Runnable paramRunnable, Executor paramExecutor)
  {
    try
    {
      paramExecutor.execute(paramRunnable);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Logger localLogger = log;
      Level localLevel = Level.SEVERE;
      String str1 = String.valueOf(String.valueOf(paramRunnable));
      String str2 = String.valueOf(String.valueOf(paramExecutor));
      localLogger.log(localLevel, 57 + str1.length() + str2.length() + "RuntimeException while executing runnable " + str1 + " with executor " + str2, localRuntimeException);
    }
  }

  public void add(Runnable paramRunnable, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramRunnable, "Runnable was null.");
    Preconditions.checkNotNull(paramExecutor, "Executor was null.");
    try
    {
      if (!this.executed)
      {
        this.runnables = new ExecutionList.RunnableExecutorPair(paramRunnable, paramExecutor, this.runnables);
        return;
      }
      executeListener(paramRunnable, paramExecutor);
      return;
    }
    finally
    {
    }
  }

  public void execute()
  {
    Object localObject2;
    try
    {
      if (this.executed)
        return;
      this.executed = true;
      ExecutionList.RunnableExecutorPair localRunnableExecutorPair1 = this.runnables;
      this.runnables = null;
      ExecutionList.RunnableExecutorPair localRunnableExecutorPair2;
      for (localObject2 = null; localRunnableExecutorPair1 != null; localObject2 = localRunnableExecutorPair2)
      {
        localRunnableExecutorPair2 = localRunnableExecutorPair1;
        localRunnableExecutorPair1 = localRunnableExecutorPair1.next;
        localRunnableExecutorPair2.next = ((ExecutionList.RunnableExecutorPair)localObject2);
      }
    }
    finally
    {
    }
    while (localObject2 != null)
    {
      executeListener(((ExecutionList.RunnableExecutorPair)localObject2).runnable, ((ExecutionList.RunnableExecutorPair)localObject2).executor);
      localObject2 = ((ExecutionList.RunnableExecutorPair)localObject2).next;
    }
  }
}