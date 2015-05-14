package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

final class SerializingExecutor
  implements Executor
{
  private static final Logger log = Logger.getLogger(SerializingExecutor.class.getName());
  private final Executor executor;
  private final Object internalLock = new Object()
  {
    public String toString()
    {
      String str = String.valueOf(super.toString());
      if (str.length() != 0)
        return "SerializingExecutor lock: ".concat(str);
      return new String("SerializingExecutor lock: ");
    }
  };

  @GuardedBy("internalLock")
  private boolean isThreadScheduled = false;
  private final TaskRunner taskRunner = new TaskRunner(null);

  @GuardedBy("internalLock")
  private final Queue<Runnable> waitQueue = new ArrayDeque();

  public SerializingExecutor(Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramExecutor, "'executor' must not be null.");
    this.executor = paramExecutor;
  }

  // ERROR //
  public void execute(Runnable paramRunnable)
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 86
    //   3: invokestatic 70\011com/google/common/base/Preconditions:checkNotNull\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   6: pop
    //   7: aload_0
    //   8: getfield 62\011com/google/common/util/concurrent/SerializingExecutor:internalLock\011Ljava/lang/Object;
    //   11: astore_3
    //   12: aload_3
    //   13: monitorenter
    //   14: aload_0
    //   15: getfield 46\011com/google/common/util/concurrent/SerializingExecutor:waitQueue\011Ljava/util/Queue;
    //   18: aload_1
    //   19: invokeinterface 92 2 0
    //   24: pop
    //   25: aload_0
    //   26: getfield 48\011com/google/common/util/concurrent/SerializingExecutor:isThreadScheduled\011Z
    //   29: istore 6
    //   31: iconst_0
    //   32: istore 7
    //   34: iload 6
    //   36: ifne +11 -> 47
    //   39: aload_0
    //   40: iconst_1
    //   41: putfield 48\011com/google/common/util/concurrent/SerializingExecutor:isThreadScheduled\011Z
    //   44: iconst_1
    //   45: istore 7
    //   47: aload_3
    //   48: monitorexit
    //   49: iload 7
    //   51: ifeq +37 -> 88
    //   54: aload_0
    //   55: getfield 72\011com/google/common/util/concurrent/SerializingExecutor:executor\011Ljava/util/concurrent/Executor;
    //   58: aload_0
    //   59: getfield 55\011com/google/common/util/concurrent/SerializingExecutor:taskRunner\011Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;
    //   62: invokeinterface 94 2 0
    //   67: iconst_0
    //   68: ifeq +20 -> 88
    //   71: aload_0
    //   72: getfield 62\011com/google/common/util/concurrent/SerializingExecutor:internalLock\011Ljava/lang/Object;
    //   75: astore 11
    //   77: aload 11
    //   79: monitorenter
    //   80: aload_0
    //   81: iconst_0
    //   82: putfield 48\011com/google/common/util/concurrent/SerializingExecutor:isThreadScheduled\011Z
    //   85: aload 11
    //   87: monitorexit
    //   88: return
    //   89: astore 4
    //   91: aload_3
    //   92: monitorexit
    //   93: aload 4
    //   95: athrow
    //   96: astore 12
    //   98: aload 11
    //   100: monitorexit
    //   101: aload 12
    //   103: athrow
    //   104: astore 8
    //   106: iconst_1
    //   107: ifeq +20 -> 127
    //   110: aload_0
    //   111: getfield 62\011com/google/common/util/concurrent/SerializingExecutor:internalLock\011Ljava/lang/Object;
    //   114: astore 9
    //   116: aload 9
    //   118: monitorenter
    //   119: aload_0
    //   120: iconst_0
    //   121: putfield 48\011com/google/common/util/concurrent/SerializingExecutor:isThreadScheduled\011Z
    //   124: aload 9
    //   126: monitorexit
    //   127: aload 8
    //   129: athrow
    //   130: astore 10
    //   132: aload 9
    //   134: monitorexit
    //   135: aload 10
    //   137: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   14\01131\01189\011finally
    //   39\01144\01189\011finally
    //   47\01149\01189\011finally
    //   91\01193\01189\011finally
    //   80\01188\01196\011finally
    //   98\011101\01196\011finally
    //   54\01167\011104\011finally
    //   119\011127\011130\011finally
    //   132\011135\011130\011finally
  }

  private class TaskRunner
    implements Runnable
  {
    private TaskRunner()
    {
    }

    // ERROR //
    public void run()
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_1
      //   2: aload_0
      //   3: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   6: invokestatic 27\011com/google/common/util/concurrent/SerializingExecutor:access$100\011(Lcom/google/common/util/concurrent/SerializingExecutor;)Z
      //   9: invokestatic 33\011com/google/common/base/Preconditions:checkState\011(Z)V
      //   12: aload_0
      //   13: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   16: invokestatic 37\011com/google/common/util/concurrent/SerializingExecutor:access$200\011(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
      //   19: astore 6
      //   21: aload 6
      //   23: monitorenter
      //   24: aload_0
      //   25: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   28: invokestatic 41\011com/google/common/util/concurrent/SerializingExecutor:access$300\011(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/util/Queue;
      //   31: invokeinterface 47 1 0
      //   36: checkcast 6\011java/lang/Runnable
      //   39: astore 8
      //   41: aload 8
      //   43: ifnonnull +46 -> 89
      //   46: aload_0
      //   47: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   50: iconst_0
      //   51: invokestatic 51\011com/google/common/util/concurrent/SerializingExecutor:access$102\011(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
      //   54: pop
      //   55: iconst_0
      //   56: istore_1
      //   57: aload 6
      //   59: monitorexit
      //   60: iconst_0
      //   61: ifeq +27 -> 88
      //   64: aload_0
      //   65: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   68: invokestatic 37\011com/google/common/util/concurrent/SerializingExecutor:access$200\011(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
      //   71: astore 10
      //   73: aload 10
      //   75: monitorenter
      //   76: aload_0
      //   77: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   80: iconst_0
      //   81: invokestatic 51\011com/google/common/util/concurrent/SerializingExecutor:access$102\011(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
      //   84: pop
      //   85: aload 10
      //   87: monitorexit
      //   88: return
      //   89: aload 6
      //   91: monitorexit
      //   92: aload 8
      //   94: invokeinterface 53 1 0
      //   99: goto -97 -> 2
      //   102: astore 13
      //   104: invokestatic 57\011com/google/common/util/concurrent/SerializingExecutor:access$400\011()Ljava/util/logging/Logger;
      //   107: astore 14
      //   109: getstatic 63\011java/util/logging/Level:SEVERE\011Ljava/util/logging/Level;
      //   112: astore 15
      //   114: aload 8
      //   116: invokestatic 69\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
      //   119: invokestatic 69\011java/lang/String:valueOf\011(Ljava/lang/Object;)Ljava/lang/String;
      //   122: astore 16
      //   124: aload 14
      //   126: aload 15
      //   128: new 71\011java/lang/StringBuilder
      //   131: dup
      //   132: bipush 35
      //   134: aload 16
      //   136: invokevirtual 75\011java/lang/String:length\011()I
      //   139: iadd
      //   140: invokespecial 78\011java/lang/StringBuilder:<init>\011(I)V
      //   143: ldc 80
      //   145: invokevirtual 84\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   148: aload 16
      //   150: invokevirtual 84\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   153: invokevirtual 88\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   156: aload 13
      //   158: invokevirtual 94\011java/util/logging/Logger:log\011(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
      //   161: goto -159 -> 2
      //   164: astore_2
      //   165: iload_1
      //   166: ifeq +24 -> 190
      //   169: aload_0
      //   170: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   173: invokestatic 37\011com/google/common/util/concurrent/SerializingExecutor:access$200\011(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
      //   176: astore_3
      //   177: aload_3
      //   178: monitorenter
      //   179: aload_0
      //   180: getfield 12\011com/google/common/util/concurrent/SerializingExecutor$TaskRunner:this$0\011Lcom/google/common/util/concurrent/SerializingExecutor;
      //   183: iconst_0
      //   184: invokestatic 51\011com/google/common/util/concurrent/SerializingExecutor:access$102\011(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
      //   187: pop
      //   188: aload_3
      //   189: monitorexit
      //   190: aload_2
      //   191: athrow
      //   192: astore 7
      //   194: aload 6
      //   196: monitorexit
      //   197: aload 7
      //   199: athrow
      //   200: astore 11
      //   202: aload 10
      //   204: monitorexit
      //   205: aload 11
      //   207: athrow
      //   208: astore 4
      //   210: aload_3
      //   211: monitorexit
      //   212: aload 4
      //   214: athrow
      //
      // Exception table:
      //   from\011to\011target\011type
      //   92\01199\011102\011java/lang/RuntimeException
      //   2\01124\011164\011finally
      //   92\01199\011164\011finally
      //   104\011161\011164\011finally
      //   197\011200\011164\011finally
      //   24\01141\011192\011finally
      //   46\01155\011192\011finally
      //   57\01160\011192\011finally
      //   89\01192\011192\011finally
      //   194\011197\011192\011finally
      //   76\01188\011200\011finally
      //   202\011205\011200\011finally
      //   179\011190\011208\011finally
      //   210\011212\011208\011finally
    }
  }
}