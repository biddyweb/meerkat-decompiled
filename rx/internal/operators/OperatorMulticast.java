package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func0;
import rx.observables.ConnectableObservable;
import rx.subjects.Subject;
import rx.subscriptions.Subscriptions;

public final class OperatorMulticast<T, R> extends ConnectableObservable<R>
{
  final AtomicReference<Subject<? super T, ? extends R>> connectedSubject;
  final Object guard;
  private Subscription guardedSubscription;
  final Observable<? extends T> source;
  final Func0<? extends Subject<? super T, ? extends R>> subjectFactory;
  private Subscriber<T> subscription;
  final List<Subscriber<? super R>> waitingForConnect;

  private OperatorMulticast(Object paramObject, final AtomicReference<Subject<? super T, ? extends R>> paramAtomicReference, final List<Subscriber<? super R>> paramList, Observable<? extends T> paramObservable, Func0<? extends Subject<? super T, ? extends R>> paramFunc0)
  {
    super(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super R> paramAnonymousSubscriber)
      {
        synchronized (OperatorMulticast.this)
        {
          if (paramAtomicReference.get() == null)
          {
            paramList.add(paramAnonymousSubscriber);
            return;
          }
          ((Subject)paramAtomicReference.get()).unsafeSubscribe(paramAnonymousSubscriber);
        }
      }
    });
    this.guard = paramObject;
    this.connectedSubject = paramAtomicReference;
    this.waitingForConnect = paramList;
    this.source = paramObservable;
    this.subjectFactory = paramFunc0;
  }

  public OperatorMulticast(Observable<? extends T> paramObservable, Func0<? extends Subject<? super T, ? extends R>> paramFunc0)
  {
    this(new Object(), new AtomicReference(), new ArrayList(), paramObservable, paramFunc0);
  }

  public void connect(Action1<? super Subscription> paramAction1)
  {
    final Subject localSubject;
    synchronized (this.guard)
    {
      if (this.subscription != null)
      {
        paramAction1.call(this.guardedSubscription);
        return;
      }
      localSubject = (Subject)this.subjectFactory.call();
      this.subscription = new Subscriber()
      {
        public void onCompleted()
        {
          localSubject.onCompleted();
        }

        public void onError(Throwable paramAnonymousThrowable)
        {
          localSubject.onError(paramAnonymousThrowable);
        }

        public void onNext(T paramAnonymousT)
        {
          localSubject.onNext(paramAnonymousT);
        }
      };
      final AtomicReference localAtomicReference = new AtomicReference();
      localAtomicReference.set(Subscriptions.create(new Action0()
      {
        public void call()
        {
          synchronized (OperatorMulticast.this.guard)
          {
            if (OperatorMulticast.this.guardedSubscription == localAtomicReference.get())
            {
              Subscriber localSubscriber = OperatorMulticast.this.subscription;
              OperatorMulticast.access$102(OperatorMulticast.this, null);
              OperatorMulticast.access$002(OperatorMulticast.this, null);
              OperatorMulticast.this.connectedSubject.set(null);
              if (localSubscriber != null)
                localSubscriber.unsubscribe();
              return;
            }
            return;
          }
        }
      }));
      this.guardedSubscription = ((Subscription)localAtomicReference.get());
      Iterator localIterator = this.waitingForConnect.iterator();
      if (localIterator.hasNext())
        localSubject.unsafeSubscribe((Subscriber)localIterator.next());
    }
    this.waitingForConnect.clear();
    this.connectedSubject.set(localSubject);
    paramAction1.call(this.guardedSubscription);
    synchronized (this.guard)
    {
      Subscriber localSubscriber = this.subscription;
      if (localSubscriber != null)
      {
        this.source.subscribe(localSubscriber);
        return;
      }
    }
  }
}