package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Observable.Operator;
import rx.Observer;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

public final class OperatorWindowWithSize<T>
  implements Observable.Operator<Observable<T>, T>
{
  final int size;
  final int skip;

  public OperatorWindowWithSize(int paramInt1, int paramInt2)
  {
    this.size = paramInt1;
    this.skip = paramInt2;
  }

  public Subscriber<? super T> call(Subscriber<? super Observable<T>> paramSubscriber)
  {
    if (this.skip == this.size)
      return new ExactSubscriber(paramSubscriber);
    return new InexactSubscriber(paramSubscriber);
  }

  static final class CountedSubject<T>
  {
    final Observer<T> consumer;
    int count;
    final Observable<T> producer;

    public CountedSubject(Observer<T> paramObserver, Observable<T> paramObservable)
    {
      this.consumer = paramObserver;
      this.producer = paramObservable;
    }
  }

  final class ExactSubscriber extends Subscriber<T>
  {
    final Subscriber<? super Observable<T>> child;
    int count;
    volatile boolean noWindow = true;
    final Subscription parentSubscription = this;
    BufferUntilSubscriber<T> window;

    public ExactSubscriber()
    {
      Object localObject;
      this.child = localObject;
      localObject.add(Subscriptions.create(new Action0()
      {
        public void call()
        {
          if (OperatorWindowWithSize.ExactSubscriber.this.noWindow)
            OperatorWindowWithSize.ExactSubscriber.this.parentSubscription.unsubscribe();
        }
      }));
    }

    public void onCompleted()
    {
      if (this.window != null)
        this.window.onCompleted();
      this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      if (this.window != null)
        this.window.onError(paramThrowable);
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      if (this.window == null)
      {
        this.noWindow = false;
        this.window = BufferUntilSubscriber.create();
        this.child.onNext(this.window);
      }
      this.window.onNext(paramT);
      int i = 1 + this.count;
      this.count = i;
      if (i % OperatorWindowWithSize.this.size == 0)
      {
        this.window.onCompleted();
        this.window = null;
        this.noWindow = true;
        if (this.child.isUnsubscribed())
          this.parentSubscription.unsubscribe();
      }
    }

    public void onStart()
    {
      request(9223372036854775807L);
    }
  }

  final class InexactSubscriber extends Subscriber<T>
  {
    final Subscriber<? super Observable<T>> child;
    final List<OperatorWindowWithSize.CountedSubject<T>> chunks = new LinkedList();
    int count;
    final Subscription parentSubscription = this;

    public InexactSubscriber()
    {
      Object localObject;
      this.child = localObject;
      localObject.add(Subscriptions.create(new Action0()
      {
        public void call()
        {
          if ((OperatorWindowWithSize.InexactSubscriber.this.chunks == null) || (OperatorWindowWithSize.InexactSubscriber.this.chunks.size() == 0))
            OperatorWindowWithSize.InexactSubscriber.this.parentSubscription.unsubscribe();
        }
      }));
    }

    OperatorWindowWithSize.CountedSubject<T> createCountedSubject()
    {
      BufferUntilSubscriber localBufferUntilSubscriber = BufferUntilSubscriber.create();
      return new OperatorWindowWithSize.CountedSubject(localBufferUntilSubscriber, localBufferUntilSubscriber);
    }

    public void onCompleted()
    {
      ArrayList localArrayList = new ArrayList(this.chunks);
      this.chunks.clear();
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
        ((OperatorWindowWithSize.CountedSubject)localIterator.next()).consumer.onCompleted();
      this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      ArrayList localArrayList = new ArrayList(this.chunks);
      this.chunks.clear();
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
        ((OperatorWindowWithSize.CountedSubject)localIterator.next()).consumer.onError(paramThrowable);
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      int i = this.count;
      this.count = (i + 1);
      if ((i % OperatorWindowWithSize.this.skip == 0) && (!this.child.isUnsubscribed()))
      {
        OperatorWindowWithSize.CountedSubject localCountedSubject2 = createCountedSubject();
        this.chunks.add(localCountedSubject2);
        this.child.onNext(localCountedSubject2.producer);
      }
      Iterator localIterator = this.chunks.iterator();
      while (localIterator.hasNext())
      {
        OperatorWindowWithSize.CountedSubject localCountedSubject1 = (OperatorWindowWithSize.CountedSubject)localIterator.next();
        localCountedSubject1.consumer.onNext(paramT);
        int j = 1 + localCountedSubject1.count;
        localCountedSubject1.count = j;
        if (j == OperatorWindowWithSize.this.size)
        {
          localIterator.remove();
          localCountedSubject1.consumer.onCompleted();
        }
      }
      if ((this.chunks.size() == 0) && (this.child.isUnsubscribed()))
        this.parentSubscription.unsubscribe();
    }

    public void onStart()
    {
      request(9223372036854775807L);
    }
  }
}