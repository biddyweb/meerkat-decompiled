package rx.internal.operators;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.observables.ConnectableObservable;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

public final class OnSubscribeRefCount<T>
  implements Observable.OnSubscribe<T>
{
  private volatile CompositeSubscription baseSubscription = new CompositeSubscription();
  private final ReentrantLock lock = new ReentrantLock();
  private final ConnectableObservable<? extends T> source;
  private final AtomicInteger subscriptionCount = new AtomicInteger(0);

  public OnSubscribeRefCount(ConnectableObservable<? extends T> paramConnectableObservable)
  {
    this.source = paramConnectableObservable;
  }

  private Subscription disconnect(final CompositeSubscription paramCompositeSubscription)
  {
    return Subscriptions.create(new Action0()
    {
      public void call()
      {
        OnSubscribeRefCount.this.lock.lock();
        try
        {
          if ((OnSubscribeRefCount.this.baseSubscription == paramCompositeSubscription) && (OnSubscribeRefCount.this.subscriptionCount.decrementAndGet() == 0))
          {
            OnSubscribeRefCount.this.baseSubscription.unsubscribe();
            OnSubscribeRefCount.access$002(OnSubscribeRefCount.this, new CompositeSubscription());
          }
          return;
        }
        finally
        {
          OnSubscribeRefCount.this.lock.unlock();
        }
      }
    });
  }

  private Action1<Subscription> onSubscribe(final Subscriber<? super T> paramSubscriber, final AtomicBoolean paramAtomicBoolean)
  {
    return new Action1()
    {
      public void call(Subscription paramAnonymousSubscription)
      {
        try
        {
          OnSubscribeRefCount.this.baseSubscription.add(paramAnonymousSubscription);
          OnSubscribeRefCount.this.doSubscribe(paramSubscriber, OnSubscribeRefCount.this.baseSubscription);
          return;
        }
        finally
        {
          OnSubscribeRefCount.this.lock.unlock();
          paramAtomicBoolean.set(false);
        }
      }
    };
  }

  public void call(Subscriber<? super T> paramSubscriber)
  {
    this.lock.lock();
    if (this.subscriptionCount.incrementAndGet() == 1)
    {
      AtomicBoolean localAtomicBoolean = new AtomicBoolean(true);
      try
      {
        this.source.connect(onSubscribe(paramSubscriber, localAtomicBoolean));
        return;
      }
      finally
      {
        if (localAtomicBoolean.get())
          this.lock.unlock();
      }
    }
    try
    {
      doSubscribe(paramSubscriber, this.baseSubscription);
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  void doSubscribe(final Subscriber<? super T> paramSubscriber, final CompositeSubscription paramCompositeSubscription)
  {
    paramSubscriber.add(disconnect(paramCompositeSubscription));
    this.source.unsafeSubscribe(new Subscriber(paramSubscriber)
    {
      void cleanup()
      {
        OnSubscribeRefCount.this.lock.lock();
        try
        {
          if (OnSubscribeRefCount.this.baseSubscription == paramCompositeSubscription)
          {
            OnSubscribeRefCount.this.baseSubscription.unsubscribe();
            OnSubscribeRefCount.access$002(OnSubscribeRefCount.this, new CompositeSubscription());
            OnSubscribeRefCount.this.subscriptionCount.set(0);
          }
          return;
        }
        finally
        {
          OnSubscribeRefCount.this.lock.unlock();
        }
      }

      public void onCompleted()
      {
        cleanup();
        paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        cleanup();
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        paramSubscriber.onNext(paramAnonymousT);
      }
    });
  }
}