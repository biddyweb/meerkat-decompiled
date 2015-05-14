package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Beta
public abstract interface Service
{
  public abstract void addListener(Listener paramListener, Executor paramExecutor);

  public abstract void awaitRunning();

  public abstract void awaitRunning(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException;

  public abstract void awaitTerminated();

  public abstract void awaitTerminated(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException;

  public abstract Throwable failureCause();

  public abstract boolean isRunning();

  public abstract Service startAsync();

  public abstract State state();

  public abstract Service stopAsync();

  @Beta
  public static abstract class Listener
  {
    public void failed(Service.State paramState, Throwable paramThrowable)
    {
    }

    public void running()
    {
    }

    public void starting()
    {
    }

    public void stopping(Service.State paramState)
    {
    }

    public void terminated(Service.State paramState)
    {
    }
  }

  @Beta
  public static abstract enum State
  {
    static
    {
      // Byte code:
      //   0: new 19\011com/google/common/util/concurrent/Service$State$1
      //   3: dup
      //   4: ldc 20
      //   6: iconst_0
      //   7: invokespecial 24\011com/google/common/util/concurrent/Service$State$1:<init>\011(Ljava/lang/String;I)V
      //   10: putstatic 26\011com/google/common/util/concurrent/Service$State:NEW\011Lcom/google/common/util/concurrent/Service$State;
      //   13: new 28\011com/google/common/util/concurrent/Service$State$2
      //   16: dup
      //   17: ldc 29
      //   19: iconst_1
      //   20: invokespecial 30\011com/google/common/util/concurrent/Service$State$2:<init>\011(Ljava/lang/String;I)V
      //   23: putstatic 32\011com/google/common/util/concurrent/Service$State:STARTING\011Lcom/google/common/util/concurrent/Service$State;
      //   26: new 34\011com/google/common/util/concurrent/Service$State$3
      //   29: dup
      //   30: ldc 35
      //   32: iconst_2
      //   33: invokespecial 36\011com/google/common/util/concurrent/Service$State$3:<init>\011(Ljava/lang/String;I)V
      //   36: putstatic 38\011com/google/common/util/concurrent/Service$State:RUNNING\011Lcom/google/common/util/concurrent/Service$State;
      //   39: new 40\011com/google/common/util/concurrent/Service$State$4
      //   42: dup
      //   43: ldc 41
      //   45: iconst_3
      //   46: invokespecial 42\011com/google/common/util/concurrent/Service$State$4:<init>\011(Ljava/lang/String;I)V
      //   49: putstatic 44\011com/google/common/util/concurrent/Service$State:STOPPING\011Lcom/google/common/util/concurrent/Service$State;
      //   52: new 46\011com/google/common/util/concurrent/Service$State$5
      //   55: dup
      //   56: ldc 47
      //   58: iconst_4
      //   59: invokespecial 48\011com/google/common/util/concurrent/Service$State$5:<init>\011(Ljava/lang/String;I)V
      //   62: putstatic 50\011com/google/common/util/concurrent/Service$State:TERMINATED\011Lcom/google/common/util/concurrent/Service$State;
      //   65: new 52\011com/google/common/util/concurrent/Service$State$6
      //   68: dup
      //   69: ldc 53
      //   71: iconst_5
      //   72: invokespecial 54\011com/google/common/util/concurrent/Service$State$6:<init>\011(Ljava/lang/String;I)V
      //   75: putstatic 56\011com/google/common/util/concurrent/Service$State:FAILED\011Lcom/google/common/util/concurrent/Service$State;
      //   78: bipush 6
      //   80: anewarray 2\011com/google/common/util/concurrent/Service$State
      //   83: astore_0
      //   84: aload_0
      //   85: iconst_0
      //   86: getstatic 26\011com/google/common/util/concurrent/Service$State:NEW\011Lcom/google/common/util/concurrent/Service$State;
      //   89: aastore
      //   90: aload_0
      //   91: iconst_1
      //   92: getstatic 32\011com/google/common/util/concurrent/Service$State:STARTING\011Lcom/google/common/util/concurrent/Service$State;
      //   95: aastore
      //   96: aload_0
      //   97: iconst_2
      //   98: getstatic 38\011com/google/common/util/concurrent/Service$State:RUNNING\011Lcom/google/common/util/concurrent/Service$State;
      //   101: aastore
      //   102: aload_0
      //   103: iconst_3
      //   104: getstatic 44\011com/google/common/util/concurrent/Service$State:STOPPING\011Lcom/google/common/util/concurrent/Service$State;
      //   107: aastore
      //   108: aload_0
      //   109: iconst_4
      //   110: getstatic 50\011com/google/common/util/concurrent/Service$State:TERMINATED\011Lcom/google/common/util/concurrent/Service$State;
      //   113: aastore
      //   114: aload_0
      //   115: iconst_5
      //   116: getstatic 56\011com/google/common/util/concurrent/Service$State:FAILED\011Lcom/google/common/util/concurrent/Service$State;
      //   119: aastore
      //   120: aload_0
      //   121: putstatic 58\011com/google/common/util/concurrent/Service$State:$VALUES\011[Lcom/google/common/util/concurrent/Service$State;
      //   124: return
    }

    abstract boolean isTerminal();
  }
}