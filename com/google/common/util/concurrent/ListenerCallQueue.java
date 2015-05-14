package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.Queues;
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

final class ListenerCallQueue<L>
  implements Runnable
{
  private static final Logger logger = Logger.getLogger(ListenerCallQueue.class.getName());
  private final Executor executor;

  @GuardedBy("this")
  private boolean isThreadScheduled;
  private final L listener;

  @GuardedBy("this")
  private final Queue<Callback<L>> waitQueue = Queues.newArrayDeque();

  ListenerCallQueue(L paramL, Executor paramExecutor)
  {
    this.listener = Preconditions.checkNotNull(paramL);
    this.executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }

  void add(Callback<L> paramCallback)
  {
    try
    {
      this.waitQueue.add(paramCallback);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  // ERROR //
  void execute()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   6: istore_2
    //   7: iconst_0
    //   8: istore_3
    //   9: iload_2
    //   10: ifne +10 -> 20
    //   13: aload_0
    //   14: iconst_1
    //   15: putfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   18: iconst_1
    //   19: istore_3
    //   20: aload_0
    //   21: monitorexit
    //   22: iload_3
    //   23: ifeq +13 -> 36
    //   26: aload_0
    //   27: getfield 62\011com/google/common/util/concurrent/ListenerCallQueue:executor\011Ljava/util/concurrent/Executor;
    //   30: aload_0
    //   31: invokeinterface 77 2 0
    //   36: return
    //   37: astore_1
    //   38: aload_0
    //   39: monitorexit
    //   40: aload_1
    //   41: athrow
    //   42: astore 4
    //   44: aload_0
    //   45: monitorenter
    //   46: aload_0
    //   47: iconst_0
    //   48: putfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   51: aload_0
    //   52: monitorexit
    //   53: getstatic 38\011com/google/common/util/concurrent/ListenerCallQueue:logger\011Ljava/util/logging/Logger;
    //   56: astore 6
    //   58: getstatic 83\011java/util/logging/Level:SEVERE\011Ljava/util/logging/Level;
    //   61: astore 7
    //   63: aload_0
    //   64: getfield 58\011com/google/common/util/concurrent/ListenerCallQueue:listener\011Ljava/lang/Object;
    //   67: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   70: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   73: astore 8
    //   75: aload_0
    //   76: getfield 62\011com/google/common/util/concurrent/ListenerCallQueue:executor\011Ljava/util/concurrent/Executor;
    //   79: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   82: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   85: astore 9
    //   87: aload 6
    //   89: aload 7
    //   91: new 91\011java/lang/StringBuilder
    //   94: dup
    //   95: bipush 42
    //   97: aload 8
    //   99: invokevirtual 95\011java/lang/String:length\011()I
    //   102: iadd
    //   103: aload 9
    //   105: invokevirtual 95\011java/lang/String:length\011()I
    //   108: iadd
    //   109: invokespecial 98\011java/lang/StringBuilder:<init>\011(I)V
    //   112: ldc 100
    //   114: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: aload 8
    //   119: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: ldc 106
    //   124: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: aload 9
    //   129: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   132: invokevirtual 109\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   135: aload 4
    //   137: invokevirtual 113\011java/util/logging/Logger:log\011(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   140: aload 4
    //   142: athrow
    //   143: astore 5
    //   145: aload_0
    //   146: monitorexit
    //   147: aload 5
    //   149: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\0117\01137\011finally
    //   13\01118\01137\011finally
    //   20\01122\01137\011finally
    //   38\01140\01137\011finally
    //   26\01136\01142\011java/lang/RuntimeException
    //   46\01153\011143\011finally
    //   145\011147\011143\011finally
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   8: invokestatic 118\011com/google/common/base/Preconditions:checkState\011(Z)V
    //   11: aload_0
    //   12: getfield 50\011com/google/common/util/concurrent/ListenerCallQueue:waitQueue\011Ljava/util/Queue;
    //   15: invokeinterface 122 1 0
    //   20: checkcast 124\011com/google/common/util/concurrent/ListenerCallQueue$Callback
    //   23: astore 5
    //   25: aload 5
    //   27: ifnonnull +26 -> 53
    //   30: aload_0
    //   31: iconst_0
    //   32: putfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   35: iconst_0
    //   36: istore_1
    //   37: aload_0
    //   38: monitorexit
    //   39: iconst_0
    //   40: ifeq +12 -> 52
    //   43: aload_0
    //   44: monitorenter
    //   45: aload_0
    //   46: iconst_0
    //   47: putfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   50: aload_0
    //   51: monitorexit
    //   52: return
    //   53: aload_0
    //   54: monitorexit
    //   55: aload 5
    //   57: aload_0
    //   58: getfield 58\011com/google/common/util/concurrent/ListenerCallQueue:listener\011Ljava/lang/Object;
    //   61: invokevirtual 128\011com/google/common/util/concurrent/ListenerCallQueue$Callback:call\011(Ljava/lang/Object;)V
    //   64: goto -62 -> 2
    //   67: astore 7
    //   69: getstatic 38\011com/google/common/util/concurrent/ListenerCallQueue:logger\011Ljava/util/logging/Logger;
    //   72: astore 8
    //   74: getstatic 83\011java/util/logging/Level:SEVERE\011Ljava/util/logging/Level;
    //   77: astore 9
    //   79: aload_0
    //   80: getfield 58\011com/google/common/util/concurrent/ListenerCallQueue:listener\011Ljava/lang/Object;
    //   83: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   86: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   89: astore 10
    //   91: aload 5
    //   93: invokestatic 132\011com/google/common/util/concurrent/ListenerCallQueue$Callback:access$000\011(Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;)Ljava/lang/String;
    //   96: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   99: invokestatic 89\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
    //   102: astore 11
    //   104: aload 8
    //   106: aload 9
    //   108: new 91\011java/lang/StringBuilder
    //   111: dup
    //   112: bipush 37
    //   114: aload 10
    //   116: invokevirtual 95\011java/lang/String:length\011()I
    //   119: iadd
    //   120: aload 11
    //   122: invokevirtual 95\011java/lang/String:length\011()I
    //   125: iadd
    //   126: invokespecial 98\011java/lang/StringBuilder:<init>\011(I)V
    //   129: ldc 134
    //   131: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: aload 10
    //   136: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   139: ldc 136
    //   141: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   144: aload 11
    //   146: invokevirtual 104\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: invokevirtual 109\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   152: aload 7
    //   154: invokevirtual 113\011java/util/logging/Logger:log\011(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   157: goto -155 -> 2
    //   160: astore_2
    //   161: iload_1
    //   162: ifeq +12 -> 174
    //   165: aload_0
    //   166: monitorenter
    //   167: aload_0
    //   168: iconst_0
    //   169: putfield 74\011com/google/common/util/concurrent/ListenerCallQueue:isThreadScheduled\011Z
    //   172: aload_0
    //   173: monitorexit
    //   174: aload_2
    //   175: athrow
    //   176: astore 4
    //   178: aload_0
    //   179: monitorexit
    //   180: aload 4
    //   182: athrow
    //   183: astore 6
    //   185: aload_0
    //   186: monitorexit
    //   187: aload 6
    //   189: athrow
    //   190: astore_3
    //   191: aload_0
    //   192: monitorexit
    //   193: aload_3
    //   194: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   55\01164\01167\011java/lang/RuntimeException
    //   2\0114\011160\011finally
    //   55\01164\011160\011finally
    //   69\011157\011160\011finally
    //   180\011183\011160\011finally
    //   4\01125\011176\011finally
    //   30\01135\011176\011finally
    //   37\01139\011176\011finally
    //   53\01155\011176\011finally
    //   178\011180\011176\011finally
    //   45\01152\011183\011finally
    //   185\011187\011183\011finally
    //   167\011174\011190\011finally
    //   191\011193\011190\011finally
  }

  static abstract class Callback<L>
  {
    private final String methodCall;

    Callback(String paramString)
    {
      this.methodCall = paramString;
    }

    abstract void call(L paramL);

    void enqueueOn(Iterable<ListenerCallQueue<L>> paramIterable)
    {
      Iterator localIterator = paramIterable.iterator();
      while (localIterator.hasNext())
        ((ListenerCallQueue)localIterator.next()).add(this);
    }
  }
}