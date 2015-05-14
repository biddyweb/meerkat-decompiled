package rx.internal.operators;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import rx.Notification;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Observable.Operator;
import rx.Producer;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;
import rx.functions.Func1;
import rx.functions.Func2;
import rx.schedulers.Schedulers;
import rx.subjects.PublishSubject;
import rx.subscriptions.SerialSubscription;

public final class OnSubscribeRedo<T>
  implements Observable.OnSubscribe<T>
{
  static final Func1<Observable<? extends Notification<?>>, Observable<?>> REDO_INIFINITE = new Func1()
  {
    public Observable<?> call(Observable<? extends Notification<?>> paramAnonymousObservable)
    {
      return paramAnonymousObservable.map(new Func1()
      {
        public Notification<?> call(Notification<?> paramAnonymous2Notification)
        {
          return Notification.createOnNext(null);
        }
      });
    }
  };
  private final Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> controlHandlerFunction;
  private final Scheduler scheduler;
  private Observable<T> source;
  private boolean stopOnComplete;
  private boolean stopOnError;

  private OnSubscribeRedo(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1, boolean paramBoolean1, boolean paramBoolean2, Scheduler paramScheduler)
  {
    this.source = paramObservable;
    this.controlHandlerFunction = paramFunc1;
    this.stopOnComplete = paramBoolean1;
    this.stopOnError = paramBoolean2;
    this.scheduler = paramScheduler;
  }

  public static <T> Observable<T> redo(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1, Scheduler paramScheduler)
  {
    return Observable.create(new OnSubscribeRedo(paramObservable, paramFunc1, false, false, paramScheduler));
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable)
  {
    return repeat(paramObservable, Schedulers.trampoline());
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable, long paramLong)
  {
    return repeat(paramObservable, paramLong, Schedulers.trampoline());
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable, long paramLong, Scheduler paramScheduler)
  {
    if (paramLong == 0L)
      return Observable.empty();
    if (paramLong < 0L)
      throw new IllegalArgumentException("count >= 0 expected");
    return repeat(paramObservable, new RedoFinite(paramLong - 1L), paramScheduler);
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable, Scheduler paramScheduler)
  {
    return repeat(paramObservable, REDO_INIFINITE, paramScheduler);
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1)
  {
    return Observable.create(new OnSubscribeRedo(paramObservable, paramFunc1, false, true, Schedulers.trampoline()));
  }

  public static <T> Observable<T> repeat(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1, Scheduler paramScheduler)
  {
    return Observable.create(new OnSubscribeRedo(paramObservable, paramFunc1, false, true, paramScheduler));
  }

  public static <T> Observable<T> retry(Observable<T> paramObservable)
  {
    return retry(paramObservable, REDO_INIFINITE);
  }

  public static <T> Observable<T> retry(Observable<T> paramObservable, long paramLong)
  {
    if (paramLong < 0L)
      throw new IllegalArgumentException("count >= 0 expected");
    if (paramLong == 0L)
      return paramObservable;
    return retry(paramObservable, new RedoFinite(paramLong));
  }

  public static <T> Observable<T> retry(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1)
  {
    return Observable.create(new OnSubscribeRedo(paramObservable, paramFunc1, true, false, Schedulers.trampoline()));
  }

  public static <T> Observable<T> retry(Observable<T> paramObservable, Func1<? super Observable<? extends Notification<?>>, ? extends Observable<?>> paramFunc1, Scheduler paramScheduler)
  {
    return Observable.create(new OnSubscribeRedo(paramObservable, paramFunc1, true, false, paramScheduler));
  }

  public void call(final Subscriber<? super T> paramSubscriber)
  {
    final AtomicBoolean localAtomicBoolean1 = new AtomicBoolean(true);
    final AtomicBoolean localAtomicBoolean2 = new AtomicBoolean(true);
    final AtomicLong localAtomicLong = new AtomicLong(0L);
    final AtomicReference localAtomicReference = new AtomicReference();
    final Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    final SerialSubscription localSerialSubscription = new SerialSubscription();
    paramSubscriber.add(localSerialSubscription);
    final PublishSubject localPublishSubject = PublishSubject.create();
    final Action0 local2 = new Action0()
    {
      public void call()
      {
        if (paramSubscriber.isUnsubscribed())
          return;
        Subscriber local1 = new Subscriber()
        {
          public void onCompleted()
          {
            unsubscribe();
            OnSubscribeRedo.2.this.val$terminals.onNext(Notification.createOnCompleted());
          }

          public void onError(Throwable paramAnonymous2Throwable)
          {
            unsubscribe();
            OnSubscribeRedo.2.this.val$terminals.onNext(Notification.createOnError(paramAnonymous2Throwable));
          }

          public void onNext(T paramAnonymous2T)
          {
            if (OnSubscribeRedo.2.this.val$consumerCapacity.get() != 9223372036854775807L)
              OnSubscribeRedo.2.this.val$consumerCapacity.decrementAndGet();
            OnSubscribeRedo.2.this.val$child.onNext(paramAnonymous2T);
          }

          public void setProducer(Producer paramAnonymous2Producer)
          {
            OnSubscribeRedo.2.this.val$currentProducer.set(paramAnonymous2Producer);
            long l = OnSubscribeRedo.2.this.val$consumerCapacity.get();
            if (l > 0L)
              paramAnonymous2Producer.request(l);
          }
        };
        localSerialSubscription.set(local1);
        OnSubscribeRedo.this.source.unsafeSubscribe(local1);
      }
    };
    localWorker.schedule(new Action0()
    {
      public void call()
      {
        this.val$restarts.unsafeSubscribe(new Subscriber(paramSubscriber)
        {
          public void onCompleted()
          {
            OnSubscribeRedo.4.this.val$child.onCompleted();
          }

          public void onError(Throwable paramAnonymous2Throwable)
          {
            OnSubscribeRedo.4.this.val$child.onError(paramAnonymous2Throwable);
          }

          public void onNext(Object paramAnonymous2Object)
          {
            if ((!OnSubscribeRedo.4.this.val$isLocked.get()) && (!OnSubscribeRedo.4.this.val$child.isUnsubscribed()))
            {
              if (OnSubscribeRedo.4.this.val$consumerCapacity.get() > 0L)
                OnSubscribeRedo.4.this.val$worker.schedule(OnSubscribeRedo.4.this.val$subscribeToSource);
            }
            else
              return;
            OnSubscribeRedo.4.this.val$resumeBoundary.compareAndSet(false, true);
          }

          public void setProducer(Producer paramAnonymous2Producer)
          {
            paramAnonymous2Producer.request(9223372036854775807L);
          }
        });
      }
    });
    paramSubscriber.setProducer(new Producer()
    {
      public void request(long paramAnonymousLong)
      {
        long l = BackpressureUtils.getAndAddRequest(localAtomicLong, paramAnonymousLong);
        Producer localProducer = (Producer)localAtomicReference.get();
        if (localProducer != null)
          localProducer.request(paramAnonymousLong);
        while ((l != 0L) || (!localAtomicBoolean2.compareAndSet(true, false)))
          return;
        localWorker.schedule(local2);
      }
    });
  }

  public static final class RedoFinite
    implements Func1<Observable<? extends Notification<?>>, Observable<?>>
  {
    private final long count;

    public RedoFinite(long paramLong)
    {
      this.count = paramLong;
    }

    public Observable<?> call(Observable<? extends Notification<?>> paramObservable)
    {
      return paramObservable.map(new Func1()
      {
        int num = 0;

        public Notification<?> call(Notification<?> paramAnonymousNotification)
        {
          if (OnSubscribeRedo.RedoFinite.this.count == 0L);
          do
          {
            return paramAnonymousNotification;
            this.num = (1 + this.num);
          }
          while (this.num > OnSubscribeRedo.RedoFinite.this.count);
          return Notification.createOnNext(Integer.valueOf(this.num));
        }
      }).dematerialize();
    }
  }

  public static final class RetryWithPredicate
    implements Func1<Observable<? extends Notification<?>>, Observable<? extends Notification<?>>>
  {
    private Func2<Integer, Throwable, Boolean> predicate;

    public RetryWithPredicate(Func2<Integer, Throwable, Boolean> paramFunc2)
    {
      this.predicate = paramFunc2;
    }

    public Observable<? extends Notification<?>> call(Observable<? extends Notification<?>> paramObservable)
    {
      return paramObservable.scan(Notification.createOnNext(Integer.valueOf(0)), new Func2()
      {
        public Notification<Integer> call(Notification<Integer> paramAnonymousNotification, Notification<?> paramAnonymousNotification1)
        {
          int i = ((Integer)paramAnonymousNotification.getValue()).intValue();
          if (((Boolean)OnSubscribeRedo.RetryWithPredicate.this.predicate.call(Integer.valueOf(i), paramAnonymousNotification1.getThrowable())).booleanValue())
            paramAnonymousNotification1 = Notification.createOnNext(Integer.valueOf(i + 1));
          return paramAnonymousNotification1;
        }
      });
    }
  }
}