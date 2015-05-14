package rx.internal.util;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Producer;
import rx.annotations.Experimental;

@Experimental
public final class BackpressureDrainManager
  implements Producer
{
  protected static final AtomicLongFieldUpdater<BackpressureDrainManager> REQUESTED_COUNT = AtomicLongFieldUpdater.newUpdater(BackpressureDrainManager.class, "requestedCount");
  protected final BackpressureQueueCallback actual;
  protected boolean emitting;
  protected Throwable exception;
  protected volatile long requestedCount;
  protected volatile boolean terminated;

  public BackpressureDrainManager(BackpressureQueueCallback paramBackpressureQueueCallback)
  {
    this.actual = paramBackpressureQueueCallback;
  }

  // ERROR //
  public final void drain()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   6: ifeq +6 -> 12
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: aload_0
    //   13: iconst_1
    //   14: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   17: aload_0
    //   18: getfield 41\011rx/internal/util/BackpressureDrainManager:terminated\011Z
    //   21: istore_2
    //   22: aload_0
    //   23: monitorexit
    //   24: aload_0
    //   25: getfield 43\011rx/internal/util/BackpressureDrainManager:requestedCount\011J
    //   28: lstore_3
    //   29: iconst_0
    //   30: istore 5
    //   32: aload_0
    //   33: getfield 36\011rx/internal/util/BackpressureDrainManager:actual\011Lrx/internal/util/BackpressureDrainManager$BackpressureQueueCallback;
    //   36: astore 8
    //   38: goto +310 -> 348
    //   41: iconst_0
    //   42: istore 5
    //   44: iload_2
    //   45: ifeq +132 -> 177
    //   48: aload 8
    //   50: invokeinterface 49 1 0
    //   55: ifnonnull +44 -> 99
    //   58: iconst_1
    //   59: istore 5
    //   61: aload 8
    //   63: aload_0
    //   64: getfield 51\011rx/internal/util/BackpressureDrainManager:exception\011Ljava/lang/Throwable;
    //   67: invokeinterface 55 2 0
    //   72: iload 5
    //   74: ifne +273 -> 347
    //   77: aload_0
    //   78: monitorenter
    //   79: aload_0
    //   80: iconst_0
    //   81: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   84: aload_0
    //   85: monitorexit
    //   86: return
    //   87: astore 10
    //   89: aload_0
    //   90: monitorexit
    //   91: aload 10
    //   93: athrow
    //   94: astore_1
    //   95: aload_0
    //   96: monitorexit
    //   97: aload_1
    //   98: athrow
    //   99: lload_3
    //   100: lconst_0
    //   101: lcmp
    //   102: ifne +75 -> 177
    //   105: aload_0
    //   106: monitorenter
    //   107: aload_0
    //   108: getfield 41\011rx/internal/util/BackpressureDrainManager:terminated\011Z
    //   111: istore_2
    //   112: aload 8
    //   114: invokeinterface 49 1 0
    //   119: ifnull +122 -> 241
    //   122: iconst_1
    //   123: istore 15
    //   125: aload_0
    //   126: getfield 43\011rx/internal/util/BackpressureDrainManager:requestedCount\011J
    //   129: ldc2_w 56
    //   132: lcmp
    //   133: ifne +149 -> 282
    //   136: iload 15
    //   138: ifne +109 -> 247
    //   141: iload_2
    //   142: ifne +105 -> 247
    //   145: iconst_1
    //   146: istore 5
    //   148: aload_0
    //   149: iconst_0
    //   150: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   153: aload_0
    //   154: monitorexit
    //   155: iload 5
    //   157: ifne +190 -> 347
    //   160: aload_0
    //   161: monitorenter
    //   162: aload_0
    //   163: iconst_0
    //   164: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   167: aload_0
    //   168: monitorexit
    //   169: return
    //   170: astore 16
    //   172: aload_0
    //   173: monitorexit
    //   174: aload 16
    //   176: athrow
    //   177: aload 8
    //   179: invokeinterface 60 1 0
    //   184: astore 11
    //   186: iconst_0
    //   187: istore 5
    //   189: aload 11
    //   191: ifnull -86 -> 105
    //   194: aload 8
    //   196: aload 11
    //   198: invokeinterface 64 2 0
    //   203: istore 12
    //   205: iload 12
    //   207: ifeq +24 -> 231
    //   210: iconst_1
    //   211: ifne +136 -> 347
    //   214: aload_0
    //   215: monitorenter
    //   216: aload_0
    //   217: iconst_0
    //   218: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   221: aload_0
    //   222: monitorexit
    //   223: return
    //   224: astore 13
    //   226: aload_0
    //   227: monitorexit
    //   228: aload 13
    //   230: athrow
    //   231: lload_3
    //   232: lconst_1
    //   233: lsub
    //   234: lstore_3
    //   235: iinc 9 1
    //   238: goto +113 -> 351
    //   241: iconst_0
    //   242: istore 15
    //   244: goto -119 -> 125
    //   247: ldc2_w 56
    //   250: lstore_3
    //   251: aload_0
    //   252: monitorexit
    //   253: goto +95 -> 348
    //   256: astore 14
    //   258: aload_0
    //   259: monitorexit
    //   260: aload 14
    //   262: athrow
    //   263: astore 6
    //   265: iload 5
    //   267: ifne +12 -> 279
    //   270: aload_0
    //   271: monitorenter
    //   272: aload_0
    //   273: iconst_0
    //   274: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   277: aload_0
    //   278: monitorexit
    //   279: aload 6
    //   281: athrow
    //   282: getstatic 30\011rx/internal/util/BackpressureDrainManager:REQUESTED_COUNT\011Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    //   285: aload_0
    //   286: iload 9
    //   288: ineg
    //   289: i2l
    //   290: invokevirtual 68\011java/util/concurrent/atomic/AtomicLongFieldUpdater:addAndGet\011(Ljava/lang/Object;J)J
    //   293: lstore_3
    //   294: lload_3
    //   295: lconst_0
    //   296: lcmp
    //   297: ifeq +67 -> 364
    //   300: iload 15
    //   302: ifne -51 -> 251
    //   305: goto +59 -> 364
    //   308: iconst_1
    //   309: istore 5
    //   311: aload_0
    //   312: iconst_0
    //   313: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   316: aload_0
    //   317: monitorexit
    //   318: iload 5
    //   320: ifne +27 -> 347
    //   323: aload_0
    //   324: monitorenter
    //   325: aload_0
    //   326: iconst_0
    //   327: putfield 39\011rx/internal/util/BackpressureDrainManager:emitting\011Z
    //   330: aload_0
    //   331: monitorexit
    //   332: return
    //   333: astore 17
    //   335: aload_0
    //   336: monitorexit
    //   337: aload 17
    //   339: athrow
    //   340: astore 7
    //   342: aload_0
    //   343: monitorexit
    //   344: aload 7
    //   346: athrow
    //   347: return
    //   348: iconst_0
    //   349: istore 9
    //   351: lload_3
    //   352: lconst_0
    //   353: lcmp
    //   354: ifgt -313 -> 41
    //   357: iload_2
    //   358: ifeq -253 -> 105
    //   361: goto -320 -> 41
    //   364: iload_2
    //   365: ifeq -57 -> 308
    //   368: iload 15
    //   370: ifeq -119 -> 251
    //   373: goto -65 -> 308
    //
    // Exception table:
    //   from\011to\011target\011type
    //   79\01186\01187\011finally
    //   89\01191\01187\011finally
    //   2\01111\01194\011finally
    //   12\01124\01194\011finally
    //   95\01197\01194\011finally
    //   162\011169\011170\011finally
    //   172\011174\011170\011finally
    //   216\011223\011224\011finally
    //   226\011228\011224\011finally
    //   107\011122\011256\011finally
    //   125\011136\011256\011finally
    //   148\011155\011256\011finally
    //   251\011253\011256\011finally
    //   258\011260\011256\011finally
    //   282\011294\011256\011finally
    //   311\011318\011256\011finally
    //   32\01138\011263\011finally
    //   48\01158\011263\011finally
    //   61\01172\011263\011finally
    //   105\011107\011263\011finally
    //   177\011186\011263\011finally
    //   194\011205\011263\011finally
    //   260\011263\011263\011finally
    //   325\011332\011333\011finally
    //   335\011337\011333\011finally
    //   272\011279\011340\011finally
    //   342\011344\011340\011finally
  }

  public final boolean isTerminated()
  {
    return this.terminated;
  }

  public final void request(long paramLong)
  {
    if (paramLong == 0L)
      return;
    label29: label73: label99: 
    while (true)
    {
      long l1 = this.requestedCount;
      if (l1 == 0L);
      for (int i = 1; l1 == 9223372036854775807L; i = 0)
      {
        if (i == 0)
          break label73;
        drain();
        return;
      }
      long l2;
      if (paramLong == 9223372036854775807L)
      {
        l2 = paramLong;
        i = 1;
      }
      while (true)
      {
        if (!REQUESTED_COUNT.compareAndSet(this, l1, l2))
          break label99;
        break label29;
        break;
        if (l1 > 9223372036854775807L - paramLong)
          l2 = 9223372036854775807L;
        else
          l2 = l1 + paramLong;
      }
    }
  }

  public final void terminate()
  {
    this.terminated = true;
  }

  public final void terminate(Throwable paramThrowable)
  {
    if (!this.terminated)
    {
      this.exception = paramThrowable;
      this.terminated = true;
    }
  }

  public final void terminateAndDrain()
  {
    this.terminated = true;
    drain();
  }

  public final void terminateAndDrain(Throwable paramThrowable)
  {
    if (!this.terminated)
    {
      this.exception = paramThrowable;
      this.terminated = true;
      drain();
    }
  }

  public static abstract interface BackpressureQueueCallback
  {
    public abstract boolean accept(Object paramObject);

    public abstract void complete(Throwable paramThrowable);

    public abstract Object peek();

    public abstract Object poll();
  }
}