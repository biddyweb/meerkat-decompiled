package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Observable.Operator;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Func1;
import rx.observers.SerializedObserver;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;

public final class OperatorWindowWithStartEndObservable<T, U, V>
  implements Observable.Operator<Observable<T>, T>
{
  final Func1<? super U, ? extends Observable<? extends V>> windowClosingSelector;
  final Observable<? extends U> windowOpenings;

  public OperatorWindowWithStartEndObservable(Observable<? extends U> paramObservable, Func1<? super U, ? extends Observable<? extends V>> paramFunc1)
  {
    this.windowOpenings = paramObservable;
    this.windowClosingSelector = paramFunc1;
  }

  public Subscriber<? super T> call(Subscriber<? super Observable<T>> paramSubscriber)
  {
    final SourceSubscriber localSourceSubscriber = new SourceSubscriber(paramSubscriber);
    Subscriber local1 = new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        localSourceSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localSourceSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(U paramAnonymousU)
      {
        localSourceSubscriber.beginWindow(paramAnonymousU);
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
    this.windowOpenings.unsafeSubscribe(local1);
    return localSourceSubscriber;
  }

  static final class SerializedSubject<T>
  {
    final Observer<T> consumer;
    final Observable<T> producer;

    public SerializedSubject(Observer<T> paramObserver, Observable<T> paramObservable)
    {
      this.consumer = new SerializedObserver(paramObserver);
      this.producer = paramObservable;
    }
  }

  final class SourceSubscriber extends Subscriber<T>
  {
    final Subscriber<? super Observable<T>> child;
    final List<OperatorWindowWithStartEndObservable.SerializedSubject<T>> chunks;
    final CompositeSubscription csub;
    boolean done;
    final Object guard;

    public SourceSubscriber()
    {
      super();
      this.child = new SerializedSubscriber(localSubscriber);
      this.guard = new Object();
      this.chunks = new LinkedList();
      this.csub = new CompositeSubscription();
      localSubscriber.add(this.csub);
    }

    void beginWindow(U paramU)
    {
      final OperatorWindowWithStartEndObservable.SerializedSubject localSerializedSubject = createSerializedSubject();
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.chunks.add(localSerializedSubject);
        this.child.onNext(localSerializedSubject.producer);
      }
      try
      {
        Observable localObservable = (Observable)OperatorWindowWithStartEndObservable.this.windowClosingSelector.call(paramU);
        Subscriber local1 = new Subscriber()
        {
          boolean once = true;

          public void onCompleted()
          {
            if (this.once)
            {
              this.once = false;
              OperatorWindowWithStartEndObservable.SourceSubscriber.this.endWindow(localSerializedSubject);
              OperatorWindowWithStartEndObservable.SourceSubscriber.this.csub.remove(this);
            }
          }

          public void onError(Throwable paramAnonymousThrowable)
          {
          }

          public void onNext(V paramAnonymousV)
          {
            onCompleted();
          }
        };
        this.csub.add(local1);
        localObservable.unsafeSubscribe(local1);
        return;
        localObject2 = finally;
        throw localObject2;
      }
      catch (Throwable localThrowable)
      {
        onError(localThrowable);
      }
    }

    OperatorWindowWithStartEndObservable.SerializedSubject<T> createSerializedSubject()
    {
      BufferUntilSubscriber localBufferUntilSubscriber = BufferUntilSubscriber.create();
      return new OperatorWindowWithStartEndObservable.SerializedSubject(localBufferUntilSubscriber, localBufferUntilSubscriber);
    }

    void endWindow(OperatorWindowWithStartEndObservable.SerializedSubject<T> paramSerializedSubject)
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        Iterator localIterator = this.chunks.iterator();
        do
        {
          boolean bool = localIterator.hasNext();
          i = 0;
          if (!bool)
            break;
        }
        while ((OperatorWindowWithStartEndObservable.SerializedSubject)localIterator.next() != paramSerializedSubject);
        int i = 1;
        localIterator.remove();
        if (i != 0)
        {
          paramSerializedSubject.consumer.onCompleted();
          return;
        }
      }
    }

    public void onCompleted()
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.done = true;
        ArrayList localArrayList = new ArrayList(this.chunks);
        this.chunks.clear();
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((OperatorWindowWithStartEndObservable.SerializedSubject)localIterator.next()).consumer.onCompleted();
      }
      this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.done = true;
        ArrayList localArrayList = new ArrayList(this.chunks);
        this.chunks.clear();
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((OperatorWindowWithStartEndObservable.SerializedSubject)localIterator.next()).consumer.onError(paramThrowable);
      }
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        ArrayList localArrayList = new ArrayList(this.chunks);
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((OperatorWindowWithStartEndObservable.SerializedSubject)localIterator.next()).consumer.onNext(paramT);
      }
    }

    public void onStart()
    {
      request(9223372036854775807L);
    }
  }
}