package rx.schedulers;

import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.NewThreadWorker;
import rx.internal.schedulers.ScheduledAction;
import rx.internal.util.RxThreadFactory;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

final class CachedThreadScheduler extends Scheduler
{
  private static final RxThreadFactory EVICTOR_THREAD_FACTORY = new RxThreadFactory("RxCachedWorkerPoolEvictor-");
  private static final String EVICTOR_THREAD_NAME_PREFIX = "RxCachedWorkerPoolEvictor-";
  private static final RxThreadFactory WORKER_THREAD_FACTORY = new RxThreadFactory("RxCachedThreadScheduler-");
  private static final String WORKER_THREAD_NAME_PREFIX = "RxCachedThreadScheduler-";

  public Scheduler.Worker createWorker()
  {
    return new EventLoopWorker(CachedWorkerPool.INSTANCE.get());
  }

  private static final class CachedWorkerPool
  {
    private static CachedWorkerPool INSTANCE = new CachedWorkerPool(60L, TimeUnit.SECONDS);
    private final ScheduledExecutorService evictExpiredWorkerExecutor;
    private final ConcurrentLinkedQueue<CachedThreadScheduler.ThreadWorker> expiringWorkerQueue;
    private final long keepAliveTime;

    CachedWorkerPool(long paramLong, TimeUnit paramTimeUnit)
    {
      this.keepAliveTime = paramTimeUnit.toNanos(paramLong);
      this.expiringWorkerQueue = new ConcurrentLinkedQueue();
      this.evictExpiredWorkerExecutor = Executors.newScheduledThreadPool(1, CachedThreadScheduler.EVICTOR_THREAD_FACTORY);
      this.evictExpiredWorkerExecutor.scheduleWithFixedDelay(new Runnable()
      {
        public void run()
        {
          CachedThreadScheduler.CachedWorkerPool.this.evictExpiredWorkers();
        }
      }
      , this.keepAliveTime, this.keepAliveTime, TimeUnit.NANOSECONDS);
    }

    void evictExpiredWorkers()
    {
      if (!this.expiringWorkerQueue.isEmpty())
      {
        long l = now();
        Iterator localIterator = this.expiringWorkerQueue.iterator();
        while (localIterator.hasNext())
        {
          CachedThreadScheduler.ThreadWorker localThreadWorker = (CachedThreadScheduler.ThreadWorker)localIterator.next();
          if (localThreadWorker.getExpirationTime() > l)
            break;
          if (this.expiringWorkerQueue.remove(localThreadWorker))
            localThreadWorker.unsubscribe();
        }
      }
    }

    CachedThreadScheduler.ThreadWorker get()
    {
      while (!this.expiringWorkerQueue.isEmpty())
      {
        CachedThreadScheduler.ThreadWorker localThreadWorker = (CachedThreadScheduler.ThreadWorker)this.expiringWorkerQueue.poll();
        if (localThreadWorker != null)
          return localThreadWorker;
      }
      return new CachedThreadScheduler.ThreadWorker(CachedThreadScheduler.WORKER_THREAD_FACTORY);
    }

    long now()
    {
      return System.nanoTime();
    }

    void release(CachedThreadScheduler.ThreadWorker paramThreadWorker)
    {
      paramThreadWorker.setExpirationTime(now() + this.keepAliveTime);
      this.expiringWorkerQueue.offer(paramThreadWorker);
    }
  }

  private static final class EventLoopWorker extends Scheduler.Worker
  {
    static final AtomicIntegerFieldUpdater<EventLoopWorker> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(EventLoopWorker.class, "once");
    private final CompositeSubscription innerSubscription = new CompositeSubscription();
    volatile int once;
    private final CachedThreadScheduler.ThreadWorker threadWorker;

    EventLoopWorker(CachedThreadScheduler.ThreadWorker paramThreadWorker)
    {
      this.threadWorker = paramThreadWorker;
    }

    public boolean isUnsubscribed()
    {
      return this.innerSubscription.isUnsubscribed();
    }

    public Subscription schedule(Action0 paramAction0)
    {
      return schedule(paramAction0, 0L, null);
    }

    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      if (this.innerSubscription.isUnsubscribed())
        return Subscriptions.unsubscribed();
      ScheduledAction localScheduledAction = this.threadWorker.scheduleActual(paramAction0, paramLong, paramTimeUnit);
      this.innerSubscription.add(localScheduledAction);
      localScheduledAction.addParent(this.innerSubscription);
      return localScheduledAction;
    }

    public void unsubscribe()
    {
      if (ONCE_UPDATER.compareAndSet(this, 0, 1))
        CachedThreadScheduler.CachedWorkerPool.INSTANCE.release(this.threadWorker);
      this.innerSubscription.unsubscribe();
    }
  }

  private static final class ThreadWorker extends NewThreadWorker
  {
    private long expirationTime = 0L;

    ThreadWorker(ThreadFactory paramThreadFactory)
    {
      super();
    }

    public long getExpirationTime()
    {
      return this.expirationTime;
    }

    public void setExpirationTime(long paramLong)
    {
      this.expirationTime = paramLong;
    }
  }
}