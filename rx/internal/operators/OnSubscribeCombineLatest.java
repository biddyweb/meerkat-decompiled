package rx.internal.operators;

import java.util.BitSet;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;
import rx.functions.FuncN;
import rx.internal.util.RxRingBuffer;

public final class OnSubscribeCombineLatest<T, R>
  implements Observable.OnSubscribe<R>
{
  final FuncN<? extends R> combinator;
  final List<? extends Observable<? extends T>> sources;

  public OnSubscribeCombineLatest(List<? extends Observable<? extends T>> paramList, FuncN<? extends R> paramFuncN)
  {
    this.sources = paramList;
    this.combinator = paramFuncN;
    if (paramList.size() > 128)
      throw new IllegalArgumentException("More than 128 sources to combineLatest is not supported.");
  }

  public void call(Subscriber<? super R> paramSubscriber)
  {
    if (this.sources.isEmpty())
    {
      paramSubscriber.onCompleted();
      return;
    }
    if (this.sources.size() == 1)
    {
      paramSubscriber.setProducer(new SingleSourceProducer(paramSubscriber, (Observable)this.sources.get(0), this.combinator));
      return;
    }
    paramSubscriber.setProducer(new MultiSourceProducer(paramSubscriber, this.sources, this.combinator));
  }

  static final class MultiSourceProducer<T, R>
    implements Producer
  {
    private static final AtomicLongFieldUpdater<MultiSourceProducer> WIP = AtomicLongFieldUpdater.newUpdater(MultiSourceProducer.class, "counter");
    private final RxRingBuffer buffer = RxRingBuffer.getSpmcInstance();
    private final Subscriber<? super R> child;
    private final Object[] collectedValues;
    private final FuncN<? extends R> combinator;
    private final BitSet completion;
    private volatile int completionCount;
    private volatile long counter;
    private final BitSet haveValues;
    private volatile int haveValuesCount;
    private final AtomicLong requested = new AtomicLong();
    private final List<? extends Observable<? extends T>> sources;
    private final AtomicBoolean started = new AtomicBoolean();
    private final OnSubscribeCombineLatest.MultiSourceRequestableSubscriber<T, R>[] subscribers;

    public MultiSourceProducer(Subscriber<? super R> paramSubscriber, List<? extends Observable<? extends T>> paramList, FuncN<? extends R> paramFuncN)
    {
      this.sources = paramList;
      this.child = paramSubscriber;
      this.combinator = paramFuncN;
      int i = paramList.size();
      this.subscribers = new OnSubscribeCombineLatest.MultiSourceRequestableSubscriber[i];
      this.collectedValues = new Object[i];
      this.haveValues = new BitSet(i);
      this.completion = new BitSet(i);
    }

    public void onCompleted(int paramInt, boolean paramBoolean)
    {
      if (!paramBoolean)
        this.child.onCompleted();
      while (true)
      {
        return;
        try
        {
          boolean bool = this.completion.get(paramInt);
          int i = 0;
          if (!bool)
          {
            this.completion.set(paramInt);
            this.completionCount = (1 + this.completionCount);
            if (this.completionCount != this.collectedValues.length)
              break label84;
          }
          label84: for (i = 1; ; i = 0)
          {
            if (i == 0)
              break;
            this.buffer.onCompleted();
            tick();
            return;
          }
        }
        finally
        {
        }
      }
    }

    public void onError(Throwable paramThrowable)
    {
      this.child.onError(paramThrowable);
    }

    // ERROR //
    public boolean onNext(int paramInt, T paramT)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 96\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:haveValues\011Ljava/util/BitSet;
      //   6: iload_1
      //   7: invokevirtual 108\011java/util/BitSet:get\011(I)Z
      //   10: ifne +21 -> 31
      //   13: aload_0
      //   14: getfield 96\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:haveValues\011Ljava/util/BitSet;
      //   17: iload_1
      //   18: invokevirtual 111\011java/util/BitSet:set\011(I)V
      //   21: aload_0
      //   22: iconst_1
      //   23: aload_0
      //   24: getfield 129\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:haveValuesCount\011I
      //   27: iadd
      //   28: putfield 129\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:haveValuesCount\011I
      //   31: aload_0
      //   32: getfield 89\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:collectedValues\011[Ljava/lang/Object;
      //   35: iload_1
      //   36: aload_2
      //   37: aastore
      //   38: aload_0
      //   39: getfield 129\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:haveValuesCount\011I
      //   42: aload_0
      //   43: getfield 89\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:collectedValues\011[Ljava/lang/Object;
      //   46: arraylength
      //   47: if_icmpeq +7 -> 54
      //   50: aload_0
      //   51: monitorexit
      //   52: iconst_0
      //   53: ireturn
      //   54: aload_0
      //   55: getfield 71\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:buffer\011Lrx/internal/util/RxRingBuffer;
      //   58: aload_0
      //   59: getfield 77\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:combinator\011Lrx/functions/FuncN;
      //   62: aload_0
      //   63: getfield 89\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:collectedValues\011[Ljava/lang/Object;
      //   66: invokeinterface 135 2 0
      //   71: invokevirtual 138\011rx/internal/util/RxRingBuffer:onNext\011(Ljava/lang/Object;)V
      //   74: aload_0
      //   75: monitorexit
      //   76: aload_0
      //   77: invokevirtual 117\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:tick\011()V
      //   80: iconst_1
      //   81: ireturn
      //   82: astore 5
      //   84: aload_0
      //   85: aload 5
      //   87: invokevirtual 139\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:onError\011(Ljava/lang/Throwable;)V
      //   90: goto -16 -> 74
      //   93: astore_3
      //   94: aload_0
      //   95: monitorexit
      //   96: aload_3
      //   97: athrow
      //   98: astore 4
      //   100: aload_0
      //   101: aload 4
      //   103: invokevirtual 139\011rx/internal/operators/OnSubscribeCombineLatest$MultiSourceProducer:onError\011(Ljava/lang/Throwable;)V
      //   106: goto -32 -> 74
      //
      // Exception table:
      //   from\011to\011target\011type
      //   54\01174\01182\011rx/exceptions/MissingBackpressureException
      //   2\01131\01193\011finally
      //   31\01152\01193\011finally
      //   54\01174\01193\011finally
      //   74\01176\01193\011finally
      //   84\01190\01193\011finally
      //   94\01196\01193\011finally
      //   100\011106\01193\011finally
      //   54\01174\01198\011java/lang/Throwable
    }

    public void request(long paramLong)
    {
      BackpressureUtils.getAndAddRequest(this.requested, paramLong);
      if ((!this.started.get()) && (this.started.compareAndSet(false, true)))
      {
        int i = RxRingBuffer.SIZE / this.sources.size();
        int j = RxRingBuffer.SIZE % this.sources.size();
        for (int k = 0; k < this.sources.size(); k++)
        {
          Observable localObservable = (Observable)this.sources.get(k);
          int m = i;
          if (k == -1 + this.sources.size())
            m += j;
          OnSubscribeCombineLatest.MultiSourceRequestableSubscriber localMultiSourceRequestableSubscriber = new OnSubscribeCombineLatest.MultiSourceRequestableSubscriber(k, m, this.child, this);
          this.subscribers[k] = localMultiSourceRequestableSubscriber;
          localObservable.unsafeSubscribe(localMultiSourceRequestableSubscriber);
        }
      }
      tick();
    }

    void tick()
    {
      if (WIP.getAndIncrement(this) == 0L)
      {
        int i = 0;
        while (true)
        {
          Object localObject;
          if (this.requested.get() > 0L)
          {
            localObject = this.buffer.poll();
            if (localObject != null)
            {
              if (!this.buffer.isCompleted(localObject))
                break label107;
              this.child.onCompleted();
            }
          }
          while (WIP.decrementAndGet(this) <= 0L)
          {
            if (i <= 0)
              return;
            OnSubscribeCombineLatest.MultiSourceRequestableSubscriber[] arrayOfMultiSourceRequestableSubscriber = this.subscribers;
            int j = arrayOfMultiSourceRequestableSubscriber.length;
            for (int k = 0; k < j; k++)
              arrayOfMultiSourceRequestableSubscriber[k].requestUpTo(i);
            label107: this.buffer.accept(localObject, this.child);
            i++;
            this.requested.decrementAndGet();
          }
        }
      }
    }
  }

  static final class MultiSourceRequestableSubscriber<T, R> extends Subscriber<T>
  {
    final AtomicLong emitted = new AtomicLong();
    boolean hasValue = false;
    final int index;
    final OnSubscribeCombineLatest.MultiSourceProducer<T, R> producer;

    public MultiSourceRequestableSubscriber(int paramInt1, int paramInt2, Subscriber<? super R> paramSubscriber, OnSubscribeCombineLatest.MultiSourceProducer<T, R> paramMultiSourceProducer)
    {
      super();
      this.index = paramInt1;
      this.producer = paramMultiSourceProducer;
      request(paramInt2);
    }

    public void onCompleted()
    {
      this.producer.onCompleted(this.index, this.hasValue);
    }

    public void onError(Throwable paramThrowable)
    {
      this.producer.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      this.hasValue = true;
      this.emitted.incrementAndGet();
      if (!this.producer.onNext(this.index, paramT))
        request(1L);
    }

    public void requestUpTo(long paramLong)
    {
      long l1;
      long l2;
      do
      {
        l1 = this.emitted.get();
        l2 = Math.min(l1, paramLong);
      }
      while (!this.emitted.compareAndSet(l1, l1 - l2));
      request(l2);
    }
  }

  static final class SingleSourceProducer<T, R>
    implements Producer
  {
    final Subscriber<? super R> child;
    final FuncN<? extends R> combinator;
    final Observable<? extends T> source;
    final AtomicBoolean started = new AtomicBoolean();
    final OnSubscribeCombineLatest.SingleSourceRequestableSubscriber<T, R> subscriber;

    public SingleSourceProducer(Subscriber<? super R> paramSubscriber, Observable<? extends T> paramObservable, FuncN<? extends R> paramFuncN)
    {
      this.source = paramObservable;
      this.child = paramSubscriber;
      this.combinator = paramFuncN;
      this.subscriber = new OnSubscribeCombineLatest.SingleSourceRequestableSubscriber(paramSubscriber, paramFuncN);
    }

    public void request(long paramLong)
    {
      this.subscriber.requestMore(paramLong);
      if (this.started.compareAndSet(false, true))
        this.source.unsafeSubscribe(this.subscriber);
    }
  }

  static final class SingleSourceRequestableSubscriber<T, R> extends Subscriber<T>
  {
    private final Subscriber<? super R> child;
    private final FuncN<? extends R> combinator;

    SingleSourceRequestableSubscriber(Subscriber<? super R> paramSubscriber, FuncN<? extends R> paramFuncN)
    {
      super();
      this.child = paramSubscriber;
      this.combinator = paramFuncN;
    }

    public void onCompleted()
    {
      this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      this.child.onNext(this.combinator.call(new Object[] { paramT }));
    }

    public void requestMore(long paramLong)
    {
      request(paramLong);
    }
  }
}