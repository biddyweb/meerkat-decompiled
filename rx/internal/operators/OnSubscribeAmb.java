package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReference;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

public final class OnSubscribeAmb<T>
  implements Observable.OnSubscribe<T>
{
  private final Selection<T> selection = new Selection(null);
  private final Iterable<? extends Observable<? extends T>> sources;

  private OnSubscribeAmb(Iterable<? extends Observable<? extends T>> paramIterable)
  {
    this.sources = paramIterable;
  }

  public static <T> Observable.OnSubscribe<T> amb(Iterable<? extends Observable<? extends T>> paramIterable)
  {
    return new OnSubscribeAmb(paramIterable);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4, Observable<? extends T> paramObservable5)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    localArrayList.add(paramObservable5);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4, Observable<? extends T> paramObservable5, Observable<? extends T> paramObservable6)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    localArrayList.add(paramObservable5);
    localArrayList.add(paramObservable6);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4, Observable<? extends T> paramObservable5, Observable<? extends T> paramObservable6, Observable<? extends T> paramObservable7)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    localArrayList.add(paramObservable5);
    localArrayList.add(paramObservable6);
    localArrayList.add(paramObservable7);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4, Observable<? extends T> paramObservable5, Observable<? extends T> paramObservable6, Observable<? extends T> paramObservable7, Observable<? extends T> paramObservable8)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    localArrayList.add(paramObservable5);
    localArrayList.add(paramObservable6);
    localArrayList.add(paramObservable7);
    localArrayList.add(paramObservable8);
    return amb(localArrayList);
  }

  public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2, Observable<? extends T> paramObservable3, Observable<? extends T> paramObservable4, Observable<? extends T> paramObservable5, Observable<? extends T> paramObservable6, Observable<? extends T> paramObservable7, Observable<? extends T> paramObservable8, Observable<? extends T> paramObservable9)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramObservable1);
    localArrayList.add(paramObservable2);
    localArrayList.add(paramObservable3);
    localArrayList.add(paramObservable4);
    localArrayList.add(paramObservable5);
    localArrayList.add(paramObservable6);
    localArrayList.add(paramObservable7);
    localArrayList.add(paramObservable8);
    localArrayList.add(paramObservable9);
    return amb(localArrayList);
  }

  public void call(final Subscriber<? super T> paramSubscriber)
  {
    paramSubscriber.add(Subscriptions.create(new Action0()
    {
      public void call()
      {
        if (OnSubscribeAmb.this.selection.choice.get() != null)
          ((OnSubscribeAmb.AmbSubscriber)OnSubscribeAmb.this.selection.choice.get()).unsubscribe();
        if (!OnSubscribeAmb.this.selection.ambSubscribers.isEmpty())
        {
          Iterator localIterator = OnSubscribeAmb.this.selection.ambSubscribers.iterator();
          while (localIterator.hasNext())
            ((OnSubscribeAmb.AmbSubscriber)localIterator.next()).unsubscribe();
          OnSubscribeAmb.this.selection.ambSubscribers.clear();
        }
      }
    }));
    paramSubscriber.setProducer(new Producer()
    {
      public void request(long paramAnonymousLong)
      {
        if (OnSubscribeAmb.this.selection.choice.get() != null)
          OnSubscribeAmb.AmbSubscriber.access$200((OnSubscribeAmb.AmbSubscriber)OnSubscribeAmb.this.selection.choice.get(), paramAnonymousLong);
        label172: 
        while (true)
        {
          return;
          Iterator localIterator = OnSubscribeAmb.this.sources.iterator();
          while (true)
          {
            if (!localIterator.hasNext())
              break label172;
            Observable localObservable = (Observable)localIterator.next();
            if (paramSubscriber.isUnsubscribed())
              break;
            OnSubscribeAmb.AmbSubscriber localAmbSubscriber = new OnSubscribeAmb.AmbSubscriber(paramAnonymousLong, paramSubscriber, OnSubscribeAmb.this.selection, null);
            OnSubscribeAmb.this.selection.ambSubscribers.add(localAmbSubscriber);
            if (OnSubscribeAmb.this.selection.choice.get() != null)
            {
              OnSubscribeAmb.this.selection.unsubscribeOthers((OnSubscribeAmb.AmbSubscriber)OnSubscribeAmb.this.selection.choice.get());
              return;
            }
            localObservable.unsafeSubscribe(localAmbSubscriber);
          }
        }
      }
    });
  }

  private static final class AmbSubscriber<T> extends Subscriber<T>
  {
    private final OnSubscribeAmb.Selection<T> selection;
    private final Subscriber<? super T> subscriber;

    private AmbSubscriber(long paramLong, Subscriber<? super T> paramSubscriber, OnSubscribeAmb.Selection<T> paramSelection)
    {
      this.subscriber = paramSubscriber;
      this.selection = paramSelection;
      request(paramLong);
    }

    private boolean isSelected()
    {
      if (this.selection.choice.get() == this)
        return true;
      if (this.selection.choice.compareAndSet(null, this))
      {
        this.selection.unsubscribeOthers(this);
        return true;
      }
      this.selection.unsubscribeLosers();
      return false;
    }

    private final void requestMore(long paramLong)
    {
      request(paramLong);
    }

    public void onCompleted()
    {
      if (!isSelected())
        return;
      this.subscriber.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      if (!isSelected())
        return;
      this.subscriber.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      if (!isSelected())
        return;
      this.subscriber.onNext(paramT);
    }
  }

  private static class Selection<T>
  {
    final Collection<OnSubscribeAmb.AmbSubscriber<T>> ambSubscribers = new ConcurrentLinkedQueue();
    final AtomicReference<OnSubscribeAmb.AmbSubscriber<T>> choice = new AtomicReference();

    public void unsubscribeLosers()
    {
      OnSubscribeAmb.AmbSubscriber localAmbSubscriber = (OnSubscribeAmb.AmbSubscriber)this.choice.get();
      if (localAmbSubscriber != null)
        unsubscribeOthers(localAmbSubscriber);
    }

    public void unsubscribeOthers(OnSubscribeAmb.AmbSubscriber<T> paramAmbSubscriber)
    {
      Iterator localIterator = this.ambSubscribers.iterator();
      while (localIterator.hasNext())
      {
        OnSubscribeAmb.AmbSubscriber localAmbSubscriber = (OnSubscribeAmb.AmbSubscriber)localIterator.next();
        if (localAmbSubscriber != paramAmbSubscriber)
          localAmbSubscriber.unsubscribe();
      }
      this.ambSubscribers.clear();
    }
  }
}