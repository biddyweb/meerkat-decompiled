package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.base.Throwables;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class MoreExecutors
{
  @Beta
  public static void addDelayedShutdownHook(ExecutorService paramExecutorService, long paramLong, TimeUnit paramTimeUnit)
  {
    new MoreExecutors.Application().addDelayedShutdownHook(paramExecutorService, paramLong, paramTimeUnit);
  }

  public static Executor directExecutor()
  {
    return MoreExecutors.DirectExecutor.INSTANCE;
  }

  @Beta
  public static ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    return new MoreExecutors.Application().getExitingExecutorService(paramThreadPoolExecutor);
  }

  @Beta
  public static ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    return new MoreExecutors.Application().getExitingExecutorService(paramThreadPoolExecutor, paramLong, paramTimeUnit);
  }

  @Beta
  public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    return new MoreExecutors.Application().getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor);
  }

  @Beta
  public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    return new MoreExecutors.Application().getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor, paramLong, paramTimeUnit);
  }

  // ERROR //
  static <T> T invokeAnyImpl(ListeningExecutorService paramListeningExecutorService, java.util.Collection<? extends Callable<T>> paramCollection, boolean paramBoolean, long paramLong)
    throws InterruptedException, java.util.concurrent.ExecutionException, java.util.concurrent.TimeoutException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 59\011com/google/common/base/Preconditions:checkNotNull\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   4: pop
    //   5: aload_1
    //   6: invokeinterface 65 1 0
    //   11: istore 6
    //   13: iload 6
    //   15: ifle +184 -> 199
    //   18: iconst_1
    //   19: istore 7
    //   21: iload 7
    //   23: invokestatic 69\011com/google/common/base/Preconditions:checkArgument\011(Z)V
    //   26: iload 6
    //   28: invokestatic 75\011com/google/common/collect/Lists:newArrayListWithCapacity\011(I)Ljava/util/ArrayList;
    //   31: astore 8
    //   33: invokestatic 81\011com/google/common/collect/Queues:newLinkedBlockingQueue\011()Ljava/util/concurrent/LinkedBlockingQueue;
    //   36: astore 9
    //   38: iload_2
    //   39: ifeq +166 -> 205
    //   42: invokestatic 87\011java/lang/System:nanoTime\011()J
    //   45: lstore 10
    //   47: aload_1
    //   48: invokeinterface 91 1 0
    //   53: astore 15
    //   55: aload 8
    //   57: aload_0
    //   58: aload 15
    //   60: invokeinterface 97 1 0
    //   65: checkcast 99\011java/util/concurrent/Callable
    //   68: aload 9
    //   70: invokestatic 103\011com/google/common/util/concurrent/MoreExecutors:submitAndAddQueueListener\011(Lcom/google/common/util/concurrent/ListeningExecutorService;Ljava/util/concurrent/Callable;Ljava/util/concurrent/BlockingQueue;)Lcom/google/common/util/concurrent/ListenableFuture;
    //   73: invokeinterface 109 2 0
    //   78: pop
    //   79: iload 6
    //   81: iconst_1
    //   82: isub
    //   83: istore 17
    //   85: iconst_1
    //   86: istore 18
    //   88: aconst_null
    //   89: astore 19
    //   91: aload 9
    //   93: invokeinterface 114 1 0
    //   98: checkcast 116\011java/util/concurrent/Future
    //   101: astore 21
    //   103: aload 21
    //   105: ifnonnull +38 -> 143
    //   108: iload 17
    //   110: ifle +101 -> 211
    //   113: iinc 17 255
    //   116: aload 8
    //   118: aload_0
    //   119: aload 15
    //   121: invokeinterface 97 1 0
    //   126: checkcast 99\011java/util/concurrent/Callable
    //   129: aload 9
    //   131: invokestatic 103\011com/google/common/util/concurrent/MoreExecutors:submitAndAddQueueListener\011(Lcom/google/common/util/concurrent/ListeningExecutorService;Ljava/util/concurrent/Callable;Ljava/util/concurrent/BlockingQueue;)Lcom/google/common/util/concurrent/ListenableFuture;
    //   134: invokeinterface 109 2 0
    //   139: pop
    //   140: iinc 18 1
    //   143: aload 21
    //   145: ifnull +231 -> 376
    //   148: iinc 18 255
    //   151: aload 21
    //   153: invokeinterface 119 1 0
    //   158: astore 25
    //   160: aload 8
    //   162: invokeinterface 120 1 0
    //   167: astore 26
    //   169: aload 26
    //   171: invokeinterface 124 1 0
    //   176: ifeq +190 -> 366
    //   179: aload 26
    //   181: invokeinterface 97 1 0
    //   186: checkcast 116\011java/util/concurrent/Future
    //   189: iconst_1
    //   190: invokeinterface 128 2 0
    //   195: pop
    //   196: goto -27 -> 169
    //   199: iconst_0
    //   200: istore 7
    //   202: goto -181 -> 21
    //   205: lconst_0
    //   206: lstore 10
    //   208: goto -161 -> 47
    //   211: iload 18
    //   213: ifne +62 -> 275
    //   216: aload 19
    //   218: ifnonnull +151 -> 369
    //   221: new 49\011java/util/concurrent/ExecutionException
    //   224: dup
    //   225: aconst_null
    //   226: invokespecial 131\011java/util/concurrent/ExecutionException:<init>\011(Ljava/lang/Throwable;)V
    //   229: astore 31
    //   231: aload 31
    //   233: athrow
    //   234: astore 12
    //   236: aload 8
    //   238: invokeinterface 120 1 0
    //   243: astore 13
    //   245: aload 13
    //   247: invokeinterface 124 1 0
    //   252: ifeq +111 -> 363
    //   255: aload 13
    //   257: invokeinterface 97 1 0
    //   262: checkcast 116\011java/util/concurrent/Future
    //   265: iconst_1
    //   266: invokeinterface 128 2 0
    //   271: pop
    //   272: goto -27 -> 245
    //   275: iload_2
    //   276: ifeq +56 -> 332
    //   279: getstatic 137\011java/util/concurrent/TimeUnit:NANOSECONDS\011Ljava/util/concurrent/TimeUnit;
    //   282: astore 28
    //   284: aload 9
    //   286: lload_3
    //   287: aload 28
    //   289: invokeinterface 140 4 0
    //   294: checkcast 116\011java/util/concurrent/Future
    //   297: astore 21
    //   299: aload 21
    //   301: ifnonnull +11 -> 312
    //   304: new 51\011java/util/concurrent/TimeoutException
    //   307: dup
    //   308: invokespecial 141\011java/util/concurrent/TimeoutException:<init>\011()V
    //   311: athrow
    //   312: invokestatic 87\011java/lang/System:nanoTime\011()J
    //   315: lstore 29
    //   317: lload_3
    //   318: lload 29
    //   320: lload 10
    //   322: lsub
    //   323: lsub
    //   324: lstore_3
    //   325: lload 29
    //   327: lstore 10
    //   329: goto -186 -> 143
    //   332: aload 9
    //   334: invokeinterface 144 1 0
    //   339: checkcast 116\011java/util/concurrent/Future
    //   342: astore 21
    //   344: goto -201 -> 143
    //   347: astore 23
    //   349: new 49\011java/util/concurrent/ExecutionException
    //   352: dup
    //   353: aload 23
    //   355: invokespecial 131\011java/util/concurrent/ExecutionException:<init>\011(Ljava/lang/Throwable;)V
    //   358: astore 22
    //   360: goto +37 -> 397
    //   363: aload 12
    //   365: athrow
    //   366: aload 25
    //   368: areturn
    //   369: aload 19
    //   371: astore 31
    //   373: goto -142 -> 231
    //   376: aload 19
    //   378: astore 22
    //   380: goto +17 -> 397
    //   383: astore 12
    //   385: aload 19
    //   387: pop
    //   388: goto -152 -> 236
    //   391: astore 24
    //   393: aload 24
    //   395: astore 22
    //   397: aload 22
    //   399: astore 19
    //   401: goto -310 -> 91
    //
    // Exception table:
    //   from\011to\011target\011type
    //   42\01147\011234\011finally
    //   47\01179\011234\011finally
    //   231\011234\011234\011finally
    //   151\011160\011347\011java/lang/RuntimeException
    //   91\011103\011383\011finally
    //   116\011140\011383\011finally
    //   151\011160\011383\011finally
    //   221\011231\011383\011finally
    //   279\011299\011383\011finally
    //   304\011312\011383\011finally
    //   312\011317\011383\011finally
    //   332\011344\011383\011finally
    //   349\011360\011383\011finally
    //   151\011160\011391\011java/util/concurrent/ExecutionException
  }

  private static boolean isAppEngine()
  {
    if (System.getProperty("com.google.appengine.runtime.environment") == null);
    while (true)
    {
      return false;
      try
      {
        Object localObject = Class.forName("com.google.apphosting.api.ApiProxy").getMethod("getCurrentEnvironment", new Class[0]).invoke(null, new Object[0]);
        if (localObject != null)
          return true;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        return false;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        return false;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        return false;
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
      }
    }
    return false;
  }

  public static ListeningExecutorService listeningDecorator(ExecutorService paramExecutorService)
  {
    if ((paramExecutorService instanceof ListeningExecutorService))
      return (ListeningExecutorService)paramExecutorService;
    if ((paramExecutorService instanceof ScheduledExecutorService))
      return new MoreExecutors.ScheduledListeningDecorator((ScheduledExecutorService)paramExecutorService);
    return new MoreExecutors.ListeningDecorator(paramExecutorService);
  }

  public static ListeningScheduledExecutorService listeningDecorator(ScheduledExecutorService paramScheduledExecutorService)
  {
    if ((paramScheduledExecutorService instanceof ListeningScheduledExecutorService))
      return (ListeningScheduledExecutorService)paramScheduledExecutorService;
    return new MoreExecutors.ScheduledListeningDecorator(paramScheduledExecutorService);
  }

  public static ListeningExecutorService newDirectExecutorService()
  {
    return new MoreExecutors.DirectExecutorService(null);
  }

  static Thread newThread(String paramString, Runnable paramRunnable)
  {
    Preconditions.checkNotNull(paramString);
    Preconditions.checkNotNull(paramRunnable);
    Thread localThread = platformThreadFactory().newThread(paramRunnable);
    try
    {
      localThread.setName(paramString);
      return localThread;
    }
    catch (SecurityException localSecurityException)
    {
    }
    return localThread;
  }

  @Beta
  public static ThreadFactory platformThreadFactory()
  {
    if (!isAppEngine())
      return Executors.defaultThreadFactory();
    try
    {
      ThreadFactory localThreadFactory = (ThreadFactory)Class.forName("com.google.appengine.api.ThreadManager").getMethod("currentRequestThreadFactory", new Class[0]).invoke(null, new Object[0]);
      return localThreadFactory;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localIllegalAccessException);
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localClassNotFoundException);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new RuntimeException("Couldn't invoke ThreadManager.currentRequestThreadFactory", localNoSuchMethodException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw Throwables.propagate(localInvocationTargetException.getCause());
    }
  }

  static Executor renamingDecorator(Executor paramExecutor, Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramExecutor);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine())
      return paramExecutor;
    return new MoreExecutors.2(paramExecutor, paramSupplier);
  }

  static ExecutorService renamingDecorator(ExecutorService paramExecutorService, Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramExecutorService);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine())
      return paramExecutorService;
    return new MoreExecutors.3(paramExecutorService, paramSupplier);
  }

  static ScheduledExecutorService renamingDecorator(ScheduledExecutorService paramScheduledExecutorService, Supplier<String> paramSupplier)
  {
    Preconditions.checkNotNull(paramScheduledExecutorService);
    Preconditions.checkNotNull(paramSupplier);
    if (isAppEngine())
      return paramScheduledExecutorService;
    return new MoreExecutors.4(paramScheduledExecutorService, paramSupplier);
  }

  @Deprecated
  public static ListeningExecutorService sameThreadExecutor()
  {
    return new MoreExecutors.DirectExecutorService(null);
  }

  @Beta
  public static boolean shutdownAndAwaitTermination(ExecutorService paramExecutorService, long paramLong, TimeUnit paramTimeUnit)
  {
    Preconditions.checkNotNull(paramTimeUnit);
    paramExecutorService.shutdown();
    try
    {
      long l = TimeUnit.NANOSECONDS.convert(paramLong, paramTimeUnit) / 2L;
      if (!paramExecutorService.awaitTermination(l, TimeUnit.NANOSECONDS))
      {
        paramExecutorService.shutdownNow();
        paramExecutorService.awaitTermination(l, TimeUnit.NANOSECONDS);
      }
      return paramExecutorService.isTerminated();
    }
    catch (InterruptedException localInterruptedException)
    {
      while (true)
      {
        Thread.currentThread().interrupt();
        paramExecutorService.shutdownNow();
      }
    }
  }

  private static <T> ListenableFuture<T> submitAndAddQueueListener(ListeningExecutorService paramListeningExecutorService, Callable<T> paramCallable, BlockingQueue<Future<T>> paramBlockingQueue)
  {
    ListenableFuture localListenableFuture = paramListeningExecutorService.submit(paramCallable);
    localListenableFuture.addListener(new MoreExecutors.1(paramBlockingQueue, localListenableFuture), directExecutor());
    return localListenableFuture;
  }

  private static void useDaemonThreadFactory(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    paramThreadPoolExecutor.setThreadFactory(new ThreadFactoryBuilder().setDaemon(true).setThreadFactory(paramThreadPoolExecutor.getThreadFactory()).build());
  }
}