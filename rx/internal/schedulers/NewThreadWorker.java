package rx.internal.schedulers;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.functions.Action0;
import rx.internal.util.RxThreadFactory;
import rx.internal.util.SubscriptionList;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;
import rx.plugins.RxJavaSchedulersHook;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

public class NewThreadWorker extends Scheduler.Worker
  implements Subscription
{
  private static final ConcurrentHashMap<ScheduledThreadPoolExecutor, ScheduledThreadPoolExecutor> EXECUTORS = new ConcurrentHashMap();
  private static final String FREQUENCY_KEY = "rx.scheduler.jdk6.purge-frequency-millis";
  private static final AtomicReference<ScheduledExecutorService> PURGE = new AtomicReference();
  private static final boolean PURGE_FORCE = false;
  private static final String PURGE_FORCE_KEY = "rx.scheduler.jdk6.purge-force";
  public static final int PURGE_FREQUENCY = 0;
  private static final String PURGE_THREAD_PREFIX = "RxSchedulerPurge-";
  private final ScheduledExecutorService executor;
  volatile boolean isUnsubscribed;
  private final RxJavaSchedulersHook schedulersHook;

  public NewThreadWorker(ThreadFactory paramThreadFactory)
  {
    ScheduledExecutorService localScheduledExecutorService = Executors.newScheduledThreadPool(1, paramThreadFactory);
    if ((!tryEnableCancelPolicy(localScheduledExecutorService)) && ((localScheduledExecutorService instanceof ScheduledThreadPoolExecutor)))
      registerExecutor((ScheduledThreadPoolExecutor)localScheduledExecutorService);
    this.schedulersHook = RxJavaPlugins.getInstance().getSchedulersHook();
    this.executor = localScheduledExecutorService;
  }

  public static void deregisterExecutor(ScheduledExecutorService paramScheduledExecutorService)
  {
    EXECUTORS.remove(paramScheduledExecutorService);
  }

  static void purgeExecutors()
  {
    while (true)
    {
      Iterator localIterator;
      try
      {
        localIterator = EXECUTORS.keySet().iterator();
        if (localIterator.hasNext())
        {
          ScheduledThreadPoolExecutor localScheduledThreadPoolExecutor = (ScheduledThreadPoolExecutor)localIterator.next();
          if (localScheduledThreadPoolExecutor.isShutdown())
            break label61;
          localScheduledThreadPoolExecutor.purge();
          continue;
        }
      }
      catch (Throwable localThrowable)
      {
        Exceptions.throwIfFatal(localThrowable);
        RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable);
      }
      return;
      label61: localIterator.remove();
    }
  }

  public static void registerExecutor(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    if ((ScheduledExecutorService)PURGE.get() != null);
    while (true)
    {
      EXECUTORS.putIfAbsent(paramScheduledThreadPoolExecutor, paramScheduledThreadPoolExecutor);
      return;
      ScheduledExecutorService localScheduledExecutorService = Executors.newScheduledThreadPool(1, new RxThreadFactory("RxSchedulerPurge-"));
      if (!PURGE.compareAndSet(null, localScheduledExecutorService))
        break;
      localScheduledExecutorService.scheduleAtFixedRate(new Runnable()
      {
        public void run()
        {
          NewThreadWorker.purgeExecutors();
        }
      }
      , PURGE_FREQUENCY, PURGE_FREQUENCY, TimeUnit.MILLISECONDS);
    }
  }

  public static boolean tryEnableCancelPolicy(ScheduledExecutorService paramScheduledExecutorService)
  {
    if (!PURGE_FORCE)
      for (Method localMethod : paramScheduledExecutorService.getClass().getMethods())
        if ((localMethod.getName().equals("setRemoveOnCancelPolicy")) && (localMethod.getParameterTypes().length == 1) && (localMethod.getParameterTypes()[0] == Boolean.TYPE))
          try
          {
            Object[] arrayOfObject = new Object[1];
            arrayOfObject[0] = Boolean.valueOf(true);
            localMethod.invoke(paramScheduledExecutorService, arrayOfObject);
            return true;
          }
          catch (Exception localException)
          {
            RxJavaPlugins.getInstance().getErrorHandler().handleError(localException);
          }
    return false;
  }

  public boolean isUnsubscribed()
  {
    return this.isUnsubscribed;
  }

  public Subscription schedule(Action0 paramAction0)
  {
    return schedule(paramAction0, 0L, null);
  }

  public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
  {
    if (this.isUnsubscribed)
      return Subscriptions.unsubscribed();
    return scheduleActual(paramAction0, paramLong, paramTimeUnit);
  }

  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(this.schedulersHook.onSchedule(paramAction0));
    if (paramLong <= 0L);
    for (Object localObject = this.executor.submit(localScheduledAction); ; localObject = this.executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add((Future)localObject);
      return localScheduledAction;
    }
  }

  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit, SubscriptionList paramSubscriptionList)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(this.schedulersHook.onSchedule(paramAction0), paramSubscriptionList);
    paramSubscriptionList.add(localScheduledAction);
    if (paramLong <= 0L);
    for (Object localObject = this.executor.submit(localScheduledAction); ; localObject = this.executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add((Future)localObject);
      return localScheduledAction;
    }
  }

  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit, CompositeSubscription paramCompositeSubscription)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(this.schedulersHook.onSchedule(paramAction0), paramCompositeSubscription);
    paramCompositeSubscription.add(localScheduledAction);
    if (paramLong <= 0L);
    for (Object localObject = this.executor.submit(localScheduledAction); ; localObject = this.executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add((Future)localObject);
      return localScheduledAction;
    }
  }

  public void unsubscribe()
  {
    this.isUnsubscribed = true;
    this.executor.shutdownNow();
    deregisterExecutor(this.executor);
  }
}