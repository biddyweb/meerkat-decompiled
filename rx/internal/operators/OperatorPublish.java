package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.exceptions.MissingBackpressureException;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.internal.util.RxRingBuffer;
import rx.observables.ConnectableObservable;
import rx.subscriptions.Subscriptions;

public class OperatorPublish<T> extends ConnectableObservable<T>
{
  private final RequestHandler<T> requestHandler;
  final Observable<? extends T> source;

  private OperatorPublish(Observable<? extends T> paramObservable)
  {
    this(paramObservable, new Object(), new RequestHandler(null));
  }

  private OperatorPublish(Observable<? extends T> paramObservable, Object paramObject, RequestHandler<T> paramRequestHandler)
  {
    super(new Observable.OnSubscribe()
    {
      public void call(final Subscriber<? super T> paramAnonymousSubscriber)
      {
        paramAnonymousSubscriber.setProducer(new Producer()
        {
          public void request(long paramAnonymous2Long)
          {
            OperatorPublish.this.requestFromChildSubscriber(paramAnonymousSubscriber, paramAnonymous2Long);
          }
        });
        paramAnonymousSubscriber.add(Subscriptions.create(new Action0()
        {
          public void call()
          {
            OperatorPublish.RequestHandler.access$200(OperatorPublish.this).removeSubscriber(paramAnonymousSubscriber);
          }
        }));
      }
    });
    this.source = paramObservable;
    this.requestHandler = paramRequestHandler;
  }

  public static <T, R> Observable<R> create(Observable<? extends T> paramObservable, final Func1<? super Observable<T>, ? extends Observable<R>> paramFunc1)
  {
    return Observable.create(new Observable.OnSubscribe()
    {
      public void call(final Subscriber<? super R> paramAnonymousSubscriber)
      {
        OperatorPublish localOperatorPublish = new OperatorPublish(this.val$source, null);
        ((Observable)paramFunc1.call(localOperatorPublish)).unsafeSubscribe(paramAnonymousSubscriber);
        localOperatorPublish.connect(new Action1()
        {
          public void call(Subscription paramAnonymous2Subscription)
          {
            paramAnonymousSubscriber.add(paramAnonymous2Subscription);
          }
        });
      }
    });
  }

  public static <T> ConnectableObservable<T> create(Observable<? extends T> paramObservable)
  {
    return new OperatorPublish(paramObservable);
  }

  public void connect(Action1<? super Subscription> paramAction1)
  {
    OriginSubscriber localOriginSubscriber1 = this.requestHandler.state.getOrigin();
    int i = 0;
    if (localOriginSubscriber1 == null)
    {
      i = 1;
      this.requestHandler.state.setOrigin(new OriginSubscriber(this.requestHandler));
    }
    if (i != 0)
    {
      paramAction1.call(Subscriptions.create(new Action0()
      {
        public void call()
        {
          OperatorPublish.OriginSubscriber localOriginSubscriber = OperatorPublish.RequestHandler.access$200(OperatorPublish.this.requestHandler).getOrigin();
          OperatorPublish.RequestHandler.access$200(OperatorPublish.this.requestHandler).setOrigin(null);
          if (localOriginSubscriber != null)
            localOriginSubscriber.unsubscribe();
        }
      }));
      OriginSubscriber localOriginSubscriber2 = this.requestHandler.state.getOrigin();
      if (localOriginSubscriber2 != null)
        this.source.unsafeSubscribe(localOriginSubscriber2);
    }
  }

  private static class OriginSubscriber<T> extends Subscriber<T>
  {
    private final long THRESHOLD = RxRingBuffer.SIZE / 4;
    private final RxRingBuffer buffer = RxRingBuffer.getSpmcInstance();
    private final AtomicLong originOutstanding = new AtomicLong();
    private final OperatorPublish.RequestHandler<T> requestHandler;

    OriginSubscriber(OperatorPublish.RequestHandler<T> paramRequestHandler)
    {
      this.requestHandler = paramRequestHandler;
      add(this.buffer);
    }

    private void requestMore(long paramLong)
    {
      this.originOutstanding.addAndGet(paramLong);
      request(paramLong);
    }

    public void onCompleted()
    {
      try
      {
        this.requestHandler.emit(OperatorPublish.RequestHandler.access$400(this.requestHandler).completed());
        return;
      }
      catch (MissingBackpressureException localMissingBackpressureException)
      {
        onError(localMissingBackpressureException);
      }
    }

    public void onError(Throwable paramThrowable)
    {
      ArrayList localArrayList = null;
      Subscriber[] arrayOfSubscriber = OperatorPublish.RequestHandler.access$200(this.requestHandler).getSubscribers();
      int i = arrayOfSubscriber.length;
      int j = 0;
      while (true)
        if (j < i)
        {
          Subscriber localSubscriber = arrayOfSubscriber[j];
          try
          {
            localSubscriber.onError(paramThrowable);
            j++;
          }
          catch (Throwable localThrowable)
          {
            while (true)
            {
              if (localArrayList == null)
                localArrayList = new ArrayList();
              localArrayList.add(localThrowable);
            }
          }
        }
      Exceptions.throwIfAny(localArrayList);
    }

    public void onNext(T paramT)
    {
      try
      {
        this.requestHandler.emit(OperatorPublish.RequestHandler.access$400(this.requestHandler).next(paramT));
        return;
      }
      catch (MissingBackpressureException localMissingBackpressureException)
      {
        onError(localMissingBackpressureException);
      }
    }

    public void onStart()
    {
      requestMore(RxRingBuffer.SIZE);
    }
  }

  private static class RequestHandler<T>
  {
    static final AtomicLongFieldUpdater<RequestHandler> WIP = AtomicLongFieldUpdater.newUpdater(RequestHandler.class, "wip");
    private final NotificationLite<T> notifier = NotificationLite.instance();
    private final OperatorPublish.State<T> state = new OperatorPublish.State(null);
    volatile long wip;

    private void requestMoreAfterEmission(int paramInt)
    {
      if (paramInt > 0)
      {
        OperatorPublish.OriginSubscriber localOriginSubscriber = this.state.getOrigin();
        if ((localOriginSubscriber != null) && (localOriginSubscriber.originOutstanding.addAndGet(-paramInt) <= localOriginSubscriber.THRESHOLD))
          localOriginSubscriber.requestMore(RxRingBuffer.SIZE - localOriginSubscriber.THRESHOLD);
      }
    }

    public void drainQueue(OperatorPublish.OriginSubscriber<T> paramOriginSubscriber)
    {
      OperatorPublish.State localState;
      Map localMap;
      RxRingBuffer localRxRingBuffer;
      NotificationLite localNotificationLite;
      int i;
      if (WIP.getAndIncrement(this) == 0L)
      {
        localState = this.state;
        localMap = OperatorPublish.State.access$1000(localState);
        localRxRingBuffer = paramOriginSubscriber.buffer;
        localNotificationLite = this.notifier;
        i = 0;
        WIP.set(this, 1L);
      }
      while (true)
        if (localState.hasNoSubscriber())
        {
          if (localRxRingBuffer.poll() != null);
        }
        else
        {
          Object localObject;
          while (WIP.decrementAndGet(this) <= 0L)
          {
            requestMoreAfterEmission(i);
            return;
            if (localState.canEmitWithDecrement())
            {
              localObject = localRxRingBuffer.poll();
              if (localObject != null)
                break label105;
              localState.incrementOutstandingAfterFailedEmit();
            }
          }
          break;
          label105: for (Subscriber localSubscriber : localState.getSubscribers())
          {
            AtomicLong localAtomicLong = (AtomicLong)localMap.get(localSubscriber);
            if (localAtomicLong != null)
            {
              localNotificationLite.accept(localSubscriber, localObject);
              localAtomicLong.decrementAndGet();
            }
          }
          i++;
        }
    }

    public void emit(Object paramObject)
      throws MissingBackpressureException
    {
      OperatorPublish.OriginSubscriber localOriginSubscriber = this.state.getOrigin();
      if (localOriginSubscriber == null)
        return;
      if (this.notifier.isCompleted(paramObject))
        localOriginSubscriber.buffer.onCompleted();
      while (true)
      {
        drainQueue(localOriginSubscriber);
        return;
        localOriginSubscriber.buffer.onNext(this.notifier.getValue(paramObject));
      }
    }

    public void requestFromChildSubscriber(Subscriber<? super T> paramSubscriber, long paramLong)
    {
      this.state.requestFromSubscriber(paramSubscriber, paramLong);
      OperatorPublish.OriginSubscriber localOriginSubscriber = this.state.getOrigin();
      if (localOriginSubscriber != null)
        drainQueue(localOriginSubscriber);
    }
  }

  private static class State<T>
  {
    private OperatorPublish.OriginSubscriber<T> origin;
    private long outstandingRequests = -1L;
    private final Map<Subscriber<? super T>, AtomicLong> ss = new LinkedHashMap();
    private Subscriber<? super T>[] subscribers = new Subscriber[0];

    private long resetAfterSubscriberUpdate(Map<Subscriber<? super T>, AtomicLong> paramMap)
    {
      Subscriber[] arrayOfSubscriber = new Subscriber[paramMap.size()];
      int i = 0;
      long l1 = -1L;
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        int j = i + 1;
        arrayOfSubscriber[i] = ((Subscriber)localEntry.getKey());
        long l2 = ((AtomicLong)localEntry.getValue()).get();
        if ((l1 == -1L) || (l2 < l1))
          l1 = l2;
        i = j;
      }
      this.subscribers = arrayOfSubscriber;
      this.outstandingRequests = l1;
      return l1;
    }

    public boolean canEmitWithDecrement()
    {
      try
      {
        if (this.outstandingRequests > 0L)
        {
          this.outstandingRequests -= 1L;
          bool = true;
          return bool;
        }
        boolean bool = false;
      }
      finally
      {
      }
    }

    public OperatorPublish.OriginSubscriber<T> getOrigin()
    {
      try
      {
        OperatorPublish.OriginSubscriber localOriginSubscriber = this.origin;
        return localOriginSubscriber;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public Subscriber<? super T>[] getSubscribers()
    {
      try
      {
        Subscriber[] arrayOfSubscriber = this.subscribers;
        return arrayOfSubscriber;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public boolean hasNoSubscriber()
    {
      try
      {
        int i = this.subscribers.length;
        if (i == 0)
        {
          bool = true;
          return bool;
        }
        boolean bool = false;
      }
      finally
      {
      }
    }

    public void incrementOutstandingAfterFailedEmit()
    {
      try
      {
        this.outstandingRequests = (1L + this.outstandingRequests);
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public void removeSubscriber(Subscriber<? super T> paramSubscriber)
    {
      try
      {
        Map localMap = this.ss;
        localMap.remove(paramSubscriber);
        resetAfterSubscriberUpdate(localMap);
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public long requestFromSubscriber(Subscriber<? super T> paramSubscriber, long paramLong)
    {
      try
      {
        Map localMap = this.ss;
        AtomicLong localAtomicLong = (AtomicLong)localMap.get(paramSubscriber);
        if (localAtomicLong == null)
          localMap.put(paramSubscriber, new AtomicLong(paramLong));
        while (true)
        {
          long l1 = resetAfterSubscriberUpdate(localMap);
          return l1;
          boolean bool;
          do
          {
            long l2 = localAtomicLong.get();
            if (l2 == 9223372036854775807L)
              break;
            long l3 = l2 + paramLong;
            if (l3 < 0L)
              l3 = 9223372036854775807L;
            bool = localAtomicLong.compareAndSet(l2, l3);
          }
          while (!bool);
        }
      }
      finally
      {
      }
    }

    public void setOrigin(OperatorPublish.OriginSubscriber<T> paramOriginSubscriber)
    {
      try
      {
        this.origin = paramOriginSubscriber;
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
}